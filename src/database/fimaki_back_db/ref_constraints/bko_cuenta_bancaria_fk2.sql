alter table fimaki_back_db.bko_cuenta_bancaria
    add constraint bko_cuenta_bancaria_fk2
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;


-- sqlcl_snapshot {"hash":"a16a4a3b6e1826790933a4dc53b25b49417db30b","type":"REF_CONSTRAINT","name":"BKO_CUENTA_BANCARIA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}