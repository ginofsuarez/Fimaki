-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727339 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/package_bodies/iam_authentication.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/package_bodies/iam_authentication.sql:null:dd68281f702e41065eeef9138e237973f5b47049:create

create or replace package body fimaki_sec_db.iam_authentication as

	/*
		Author:      GS, Waykitech.
		Description: Description of the procedure or function
		Overview:    Overview of the functionality
	
		Parameters:
			p_username: Username to authenticate
			p_password: Password to authenticate
	
		Returns:
			boolean: true if authentication is successful, false otherwise
	
		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-05-30 GS          					Created  [REG-010]
	*/
    function login (
        p_username in varchar2,
        p_password in varchar2
    ) return boolean as
        l_exist number;
    begin
        select
            1
        into l_exist
        from
            iam_usuario
        where
                1 = 1
            and upper(p_username) = upper(nombre_usuario)
            and bloqueado_sn = 'N'
            and iam_auth_encryption.encrypt(p_password) = contrasena;

        return true;
    exception
        when others then
            apex_util.set_session_state('LOGIN_FAILED', 'Y');
            return false;
    end login;

end iam_authentication;
/

