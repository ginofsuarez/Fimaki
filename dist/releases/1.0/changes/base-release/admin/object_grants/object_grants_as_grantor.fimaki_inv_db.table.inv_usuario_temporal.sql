-- liquibase formatted sql
-- changeset ADMIN:1755640727111 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.table.inv_usuario_temporal.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.table.inv_usuario_temporal.sql:null:afcb4e97eea52e5da861077d2e21ba2352052797:create

grant insert on fimaki_inv_db.inv_usuario_temporal to fimaki_app;

grant select on fimaki_inv_db.inv_usuario_temporal to fimaki_app;

