-- liquibase formatted sql
-- changeset ADMIN:1755640727325 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_authentication.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_authentication.sql:null:40b13551bd0cfac3d97ed1218b88717c2953a517:create

grant execute on fimaki_sec_db.iam_authentication to fimaki_inv_db;

grant execute on fimaki_sec_db.iam_authentication to fimaki_app;

