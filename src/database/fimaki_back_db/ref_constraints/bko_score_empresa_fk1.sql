alter table fimaki_back_db.bko_score_empresa
    add constraint bko_score_empresa_fk1
        foreign key ( id_rol_persona )
            references fimaki_back_db.bko_rol_persona ( id_rol_persona )
        enable;


-- sqlcl_snapshot {"hash":"ff4cece78a5c277e89900808dc1e2214c4a41b56","type":"REF_CONSTRAINT","name":"BKO_SCORE_EMPRESA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}