-- liquibase formatted sql
-- changeset ADMIN:1755640727115 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.view.inv_usuario_temporal_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.view.inv_usuario_temporal_v.sql:null:9677e602a9cd35dc2acdb6dd3e4f818350dbd343:create

grant select on fimaki_inv_db.inv_usuario_temporal_v to fimaki_app;

