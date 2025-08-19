alter table fimaki_back_db.bko_direccion_persona
    add constraint bko_direccion_persona_fk
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"b77b60a153210aa6bd2158892d4a0c26be88b010","type":"REF_CONSTRAINT","name":"BKO_DIRECCION_PERSONA_FK","schemaName":"FIMAKI_BACK_DB","sxml":""}