alter table fimaki_back_db.bko_institucion_financiera
    add constraint bko_institucion_financiera_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;


-- sqlcl_snapshot {"hash":"26afaa5be3f81a5f588b2821e29728d3494df482","type":"REF_CONSTRAINT","name":"BKO_INSTITUCION_FINANCIERA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}