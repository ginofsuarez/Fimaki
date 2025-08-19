create or replace package fimaki_inv_db.inv_utils_pkg as  
  --|| Description: Genera un token de activación para un usuario temporal.
  --|| Author: Gino - Waykitech
    procedure generar_token (
        p_id_usuario in inv_usuario_temporal.id_usuario_temp%type,
        p_tipo_rc    in inv_usuario_token.tipo_rc%type
    );

  --|| Description: Envia un correo electrónico de activación al usuario temporal.
  --|| Author: Gino - Waykitech
    procedure enviar_email_activacion (
        p_id_usuario in inv_usuario_temporal.id_usuario_temp%type
    );

    function validar_cuenta_bancaria_pe (
        p_cuenta       in varchar2,
        p_tipo_cuenta  in varchar2,
        p_codigo_banco in varchar2
    ) return boolean;

  --|| Descriptcion: Resetea la contraseña de un usuario.
  --|| Author: Gino - Waykitech
    procedure reset_user_password (
        p_nombre_usuario in iam_usuario.nombre_usuario%type,
        p_ip             in varchar2,
        p_user_agent     in varchar2
    );

    function generate_recovery_code (
        p_length in number default 4
    ) return varchar2;

  --|| Description: Valida un token de recuperación.
  --|| Author: Diego - Waykitech
    function token_es_valido (
        p_correo in inv_usuario_token.correo%type,
        p_token  in inv_usuario_token.token%type
    ) return boolean;

    function check_rate_limit (
        p_ip           varchar2,
        p_user_agent   varchar2,
        p_correo       varchar2,
        p_max_attempts number default 3
    ) return boolean;

end inv_utils_pkg;
/


-- sqlcl_snapshot {"hash":"1aefe26194ed5262bb9982304fa63d78aaea0349","type":"PACKAGE_SPEC","name":"INV_UTILS_PKG","schemaName":"FIMAKI_INV_DB","sxml":""}