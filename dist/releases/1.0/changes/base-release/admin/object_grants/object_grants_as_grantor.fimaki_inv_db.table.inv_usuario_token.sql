-- liquibase formatted sql
-- changeset ADMIN:1755640727114 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.table.inv_usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.table.inv_usuario_token.sql:null:96043726fa27996296dfb0784e0df8b10c1a17ad:create

grant select on fimaki_inv_db.inv_usuario_token to fimaki_app;

grant select on fimaki_inv_db.inv_usuario_token to fimaki_sec_db;

grant update on fimaki_inv_db.inv_usuario_token to fimaki_app;

grant update on fimaki_inv_db.inv_usuario_token to fimaki_sec_db;

