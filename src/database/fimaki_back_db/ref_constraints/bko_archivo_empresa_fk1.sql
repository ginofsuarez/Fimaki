alter table fimaki_back_db.bko_archivo_empresa
    add constraint bko_archivo_empresa_fk1
        foreign key ( id_empresa )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;


-- sqlcl_snapshot {"hash":"264b5fd4f66902287569028917551c881aa59b5d","type":"REF_CONSTRAINT","name":"BKO_ARCHIVO_EMPRESA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}