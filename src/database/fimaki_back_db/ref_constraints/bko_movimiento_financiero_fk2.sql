alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk2
        foreign key ( id_factura )
            references fimaki_back_db.bko_factura ( id_factura )
        enable;


-- sqlcl_snapshot {"hash":"c977000b5398e28bb3e8d280aba6f525c14e1283","type":"REF_CONSTRAINT","name":"BKO_MOVIMIENTO_FINANCIERO_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}