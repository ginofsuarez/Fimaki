create or replace package body fimaki_sec_db.iam_auth_encryption as

    g_key raw(2000) := '438A834BFC8AC4B7496C9A8909FA66A72E7479B96D2FDAF47A0D95B14A395487';

    function encrypt (
        p_password in varchar2
    ) return raw as

        l_type   number := dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;
        l_retval raw(2000); --This will hold
                      --the encrypted data
    begin
        l_retval := dbms_crypto.encrypt(
            utl_i18n.string_to_raw(p_password, 'AL32UTF8'),
            l_type,
            iam_auth_encryption.g_key
        );

        return l_retval;
    end encrypt;

end iam_auth_encryption;
/


-- sqlcl_snapshot {"hash":"0786a2ec8408d2cbda770dd5c491e7ce5d871329","type":"PACKAGE_BODY","name":"IAM_AUTH_ENCRYPTION","schemaName":"FIMAKI_SEC_DB","sxml":""}