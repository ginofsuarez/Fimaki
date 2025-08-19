-- liquibase formatted sql
-- changeset ADMIN:1755640725826 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_movimiento_financiero.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_movimiento_financiero.sql:null:cb30db5c718f60dcf303e8f4e06e36ed81e143d5:create

grant insert on fimaki_back_db.bko_movimiento_financiero to fimaki_app;

grant select on fimaki_back_db.bko_movimiento_financiero to fimaki_app;

