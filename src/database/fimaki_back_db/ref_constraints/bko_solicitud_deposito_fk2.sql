alter table fimaki_back_db.bko_solicitud_deposito
    add constraint bko_solicitud_deposito_fk2
        foreign key ( id_movimiento_financiero )
            references fimaki_back_db.bko_movimiento_financiero ( id_movimiento_financiero )
        enable;


-- sqlcl_snapshot {"hash":"e9423e281e63faacf14ee477b3278c2f94aa34ad","type":"REF_CONSTRAINT","name":"BKO_SOLICITUD_DEPOSITO_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}