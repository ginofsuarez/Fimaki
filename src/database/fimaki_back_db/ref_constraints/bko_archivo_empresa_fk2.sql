alter table fimaki_back_db.bko_archivo_empresa
    add constraint bko_archivo_empresa_fk2
        foreign key ( id_archivo )
            references fimaki_back_db.bko_archivo ( id_archivo )
        enable;


-- sqlcl_snapshot {"hash":"cfcaac02732aadb7376aeadf6610490b6b57a67a","type":"REF_CONSTRAINT","name":"BKO_ARCHIVO_EMPRESA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}