-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726159 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk3.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk3.sql:null:01ca710a6809e6696a4e9bd12cdc41cbcef14646:create

alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk3
        foreign key ( id_inversion_factura )
            references fimaki_back_db.bko_inversion_factura ( id_inversion_factura )
        enable;

