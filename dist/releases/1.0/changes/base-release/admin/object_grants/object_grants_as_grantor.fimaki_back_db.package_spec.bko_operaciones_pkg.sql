-- liquibase formatted sql
-- changeset ADMIN:1755640725806 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_operaciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_operaciones_pkg.sql:null:f05bcd355be6e8f67dcb537271171ea9013c6566:create

grant execute on fimaki_back_db.bko_operaciones_pkg to fimaki_app;

