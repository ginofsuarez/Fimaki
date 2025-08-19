alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk1
        foreign key ( id_rol_persona )
            references fimaki_back_db.bko_rol_persona ( id_rol_persona )
        enable;


-- sqlcl_snapshot {"hash":"986f49ceb58dc32e6e3aab0e31fb852b54b08595","type":"REF_CONSTRAINT","name":"BKO_MOVIMIENTO_FINANCIERO_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}