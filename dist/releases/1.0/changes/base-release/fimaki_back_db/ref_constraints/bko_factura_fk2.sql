-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726141 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_factura_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_factura_fk2.sql:null:585d9e41149d670f181f9a66e611e4e1ce31cc10:create

alter table fimaki_back_db.bko_factura
    add constraint bko_factura_fk2
        foreign key ( id_empresa_pagador )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;

