alter table fimaki_back_db.bko_contacto_persona
    add constraint bko_contacto_persona_fk2
        foreign key ( id_contacto )
            references fimaki_back_db.bko_contacto ( id_contacto )
        enable;


-- sqlcl_snapshot {"hash":"32bc072d7ec4823544ac78f8c29d7fbb9f1cbf05","type":"REF_CONSTRAINT","name":"BKO_CONTACTO_PERSONA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}