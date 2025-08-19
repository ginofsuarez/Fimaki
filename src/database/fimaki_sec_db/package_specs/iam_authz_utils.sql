create or replace package fimaki_sec_db.iam_authz_utils authid definer is
    gc_y constant varchar2(1) := 'Y';
    gc_n constant varchar2(1) := 'N';
    gc_default constant varchar2(10) := 'ACTIVACION';
    procedure crear_usuario (
        p_nombre_usuario                in iam_usuario.nombre_usuario%type,
        p_correo                        in iam_usuario.correo%type,
        p_nombres                       in iam_usuario.nombres%type,
        p_apellido_paterno              in iam_usuario.apellido_paterno%type,
        p_apellido_materno              in iam_usuario.apellido_materno%type,
        p_contrasena                    in iam_usuario.contrasena%type,
        p_bloqueado_sn                  in iam_usuario.bloqueado_sn%type default gc_n,
        p_requiere_cambio_contrasena_sn in iam_usuario.requiere_cambio_contrasena_sn%type default gc_n,
        p_contrasena_expira_en          in iam_usuario.contrasena_expira_en%type default null,
        p_id_persona                    in iam_usuario.id_persona%type default null,
        p_id_usuario_out                out iam_usuario.id_usuario%type
    );

	--|| Description: Genera un token de activación para un usuario temporal.
	--|| Author: Gino - Waykitech
    function generate_strong_password (
        p_length in pls_integer default 12
    ) return varchar2;

	--|| Description: Cambia la contraseña de un usuario.
	--|| Author: Gino - Waykitech
    procedure cambiar_contrasena (
        p_nombre_usuario in iam_usuario.nombre_usuario%type,
        p_contrasena     in varchar2,
        p_token          in varchar2
    );

	--|| Description: Valida la fortaleza de una contraseña.
	--|| Author: Gino - Waykitech
    function validar_fortaleza_contrasena (
        p_contrasena           in varchar2,
        p_contrasena_confirmar in varchar2
    ) return varchar2;

end iam_authz_utils;
/


-- sqlcl_snapshot {"hash":"5ff27ddacd6b3aade4389c219f3aef0b58b9b9ee","type":"PACKAGE_SPEC","name":"IAM_AUTHZ_UTILS","schemaName":"FIMAKI_SEC_DB","sxml":""}