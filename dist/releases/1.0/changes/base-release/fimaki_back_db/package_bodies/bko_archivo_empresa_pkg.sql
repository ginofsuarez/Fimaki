-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640725864 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_bodies/bko_archivo_empresa_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_bodies/bko_archivo_empresa_pkg.sql:null:2a94adbe120cdce7df4f4010c604b331c8641927:create

create or replace package body fimaki_back_db.bko_archivo_empresa_pkg is

  -- Devuelve el ID del archivo si existe
    function get_id_archivo (
        p_id_empresa     in number,
        p_tipo_documento in varchar2
    ) return number is
        l_id_archivo number;
    begin
        select
            ae.id_archivo
        into l_id_archivo
        from
            bko_archivo_empresa ae
        where
                ae.id_empresa = p_id_empresa
            and ae.atributo1 = p_tipo_documento
        fetch first 1 row only;

        return l_id_archivo;
    exception
        when no_data_found then
            return null;
    end get_id_archivo;

  -- Inserta o actualiza el archivo, respetando reglas de tipo reservado
    procedure upsert_archivo (
        p_id_empresa                    in number,
        p_tipo_documento                in varchar2,
        p_nombre_archivo                in varchar2,
        p_mime_type                     in varchar2,
        p_contenido_blob                in blob,
        p_ignorar_restriccion_reservado in varchar2 default 'N'
    ) is

        l_id_archivo          number;
        l_es_reservado        boolean := false;
        l_ignorar_restriccion boolean := ( upper(p_ignorar_restriccion_reservado) = 'S' );
    begin
    -- Definir tipo reservado (puedes ampliar esta lista en el futuro)
        if upper(p_tipo_documento) = 'LOGO' then
            l_es_reservado := true;
        end if;

    -- Intentar obtener archivo existente
        l_id_archivo := get_id_archivo(p_id_empresa, p_tipo_documento);

    -- Si el tipo es reservado y no se permite modificarlo, salir
        if
            l_es_reservado
            and not l_ignorar_restriccion
        then
            return;
        end if;

    -- Si ya existe, actualizar
        if l_id_archivo is not null then
            update bko_archivo
            set
                archivo_nombre = p_nombre_archivo,
                archivo_tipo_mime = p_mime_type,
                archivo_contenido = p_contenido_blob
            where
                id_archivo = l_id_archivo;

            return;
        end if;

    -- Insertar nuevo archivo
        insert into bko_archivo (
            archivo_nombre,
            archivo_tipo_mime,
            archivo_contenido
        ) values ( p_nombre_archivo,
                   p_mime_type,
                   p_contenido_blob ) returning id_archivo into l_id_archivo;

    -- Relacionar archivo con empresa
        insert into bko_archivo_empresa (
            id_empresa,
            id_archivo,
            atributo1
        ) values ( p_id_empresa,
                   l_id_archivo,
                   p_tipo_documento );

    end upsert_archivo;

end bko_archivo_empresa_pkg;
/

