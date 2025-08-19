-- liquibase formatted sql
-- changeset ADMIN:1755640725808 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_persona_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.package_spec.bko_persona_pkg.sql:null:c64a15a1ce6f6bde8c7e37fdccbe0545ecfc4604:create

grant execute on fimaki_back_db.bko_persona_pkg to fimaki_inv_db;

grant execute on fimaki_back_db.bko_persona_pkg to fimaki_app;

