-- liquibase formatted sql
-- changeset ADMIN:1755640725817 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_cuenta_bancaria.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.bko_cuenta_bancaria.sql:null:b9f64395f04755ab94c954dc34ba7e0b7e9f7a10:create

grant delete on fimaki_back_db.bko_cuenta_bancaria to fimaki_app;

grant insert on fimaki_back_db.bko_cuenta_bancaria to fimaki_inv_db;

grant insert on fimaki_back_db.bko_cuenta_bancaria to fimaki_app;

grant select on fimaki_back_db.bko_cuenta_bancaria to fimaki_app;

grant select on fimaki_back_db.bko_cuenta_bancaria to fimaki_inv_db;

grant update on fimaki_back_db.bko_cuenta_bancaria to fimaki_inv_db;

grant update on fimaki_back_db.bko_cuenta_bancaria to fimaki_app;

