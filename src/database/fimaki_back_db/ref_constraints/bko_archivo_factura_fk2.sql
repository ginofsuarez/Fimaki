alter table fimaki_back_db.bko_archivo_factura
    add constraint bko_archivo_factura_fk2
        foreign key ( id_archivo )
            references fimaki_back_db.bko_archivo ( id_archivo )
        enable;


-- sqlcl_snapshot {"hash":"db8cf9a441da548e076f0f2c4ecf55994f63c82c","type":"REF_CONSTRAINT","name":"BKO_ARCHIVO_FACTURA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}