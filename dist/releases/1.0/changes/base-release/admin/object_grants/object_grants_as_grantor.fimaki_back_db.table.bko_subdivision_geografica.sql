-- liquibase formatted sql
-- changeset ADMIN:1755640725837 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_subdivision_geografica.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_subdivision_geografica.sql:null:758d9e8c3b8da4e7e62d55b84ea1ebf76679777d:create

grant select on fimaki_back_db.bko_subdivision_geografica to fimaki_app;

