-- liquibase formatted sql
-- changeset ADMIN:1755640727110 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.package_spec.inv_utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.package_spec.inv_utils_pkg.sql:null:275be90f19433b84d670fd8f9218804a00335856:create

grant execute on fimaki_inv_db.inv_utils_pkg to fimaki_app;

