alter table fimaki_back_db.bko_empresa
    add constraint bko_empresa_fk1
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"3ef703b54809db6b2ea174a4d45f509df626074e","type":"REF_CONSTRAINT","name":"BKO_EMPRESA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}