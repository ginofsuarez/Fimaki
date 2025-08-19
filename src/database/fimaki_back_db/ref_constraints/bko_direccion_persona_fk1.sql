alter table fimaki_back_db.bko_direccion_persona
    add constraint bko_direccion_persona_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;


-- sqlcl_snapshot {"hash":"0cfb1d7140cf5cc07934278afdb713ba7a6bbb37","type":"REF_CONSTRAINT","name":"BKO_DIRECCION_PERSONA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}