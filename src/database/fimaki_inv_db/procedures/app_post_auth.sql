create or replace procedure fimaki_inv_db.app_post_auth is
begin
    execute immediate 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS = '',.''';
end;
/


-- sqlcl_snapshot {"hash":"5a54eecc95ae3b1dcc5faa7aa7fa66f451360986","type":"PROCEDURE","name":"APP_POST_AUTH","schemaName":"FIMAKI_INV_DB","sxml":""}