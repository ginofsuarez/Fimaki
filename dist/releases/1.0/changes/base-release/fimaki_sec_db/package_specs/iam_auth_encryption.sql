-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727413 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/package_specs/iam_auth_encryption.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/package_specs/iam_auth_encryption.sql:null:f82ed7186fc2199810f35697e46814bc4ce0c8ae:create

create or replace package fimaki_sec_db.iam_auth_encryption as
    function encrypt (
        p_password in varchar2
    ) return raw;

end iam_auth_encryption;
/

