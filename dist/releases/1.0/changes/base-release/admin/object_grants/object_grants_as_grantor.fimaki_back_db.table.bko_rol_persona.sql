-- liquibase formatted sql
-- changeset ADMIN:1755640725833 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_rol_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_rol_persona.sql:null:35814e56d2c01cb50a7169fbcb79f51c70e50946:create

grant select on fimaki_back_db.bko_rol_persona to fimaki_app;

