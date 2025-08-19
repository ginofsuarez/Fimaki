-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726182 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_solicitud_deposito_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_solicitud_deposito_fk1.sql:null:02d3dda0d7fd52f027132be418e12ba85a7bd35d:create

alter table fimaki_back_db.bko_solicitud_deposito
    add constraint bko_solicitud_deposito_fk1
        foreign key ( id_cuenta_bancaria )
            references fimaki_back_db.bko_cuenta_bancaria ( id_cuenta_bancaria )
        enable;

