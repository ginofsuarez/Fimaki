-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726036 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/bko_archivo_empresa_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/bko_archivo_empresa_pkg.sql:null:7f6d19bbffa9c689b20ceaceca03b314350ee772:create

create or replace package fimaki_back_db.bko_archivo_empresa_pkg is

  -- Retorna el ID del archivo existente para una empresa y tipo
    function get_id_archivo (
        p_id_empresa     in number,
        p_tipo_documento in varchar2
    ) return number;

  -- Inserta o actualiza un archivo relacionado a una empresa
    procedure upsert_archivo (
        p_id_empresa                    in number,
        p_tipo_documento                in varchar2,
        p_nombre_archivo                in varchar2,
        p_mime_type                     in varchar2,
        p_contenido_blob                in blob,
        p_ignorar_restriccion_reservado in varchar2 default 'N'  -- 'S' o 'N'
    );

end bko_archivo_empresa_pkg;
/

