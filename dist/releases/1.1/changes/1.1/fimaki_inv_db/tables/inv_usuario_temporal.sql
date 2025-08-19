-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755642433348 stripComments:false  logicalFilePath:1.1/fimaki_inv_db/tables/inv_usuario_temporal.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/tables/inv_usuario_temporal.sql:7405126f6108217ff4dd65d8b1f240303fec8b8f:8f900de81c12f62ae99ed2d203ba0e9508966176:alter

alter table fimaki_inv_db.inv_usuario_temporal modify (
    fecha_aceptacion timestamp(6) with local time zone default current_timestamp
)
/

