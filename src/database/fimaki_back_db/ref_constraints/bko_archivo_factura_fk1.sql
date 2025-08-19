alter table fimaki_back_db.bko_archivo_factura
    add constraint bko_archivo_factura_fk1
        foreign key ( id_factura )
            references fimaki_back_db.bko_factura ( id_factura )
        enable;


-- sqlcl_snapshot {"hash":"4c0a66d0f9293773c6604fafbb2118a47f5a1738","type":"REF_CONSTRAINT","name":"BKO_ARCHIVO_FACTURA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}