alter table fimaki_back_db.bko_solicitud_deposito
    add constraint bko_solicitud_deposito_fk1
        foreign key ( id_cuenta_bancaria )
            references fimaki_back_db.bko_cuenta_bancaria ( id_cuenta_bancaria )
        enable;


-- sqlcl_snapshot {"hash":"02d3dda0d7fd52f027132be418e12ba85a7bd35d","type":"REF_CONSTRAINT","name":"BKO_SOLICITUD_DEPOSITO_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}