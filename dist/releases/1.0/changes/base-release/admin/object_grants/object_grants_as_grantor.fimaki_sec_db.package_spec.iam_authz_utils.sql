-- liquibase formatted sql
-- changeset ADMIN:1755640727326 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_authz_utils.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_authz_utils.sql:null:5a40c6a34ef3cb92a36e042f5e7b4538e1ce4ad6:create

grant execute on fimaki_sec_db.iam_authz_utils to fimaki_app;

grant execute on fimaki_sec_db.iam_authz_utils to fimaki_inv_db;

