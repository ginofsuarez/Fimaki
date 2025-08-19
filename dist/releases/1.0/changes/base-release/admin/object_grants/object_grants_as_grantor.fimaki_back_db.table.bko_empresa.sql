-- liquibase formatted sql
-- changeset ADMIN:1755640725818 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_empresa.sql:null:b8900027dad5777c3fe22c77c8560dc3228eeec9:create

grant select on fimaki_back_db.bko_empresa to fimaki_app;

