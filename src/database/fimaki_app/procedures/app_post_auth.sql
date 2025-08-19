create or replace procedure fimaki_app.app_post_auth is
begin
    execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '',.''';
end;
/


-- sqlcl_snapshot {"hash":"2e424f22184dd3550e7ae69a5fce882aba471f84","type":"PROCEDURE","name":"APP_POST_AUTH","schemaName":"FIMAKI_APP","sxml":""}