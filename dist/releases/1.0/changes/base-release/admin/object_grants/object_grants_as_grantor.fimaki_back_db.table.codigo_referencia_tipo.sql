-- liquibase formatted sql
-- changeset ADMIN:1755640725845 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.codigo_referencia_tipo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.codigo_referencia_tipo.sql:null:1d93bcd4a93d8a2d4f1cb38aa754945a733c5f8e:create

grant delete on fimaki_back_db.codigo_referencia_tipo to fimaki_inv_db;

grant delete on fimaki_back_db.codigo_referencia_tipo to fimaki_app;

grant insert on fimaki_back_db.codigo_referencia_tipo to fimaki_inv_db;

grant insert on fimaki_back_db.codigo_referencia_tipo to fimaki_app;

grant select on fimaki_back_db.codigo_referencia_tipo to fimaki_inv_db;

grant select on fimaki_back_db.codigo_referencia_tipo to fimaki_app;

grant update on fimaki_back_db.codigo_referencia_tipo to fimaki_inv_db;

grant update on fimaki_back_db.codigo_referencia_tipo to fimaki_app;

