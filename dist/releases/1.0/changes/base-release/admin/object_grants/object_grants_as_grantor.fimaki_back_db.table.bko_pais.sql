-- liquibase formatted sql
-- changeset ADMIN:1755640725828 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_pais.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_pais.sql:null:24e1ee534a6fc0c1de61b1109fc37686a89d47de:create

grant select on fimaki_back_db.bko_pais to fimaki_inv_db;

grant select on fimaki_back_db.bko_pais to fimaki_app;

