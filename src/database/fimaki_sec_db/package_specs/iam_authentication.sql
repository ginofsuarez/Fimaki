create or replace package fimaki_sec_db.iam_authentication authid definer as
    g_app_link varchar2(1000) := 'http://www/ords/f?p=2000:101';  /* CONSTANT FOR APPLICATION LINK   */
    g_app_name varchar2(30) := 'Identty And Access Management'; /* CONSTANT FOR APPLICATION NAME   */

    function login (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean;

end iam_authentication;
/


-- sqlcl_snapshot {"hash":"c30f482044bf205b9fbec0960f3511792ab29ebf","type":"PACKAGE_SPEC","name":"IAM_AUTHENTICATION","schemaName":"FIMAKI_SEC_DB","sxml":""}