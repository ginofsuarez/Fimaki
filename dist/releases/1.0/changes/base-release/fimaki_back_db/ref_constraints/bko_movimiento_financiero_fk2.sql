-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726154 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk2.sql:null:c977000b5398e28bb3e8d280aba6f525c14e1283:create

alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk2
        foreign key ( id_factura )
            references fimaki_back_db.bko_factura ( id_factura )
        enable;

