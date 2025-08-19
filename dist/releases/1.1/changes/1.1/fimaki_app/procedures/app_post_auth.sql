-- liquibase formatted sql
-- changeset FIMAKI_APP:1755642423681 stripComments:false  logicalFilePath:1.1/fimaki_app/procedures/app_post_auth.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/procedures/app_post_auth.sql:null:2e424f22184dd3550e7ae69a5fce882aba471f84:create

create or replace procedure fimaki_app.app_post_auth is
begin
    execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '',.''';
end;
/

