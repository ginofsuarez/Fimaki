alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk3
        foreign key ( id_inversion_factura )
            references fimaki_back_db.bko_inversion_factura ( id_inversion_factura )
        enable;


-- sqlcl_snapshot {"hash":"01ca710a6809e6696a4e9bd12cdc41cbcef14646","type":"REF_CONSTRAINT","name":"BKO_MOVIMIENTO_FINANCIERO_FK3","schemaName":"FIMAKI_BACK_DB","sxml":""}