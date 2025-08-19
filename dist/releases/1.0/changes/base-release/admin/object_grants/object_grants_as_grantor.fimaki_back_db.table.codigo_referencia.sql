-- liquibase formatted sql
-- changeset ADMIN:1755640725840 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.codigo_referencia.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.codigo_referencia.sql:null:63c1a9f2561f92dfaac24afd083cee8a4635bd3f:create

grant insert on fimaki_back_db.codigo_referencia to fimaki_inv_db;

grant select on fimaki_back_db.codigo_referencia to fimaki_inv_db;

grant select on fimaki_back_db.codigo_referencia to fimaki_app;

grant update on fimaki_back_db.codigo_referencia to fimaki_inv_db;

