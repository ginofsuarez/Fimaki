alter table fimaki_back_db.bko_persona
    add constraint bko_persona_fk2
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;


-- sqlcl_snapshot {"hash":"0c3ac8aef268c98ff2c8ca5268fc595d9367a8c4","type":"REF_CONSTRAINT","name":"BKO_PERSONA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}