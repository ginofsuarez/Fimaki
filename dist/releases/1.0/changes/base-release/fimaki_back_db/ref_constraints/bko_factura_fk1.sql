-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726137 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_factura_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_factura_fk1.sql:null:6e704b6b0f9e6f0cfe1c922cd6e74bcb9ffb2855:create

alter table fimaki_back_db.bko_factura
    add constraint bko_factura_fk1
        foreign key ( id_empresa_cedente )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;

