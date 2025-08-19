-- liquibase formatted sql
-- changeset ADMIN:1755640727109 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.package_spec.inv_registro_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.package_spec.inv_registro_pkg.sql:null:88bfbf1d8fc76cf9bae76f5edb73c491982a2c01:create

grant execute on fimaki_inv_db.inv_registro_pkg to fimaki_app;

