-- liquibase formatted sql
-- changeset ADMIN:1755640725836 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_solicitud_deposito.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_solicitud_deposito.sql:null:9b08bbc0e74fdfc26aba9652fde16cf888b3e6bf:create

grant insert on fimaki_back_db.bko_solicitud_deposito to fimaki_inv_db;

grant insert on fimaki_back_db.bko_solicitud_deposito to fimaki_app;

grant select on fimaki_back_db.bko_solicitud_deposito to fimaki_inv_db;

grant select on fimaki_back_db.bko_solicitud_deposito to fimaki_app;

