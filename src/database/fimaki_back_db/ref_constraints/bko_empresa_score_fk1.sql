alter table fimaki_back_db.bko_empresa_score
    add constraint bko_empresa_score_fk1
        foreign key ( id_empresa )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;


-- sqlcl_snapshot {"hash":"2c5774c93e722fd313cef1c7355ae3863f9690f6","type":"REF_CONSTRAINT","name":"BKO_EMPRESA_SCORE_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}