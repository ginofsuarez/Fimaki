-- liquibase formatted sql
-- changeset ADMIN:1755640725811 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_transacciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_transacciones_pkg.sql:null:ad89eb099e04bd009b8d85d9422948b9c4a40673:create

grant execute on fimaki_back_db.bko_transacciones_pkg to fimaki_app;

