create or replace package fimaki_sec_db.iam_auth_encryption as
    function encrypt (
        p_password in varchar2
    ) return raw;

end iam_auth_encryption;
/


-- sqlcl_snapshot {"hash":"f82ed7186fc2199810f35697e46814bc4ce0c8ae","type":"PACKAGE_SPEC","name":"IAM_AUTH_ENCRYPTION","schemaName":"FIMAKI_SEC_DB","sxml":""}