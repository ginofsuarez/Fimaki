-- liquibase formatted sql
-- changeset ADMIN:1755640727323 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_auth_encryption.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_auth_encryption.sql:null:a60d37ffbd269f5cf2964f770faf6c4d4918e904:create

grant execute on fimaki_sec_db.iam_auth_encryption to fimaki_app;

grant execute on fimaki_sec_db.iam_auth_encryption to fimaki_inv_db;

