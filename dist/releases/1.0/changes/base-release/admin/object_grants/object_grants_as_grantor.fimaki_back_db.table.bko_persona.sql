-- liquibase formatted sql
-- changeset ADMIN:1755640725832 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_persona.sql:null:ba56b29433af794a90a8cdff6b8f43aab26648f3:create

grant insert on fimaki_back_db.bko_persona to fimaki_sec_db;

grant insert on fimaki_back_db.bko_persona to fimaki_inv_db;

grant select on fimaki_back_db.bko_persona to fimaki_inv_db;

grant select on fimaki_back_db.bko_persona to fimaki_sec_db;

grant select on fimaki_back_db.bko_persona to fimaki_app;

