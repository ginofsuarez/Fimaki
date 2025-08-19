alter table fimaki_back_db.bko_contacto_persona
    add constraint bko_contacto_persona_fk1
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"adce6f2d97c428eedbd4f3b97af22802329df054","type":"REF_CONSTRAINT","name":"BKO_CONTACTO_PERSONA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}