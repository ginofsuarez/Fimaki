alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk4
        foreign key ( id_deposito )
            references fimaki_back_db.bko_solicitud_deposito ( id_deposito )
        enable;


-- sqlcl_snapshot {"hash":"4b2e0bb9b7402b953b37d915d61bdc6fb7c8bbfe","type":"REF_CONSTRAINT","name":"BKO_MOVIMIENTO_FINANCIERO_FK4","schemaName":"FIMAKI_BACK_DB","sxml":""}