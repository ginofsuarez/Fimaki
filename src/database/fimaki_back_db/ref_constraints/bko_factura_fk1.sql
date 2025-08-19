alter table fimaki_back_db.bko_factura
    add constraint bko_factura_fk1
        foreign key ( id_empresa_cedente )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;


-- sqlcl_snapshot {"hash":"6e704b6b0f9e6f0cfe1c922cd6e74bcb9ffb2855","type":"REF_CONSTRAINT","name":"BKO_FACTURA_FK1","schemaName":"FIMAKI_BACK_DB","sxml":""}