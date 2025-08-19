create or replace force editionable view fimaki_app.emp_archivos_tmp_v (
    id_tmp,
    id_archivo_empresa,
    id_archivo,
    archivo_nombre,
    archivo_tipo_mime,
    tipo_documento,
    deleted_ind,
    descargar,
    blob001
) as
    select
        ac.seq_id                      as id_tmp,
        ac.c004                        as id_archivo_empresa,
        ac.c005                        as id_archivo,
        ac.c001                        as archivo_nombre,
        ac.c002                        as archivo_tipo_mime,
        ac.c003                        as tipo_documento,
        ac.c006                        as deleted_ind,
        dbms_lob.getlength(ac.blob001) as descargar,
        ac.blob001
    from
        apex_collections ac
    where
            ac.collection_name = 'EMP_ARCHIVOS_TMP'
        and nvl(ac.c006, 'N') = 'N';


-- sqlcl_snapshot {"hash":"1904d9b3120e6c75eb08ac0cae2df11739048a10","type":"VIEW","name":"EMP_ARCHIVOS_TMP_V","schemaName":"FIMAKI_APP","sxml":""}