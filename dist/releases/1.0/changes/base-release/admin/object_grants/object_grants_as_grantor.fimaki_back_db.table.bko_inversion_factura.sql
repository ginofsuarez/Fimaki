-- liquibase formatted sql
-- changeset ADMIN:1755640725824 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_inversion_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_inversion_factura.sql:null:6d8886228e5b0ca9368a94d770ae4d2fc5cd6444:create

grant insert on fimaki_back_db.bko_inversion_factura to fimaki_app;

grant select on fimaki_back_db.bko_inversion_factura to fimaki_app;

