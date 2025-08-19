-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727241 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/procedures/app_post_auth.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/procedures/app_post_auth.sql:null:5a54eecc95ae3b1dcc5faa7aa7fa66f451360986:create

create or replace procedure fimaki_inv_db.app_post_auth is
begin
    execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '',.''';
end;
/

