alter table fimaki_back_db.bko_factura
    add constraint bko_factura_fk2
        foreign key ( id_empresa_pagador )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;


-- sqlcl_snapshot {"hash":"585d9e41149d670f181f9a66e611e4e1ce31cc10","type":"REF_CONSTRAINT","name":"BKO_FACTURA_FK2","schemaName":"FIMAKI_BACK_DB","sxml":""}