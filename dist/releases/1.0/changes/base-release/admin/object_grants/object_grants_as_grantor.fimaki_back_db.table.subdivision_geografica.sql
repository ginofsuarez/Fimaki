-- liquibase formatted sql
-- changeset ADMIN:1755640725846 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.subdivision_geografica.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.subdivision_geografica.sql:null:897c610d076bebb27f388512485d60ea36f0bc6e:create

grant select on fimaki_back_db.subdivision_geografica to fimaki_inv_db;

