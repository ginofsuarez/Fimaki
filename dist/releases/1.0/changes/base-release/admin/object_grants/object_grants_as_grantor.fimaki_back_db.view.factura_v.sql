-- liquibase formatted sql
-- changeset ADMIN:1755640725850 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.view.factura_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.view.factura_v.sql:null:b61dc756e2f9086805d0a026e18b0f2ef310ccbe:create

grant select on fimaki_back_db.factura_v to fimaki_app;

