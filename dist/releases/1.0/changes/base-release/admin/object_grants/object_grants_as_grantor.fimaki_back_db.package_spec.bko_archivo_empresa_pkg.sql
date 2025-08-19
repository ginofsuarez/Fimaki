-- liquibase formatted sql
-- changeset ADMIN:1755640725804 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_archivo_empresa_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_archivo_empresa_pkg.sql:null:21fb48895a519981534470ec713679775b760477:create

grant execute on fimaki_back_db.bko_archivo_empresa_pkg to fimaki_app;

