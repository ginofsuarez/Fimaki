-- liquibase formatted sql
-- changeset ADMIN:1755640725810 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_solicitud_deposito_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_solicitud_deposito_pkg.sql:null:fe323b2e38205ea86890c75df900645955896f11:create

grant execute on fimaki_back_db.bko_solicitud_deposito_pkg to fimaki_app;

