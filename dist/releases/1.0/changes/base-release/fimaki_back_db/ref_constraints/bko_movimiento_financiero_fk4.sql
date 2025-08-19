-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726164 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk4.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk4.sql:null:4b2e0bb9b7402b953b37d915d61bdc6fb7c8bbfe:create

alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk4
        foreign key ( id_deposito )
            references fimaki_back_db.bko_solicitud_deposito ( id_deposito )
        enable;

