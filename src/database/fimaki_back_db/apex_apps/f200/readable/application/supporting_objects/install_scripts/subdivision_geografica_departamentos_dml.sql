declare
    l_id_pais number;

    --Provincias
    l_departamentos varchar2(4000) := 'Amazonas:Ancash:Apurímac:Arequipa:Ayacucho:Cajamarca:Callao:Cusco:Huancavelica:Huánuco:Ica:Junín:La Libertad:Lambayeque:Lima:Loreto:Madre de Dios:Moquegua:Pasco:Piura:Puno:San Martín:Tacna:Tumbes:Ucayali';
    l_tipo_rc varchar2(4000) := 'DEPT';
    l_nivel number := 1;
    l_activo_sn varchar2(1) := 'S';

begin
    select id_pais
      into l_id_pais
      from pais
     where nombre = 'Perú';
    
    for registro in (select column_value as nombre from table(apex_string.split(l_departamentos,':'))) loop
        merge into subdivision_geografica x
        using (select l_id_pais as id_pais
                    , registro.nombre as nombre
                    , l_tipo_rc as tipo_rc
                    , l_nivel as nivel
                    , l_activo_sn as activo_sn
                 from dual) y
           on (upper(x.nombre) = upper(y.nombre) and x.id_pais = y.id_pais)
        when matched then
            update set x.tipo_rc = y.tipo_rc
                     , x.nivel = y.nivel
                     , x.activo_sn = y.activo_sn
                 where upper(x.nombre) = upper(y.nombre) 
                   and x.id_pais = y.id_pais
        when not matched then
            insert (x.id_pais, x.nombre, x.tipo_rc, x.nivel, x.activo_sn)
            values (y.id_pais, y.nombre, y.tipo_rc, y.nivel, y.activo_sn);
    end loop;
   
    commit;
end;