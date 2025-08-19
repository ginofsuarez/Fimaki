-- liquibase formatted sql
-- changeset ADMIN:1755640725822 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_institucion_financiera.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_institucion_financiera.sql:null:caf647a470108f1f03f829c087a308f016003f94:create

grant insert on fimaki_back_db.bko_institucion_financiera to fimaki_inv_db;

grant insert on fimaki_back_db.bko_institucion_financiera to fimaki_app;

grant select on fimaki_back_db.bko_institucion_financiera to fimaki_inv_db;

grant select on fimaki_back_db.bko_institucion_financiera to fimaki_app;

