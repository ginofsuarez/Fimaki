-- liquibase formatted sql
-- changeset ADMIN:1755640727329 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_sec_db.table.iam_usuario.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/object_grants/object_grants_as_grantor.fimaki_sec_db.table.iam_usuario.sql:null:92e43897895992c6782a30ad361c525fe8471e97:create

grant insert on fimaki_sec_db.iam_usuario to fimaki_inv_db;

grant select on fimaki_sec_db.iam_usuario to fimaki_back_db;

grant select on fimaki_sec_db.iam_usuario to fimaki_inv_db;

grant select on fimaki_sec_db.iam_usuario to fimaki_app;

