-- liquibase formatted sql
-- changeset ADMIN:1755640725820 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_factura.sql:null:6f119ca680afcc2443b45970b4d836cb241fe1a8:create

grant select on fimaki_back_db.bko_factura to fimaki_app;

