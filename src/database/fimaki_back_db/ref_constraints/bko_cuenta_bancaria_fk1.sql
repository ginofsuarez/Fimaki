alter table fimaki_back_db.bko_cuenta_bancaria
    add constraint bko_cuenta_bancaria_fk1
        foreign key ( id_institucion )
            references fimaki_back_db.bko_institucion_financiera ( id_institucion )
        enable;


-- sqlcl_snapshot {"hash":"e29736a41b347eec4545b5b00d0fcd79faa1b803","type":"REF_CONSTRAINT","name":"BKO_CUENTA_BANCARIA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}