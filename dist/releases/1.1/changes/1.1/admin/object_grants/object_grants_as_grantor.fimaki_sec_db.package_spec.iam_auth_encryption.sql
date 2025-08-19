-- liquibase formatted sql
-- changeset ADMIN:1755642433741 stripComments:false  logicalFilePath:1.1/admin/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_auth_encryption.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/object_grants/object_grants_as_grantor.fimaki_sec_db.package_spec.iam_auth_encryption.sql:a60d37ffbd269f5cf2964f770faf6c4d4918e904:df62d6de8a50e57733b06f4773c496d0c1813549:alter

grant execute on fimaki_sec_db.iam_auth_encryption to fimaki_inv_db;

