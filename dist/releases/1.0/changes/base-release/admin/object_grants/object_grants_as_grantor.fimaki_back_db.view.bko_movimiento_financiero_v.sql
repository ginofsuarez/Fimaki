-- liquibase formatted sql
-- changeset ADMIN:1755640725849 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.view.bko_movimiento_financiero_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.view.bko_movimiento_financiero_v.sql:null:2cc4302d9304d6da7e02d62eab54111b3c76ddf4:create

grant select on fimaki_back_db.bko_movimiento_financiero_v to fimaki_app;

