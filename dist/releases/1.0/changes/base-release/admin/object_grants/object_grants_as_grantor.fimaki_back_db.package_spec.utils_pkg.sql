-- liquibase formatted sql
-- changeset ADMIN:1755640725813 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.utils_pkg.sql:null:e9ad7a4a7e402f928edc72d8031233c97653de9d:create

grant execute on fimaki_back_db.utils_pkg to fimaki_sec_db;

grant execute on fimaki_back_db.utils_pkg to fimaki_inv_db;

