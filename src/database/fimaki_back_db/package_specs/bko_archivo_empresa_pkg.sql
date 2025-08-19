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


-- sqlcl_snapshot {"hash":"7f6d19bbffa9c689b20ceaceca03b314350ee772","type":"PACKAGE_SPEC","name":"BKO_ARCHIVO_EMPRESA_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}