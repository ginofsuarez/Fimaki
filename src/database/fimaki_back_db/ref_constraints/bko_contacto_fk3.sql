alter table fimaki_back_db.bko_contacto
    add constraint bko_contacto_fk3
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"ed91f9cb61cb0e9d8bf2e364397a2f8c8f73baef","type":"REF_CONSTRAINT","name":"BKO_CONTACTO_FK3","schemaName":"FIMAKI_BACK_DB","sxml":""}