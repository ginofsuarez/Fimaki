create or replace package body fimaki_back_db.bko_empresa_pkg as

    procedure upsert_bko_empresa (
        p_row in out bko_empresa%rowtype
    ) is
    begin
        if p_row.id_empresa is null then
            insert into bko_empresa (
                actividad_economica_rc,
                fecha_constitucion,
                pagina_web,
                estado_rc,
                id_persona,
                nombre_comercial,
                tipo_sociedad_rc,
                tamano_rc,
                ciiu_rc,
                ambito_operacional_rc,
                regimen_tributario_rc,
                tipo_contribuyente_rc,
                score_cedente_rc,
                score_pagador_rc,
                archivo_nombre,
                archivo_tipo_mime,
                archivo_contenido
            ) values ( p_row.actividad_economica_rc,
                       p_row.fecha_constitucion,
                       p_row.pagina_web,
                       p_row.estado_rc,
                       p_row.id_persona,
                       p_row.nombre_comercial,
                       p_row.tipo_sociedad_rc,
                       p_row.tamano_rc,
                       p_row.ciiu_rc,
                       p_row.ambito_operacional_rc,
                       p_row.regimen_tributario_rc,
                       p_row.tipo_contribuyente_rc,
                       p_row.score_cedente_rc,
                       p_row.score_pagador_rc,
                       p_row.archivo_nombre,
                       p_row.archivo_tipo_mime,
                       p_row.archivo_contenido ) returning id_empresa into p_row.id_empresa;

        else
            update bko_empresa
            set
                actividad_economica_rc = p_row.actividad_economica_rc,
                fecha_constitucion = p_row.fecha_constitucion,
                pagina_web = p_row.pagina_web,
                estado_rc = p_row.estado_rc,
                id_persona = p_row.id_persona,
                nombre_comercial = p_row.nombre_comercial,
                tipo_sociedad_rc = p_row.tipo_sociedad_rc,
                tamano_rc = p_row.tamano_rc,
                ciiu_rc = p_row.ciiu_rc,
                ambito_operacional_rc = p_row.ambito_operacional_rc,
                regimen_tributario_rc = p_row.regimen_tributario_rc,
                tipo_contribuyente_rc = p_row.tipo_contribuyente_rc,
                score_cedente_rc = p_row.score_cedente_rc,
                score_pagador_rc = p_row.score_pagador_rc,
                archivo_nombre = p_row.archivo_nombre,
                archivo_tipo_mime = p_row.archivo_tipo_mime,
                archivo_contenido = p_row.archivo_contenido
            where
                id_empresa = p_row.id_empresa;

        end if;
    exception
        when others then
            raise_application_error(-20001, 'Error en upsert_bko_empresa: ' || sqlerrm);
    end;

    function es_ruc_valido (
        p_ruc in varchar2
    ) return varchar2 is

        l_ruc      varchar2(11) := trim(p_ruc);
        l_dv_real  number;
        l_dv_calc  number;
        l_suma     number := 0;
        l_factores sys.odcinumberlist := sys.odcinumberlist(5, 4, 3, 2, 7,
                                                            6, 5, 4, 3, 2);
        l_prefix   varchar2(2);
    begin
      -- Validar que sean 11 dígitos numéricos
        if length(l_ruc) != 11
        or not regexp_like(l_ruc, '^\d{11}$') then
            return 'N';
        end if;

      -- Validar prefijos válidos: 10, 15, 16, 17, 18, 20
        l_prefix := substr(l_ruc, 1, 2);
        if l_prefix not in ( '10', '15', '16', '17', '18',
                             '20' ) then
            return 'N';
        end if;

      -- Calcular suma ponderada
        for i in 1..10 loop
            l_suma := l_suma + to_number ( substr(l_ruc, i, 1) ) * l_factores(i);
        end loop;

        l_dv_calc := 11 - mod(l_suma, 11);
      -- if l_dv_calc = 10 or l_dv_calc = 11 then
      --   l_dv_calc := 0;
      -- end if;

        if l_dv_calc = 10 then
            l_dv_calc := 0;
        elsif l_dv_calc = 11 then
            l_dv_calc := 1;
        end if;

        l_dv_real := to_number ( substr(l_ruc, 11, 1) );
        if l_dv_real = l_dv_calc then
            return 'S';
        else
            return 'N';
        end if;
    exception
        when others then
            return 'N';
    end es_ruc_valido;

end bko_empresa_pkg;
/


-- sqlcl_snapshot {"hash":"4a8d02a90d279b462bfba4c4a3c0a8383775a7a8","type":"PACKAGE_BODY","name":"BKO_EMPRESA_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}