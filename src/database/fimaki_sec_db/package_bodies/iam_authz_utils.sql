create or replace package body fimaki_sec_db.iam_authz_utils is

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
    ) is
        l_id_usuario iam_usuario.id_usuario%type;
    begin
			-- Verificar si el usuario ya existe
        begin
            select
                id_usuario
            into l_id_usuario
            from
                iam_usuario
            where
                upper(nombre_usuario) = upper(p_nombre_usuario);

        exception
            when no_data_found then
                l_id_usuario := null;
        end;

			-- Si el usuario no existe, insertar un nuevo registro
        if l_id_usuario is null then
            insert into iam_usuario (
                nombre_usuario,
                correo,
                nombres,
                apellido_paterno,
                apellido_materno,
                contrasena,
                bloqueado_sn,
                requiere_cambio_contrasena_sn,
                contrasena_expira_en,
                id_persona
            ) values ( lower(p_nombre_usuario),
                       lower(p_correo),
                       p_nombres,
                       p_apellido_paterno,
                       p_apellido_materno,
                       p_contrasena,--IAM_AUTH_ENCRYPTION.encrypt(p_contrasena),
                       p_bloqueado_sn,
                       p_requiere_cambio_contrasena_sn,
                       p_contrasena_expira_en,
                       p_id_persona ) returning id_usuario into l_id_usuario;

        end if;

			-- Asignar el id del usuario creado o encontrado al parámetro de salida
        p_id_usuario_out := l_id_usuario;
    exception
        -- WHEN NOT_DATA_FOUND THEN
        -- RAISE_APPLICATION_ERROR(-20001, 'Error en el procedimiento CREAR_USUARIO: ' || SQLERRM);    
        when others then
            raise_application_error(-20001, 'Error en el procedimiento CREAR_USUARIO: ' || sqlerrm);
    end crear_usuario;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Validar fortaleza de contraseña.
		Overview:    
			Esta función valida la fortaleza de una contraseña según varios criterios:
			- Longitud mínima y máxima
			- Inclusión de mayúsculas, minúsculas, números y caracteres especiales
			- No permitir contraseñas comunes o repetitivas

			Devuelve un mensaje indicando si la contraseña es válida o no, junto con los errores específicos.

		Parameters: 
			p_contrasena IN VARCHAR2: La contraseña a validar.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-08-02 Gino Suarez          Created.
	*/
    function validar_fortaleza_contrasena (
        p_contrasena           in varchar2,
        p_contrasena_confirmar in varchar2
    ) return varchar2 is

        v_longitud_minima        constant number := 8;
        v_longitud_maxima        constant number := 50;
        v_tiene_mayuscula        boolean := false;
        v_tiene_minuscula        boolean := false;
        v_tiene_numero           boolean := false;
        v_tiene_especial         boolean := false;
        v_caracteres_especiales  constant varchar2(20) := '!@#$%&*.-_';
    -- Solo las contraseñas MÁS comunes
        v_contrasenas_prohibidas varchar2(200) := 'password,123456,qwerty,admin,factoring';
        v_longitud               number;
        v_caracter               char(1);
        v_errores                varchar2(1000) := '';
        v_puntos_fuerza          number := 0;
    begin
    -- Verificar si las contraseñas coinciden
        if p_contrasena is null
           or p_contrasena_confirmar is null then
            return 'Por favor ingresa una contraseña y su confirmación';
        elsif p_contrasena != p_contrasena_confirmar then
            return 'Las contraseñas no coinciden';
        end if;

		-- Verificar si la contraseña es NULL o vacía
        if p_contrasena is null
           or length(trim(p_contrasena)) = 0 then
            return 'Por favor ingresa una contraseña';
        end if;

        v_longitud := length(p_contrasena);

    -- REQUISITOS OBLIGATORIOS (más flexibles)

    -- 1. Longitud mínima
        if v_longitud < v_longitud_minima then
            v_errores := v_errores
                         || 'La contraseña debe tener al menos '
                         || v_longitud_minima
                         || ' caracteres. <br>';
        end if;

    -- 2. Longitud máxima
        if v_longitud > v_longitud_maxima then
            v_errores := v_errores
                         || 'Máximo '
                         || v_longitud_maxima
                         || ' caracteres. <br>';
        end if;

    -- Analizar caracteres
        for i in 1..v_longitud loop
            v_caracter := substr(p_contrasena, i, 1);
            if ascii(v_caracter) between 65 and 90 then
                v_tiene_mayuscula := true;
                v_puntos_fuerza := v_puntos_fuerza + 1;
            end if;

            if ascii(v_caracter) between 97 and 122 then
                v_tiene_minuscula := true;
                v_puntos_fuerza := v_puntos_fuerza + 1;
            end if;

            if ascii(v_caracter) between 48 and 57 then
                v_tiene_numero := true;
                v_puntos_fuerza := v_puntos_fuerza + 1;
            end if;

            if instr(v_caracteres_especiales, v_caracter) > 0 then
                v_tiene_especial := true;
                v_puntos_fuerza := v_puntos_fuerza + 2; -- Más peso a caracteres especiales
            end if;

        end loop;

    -- SISTEMA DE PUNTOS: Necesita al menos 2 de 3 criterios básicos
    -- O tener caracteres especiales (más seguro)

        if v_tiene_especial then
        -- Si tiene especiales, solo necesita letras O números
            if
                not ( v_tiene_mayuscula
                or v_tiene_minuscula )
                and not v_tiene_numero
            then
                v_errores := v_errores || 'La contraseña debe contener letras o números además de símbolos. <br>';
            end if;
        else
        -- Sin especiales, necesita los 3 tipos básicos
            if not ( v_tiene_mayuscula
            or v_tiene_minuscula ) then
                v_errores := v_errores || 'La contraseña debe contener letras. <br>';
            end if;

            if not v_tiene_numero then
                v_errores := v_errores || 'La contraseña debe contener al menos un número. <br>';
            end if;

        -- Sugerir pero no obligar caracteres especiales
            if v_puntos_fuerza < 3 then
                v_errores := v_errores
                             || 'Sugerencia: Usa símbolos ('
                             || v_caracteres_especiales
                             || ') para mayor seguridad. <br>';
            end if;

        end if;

    -- 3. Verificar solo las contraseñas MÁS obvias
        if instr(
            lower(v_contrasenas_prohibidas),
            lower(p_contrasena)
        ) > 0 then
            v_errores := v_errores || 'Esta contraseña es muy común, por favor elige otra. <br>';
        end if;

    -- 4. Solo verificar repeticiones muy obvias (4+ caracteres iguales)
        for i in 1..( v_longitud - 3 ) loop
            if
                substr(p_contrasena, i, 1) = substr(p_contrasena, i + 1, 1)
                and substr(p_contrasena, i + 1, 1) = substr(p_contrasena, i + 2, 1)
                and substr(p_contrasena, i + 2, 1) = substr(p_contrasena, i + 3, 1)
            then
                v_errores := v_errores || 'Evita repetir el mismo caracter muchas veces. <br>';
                exit;
            end if;
        end loop;

    -- Resultado final
        if length(v_errores) = 0 then
            if v_puntos_fuerza >= 5 then
                return 'VALIDA: Contraseña segura ✓';
            elsif v_puntos_fuerza >= 3 then
                return 'VALIDA: Contraseña aceptable ✓';
            else
                return 'VALIDA: Contraseña válida ✓';
            end if;
        else
            return rtrim(v_errores);
        end if;

    exception
        when others then
            return 'Error al validar contraseña';
    end validar_fortaleza_contrasena;

-- FUNCTION evaluar_fuerza_contrasena(
--     p_contrasena IN VARCHAR2
-- ) RETURN VARCHAR2
-- IS
--     v_puntos NUMBER := 0;
--     v_longitud NUMBER;
--     v_feedback VARCHAR2(500) := '';
-- BEGIN
--     IF p_contrasena IS NULL THEN
--         RETURN 'Sin contraseña';
--     END IF;

--     v_longitud := LENGTH(p_contrasena);

--     -- Puntos por longitud
--     IF v_longitud >= 8 THEN v_puntos := v_puntos + 1; END IF;
--     IF v_longitud >= 12 THEN v_puntos := v_puntos + 1; END IF;

--     -- Puntos por variedad
--     IF REGEXP_LIKE(p_contrasena, '[A-Z]') THEN v_puntos := v_puntos + 1; END IF;
--     IF REGEXP_LIKE(p_contrasena, '[a-z]') THEN v_puntos := v_puntos + 1; END IF;
--     IF REGEXP_LIKE(p_contrasena, '[0-9]') THEN v_puntos := v_puntos + 1; END IF;
--     IF REGEXP_LIKE(p_contrasena, '[!@#$%&*.\-_]') THEN v_puntos := v_puntos + 2; END IF;

--     -- Clasificación
--     IF v_puntos <= 2 THEN
--         RETURN 'DÉBIL 🔴';
--     ELSIF v_puntos <= 4 THEN
--         RETURN 'MEDIA 🟡';
--     ELSIF v_puntos <= 6 THEN
--         RETURN 'FUERTE 🟢';
--     ELSE
--         RETURN 'MUY FUERTE 🔒';
--     END IF;
-- END evaluar_fuerza_contrasena;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Generar contraseña fuerte.
		Overview:    
			Esta función genera una contraseña fuerte aleatoria de una longitud especificada.
			La contraseña incluye al menos un carácter de cada categoría: mayúsculas, minúsculas, dígitos y caracteres especiales.

		Parameters: 
			No parameters.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-29 Gino Suarez          Created
	*/
    function generate_strong_password (
        p_length in pls_integer default 12
    ) return varchar2 is

        l_password varchar2(4000 char); -- Character-based sizing for multibyte support
        l_chars    constant varchar2(100 char) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                                               || 'abcdefghijklmnopqrstuvwxyz'
                                               || '0123456789'
                                               || '!@#$%^&*()-_=+[]{}|;:,.<>?';
        l_upper    constant varchar2(26 char) := 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        l_lower    constant varchar2(26 char) := 'abcdefghijklmnopqrstuvwxyz';
        l_digits   constant varchar2(10 char) := '0123456789';
        l_special  constant varchar2(26 char) := '!@#$%^&*()-_=+[]{}|;:,.<>?';

        function get_random_char (
            p_char_set in varchar2
        ) return varchar2 is
            l_index pls_integer;
        begin
					-- Use DBMS_CRYPTO for cryptographically secure random number
            l_index := mod(
                abs(dbms_crypto.randominteger),
                length(p_char_set)
            ) + 1;

            return substr(p_char_set, l_index, 1);
        end get_random_char;

    begin
			-- Validate input length
        if p_length < 8 then
            raise_application_error(-20001, 'La longitud de la contraseña debe ser de al menos 8 caracteres');
        end if;
        if p_length > 4000 then
            raise_application_error(-20002, 'La longitud de la contraseña no puede exceder 4000 caracteres');
        end if;

			-- Initialize password with one character from each required category
        l_password := get_random_char(l_upper)
                      || get_random_char(l_lower)
                      || get_random_char(l_digits)
                      || get_random_char(l_special);

			-- Fill remaining length with random characters
        for i in 1..( p_length - 4 ) loop
            l_password := l_password || get_random_char(l_chars);
        end loop;

			-- Shuffle password using Fisher-Yates algorithm
        declare
            l_temp_char varchar2(1 char);
            l_index     pls_integer;
            l_length    pls_integer := length(l_password);
        begin
            for i in reverse 1..l_length loop
							-- Random index from 1 to i
                l_index := mod(
                    abs(dbms_crypto.randominteger),
                    i
                ) + 1;
							-- Swap characters at positions i and l_index
                l_temp_char := substr(l_password, i, 1);
                l_password := substr(l_password, 1, i - 1)
                              || substr(l_password, l_index, 1)
                              || substr(l_password, i + 1);

                l_password := substr(l_password, 1, l_index - 1)
                              || l_temp_char
                              || substr(l_password, l_index + 1);

            end loop;
        end;

        return l_password;
    exception
        when others then
            raise_application_error(-20003, 'Error al generar la contraseña: ' || sqlerrm);
    end generate_strong_password;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Cambia la contraseña de un usuario.
		Overview:    
			Este procedimiento cambia la contraseña de un usuario especificado.
			Requiere el nombre de usuario y la nueva contraseña como parámetros de entrada.

		Parameters: 
			p_nombre_usuario IN iam_usuario.nombre_usuario%TYPE: Nombre de usuario del usuario cuya contraseña se cambiará.
			p_contrasena IN iam_usuario.contrasena%TYPE: Nueva contraseña para el usuario.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-31 Gino Suarez          Created
	*/
    procedure cambiar_contrasena (
        p_nombre_usuario in iam_usuario.nombre_usuario%type,
        p_contrasena     in varchar2,
        p_token          in varchar2
    ) is

        l_id_usuario  iam_usuario.id_usuario%type;
        l_usuario     iam_usuario%rowtype;
        l_asunto      varchar2(4000);
        l_cuerpo_html clob;
        l_nombres     iam_usuario.nombres%type;
        l_correo      iam_usuario.correo%type;
        l_from_email  varchar2(1000) := utils_pkg.get_variable('CORREO_NOTIF');
    begin
		-- Verificar si el usuario existe
        select
            *
        into l_usuario
        from
            iam_usuario
        where
            upper(nombre_usuario) = upper(p_nombre_usuario);

		--Validar que el token de activacion es válido
        select
            count(1)
        into l_id_usuario
        from
            inv_usuario_token
        where
                token = iam_auth_encryption.encrypt(p_token)
            and usado = 'N'
            and current_timestamp <= expiracion
            and tipo_rc = 'RECUPERACION'
            and upper(correo) = upper(l_usuario.correo);

        if l_id_usuario = 0 then
            raise_application_error(-20002, 'Token de activación inválido o expirado');
        end if;

		-- Si el usuario existe, actualizar la contraseña
        update iam_usuario
        set
            contrasena = iam_auth_encryption.encrypt(p_contrasena)
        where
            id_usuario = l_usuario.id_usuario;

		-- Marcar el token como usado
        update inv_usuario_token
        set
            usado = 'S'
        where
                token = iam_auth_encryption.encrypt(p_token)
            and id_usuario = l_usuario.id_usuario
            and tipo_rc = 'RECUPERACION'
            and correo = l_usuario.correo;

		-- Notificar al usuario que la contraseña ha sido cambiada
        l_asunto := 'Restablecimiento de contraseña exitoso';
        l_cuerpo_html := '<p>Hola '
                         || l_usuario.nombres
                         || ',</p>';
        l_cuerpo_html := '<!DOCTYPE html>
		<html lang="es">
		<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<style>
						body { margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif; background-color: #F6F6F6; color: #283B3F; line-height: 1.6; }
						.email-container { max-width: 600px; margin: 0 auto; padding: 40px 20px; background-color: #F6F6F6; min-height: 50vh; box-sizing: border-box; }
						.logo { text-align: center; margin-bottom: 60px; }
						.logo-icon { width: 40px; height: 40px; background-color: #ffffff; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 24px; font-weight: bold; color: #6b6b6b; }
						.main-title { font-size: 48px; font-weight: 300; text-align: center; margin: 0 0 40px 0; letter-spacing: -1px; }
						.description { font-size: 18px; text-align: center; margin: 0 0 50px 0; line-height: 1.5; color: #283B3F; max-width: 500px; margin-left: auto; margin-right: auto; }
						.verification-code { text-align: center; margin: 40px 0; }
						.code-label { font-size: 16px; margin-bottom: 15px; color: #283B3F; }
						.code-value { font-size: 32px; font-weight: bold; letter-spacing: 4px; background-color: #8A4EAF; color: #F6F6F6; padding: 20px 30px; border-radius: 8px; display: inline-block; border: 1px solid rgba(255, 255, 255, 0.2); }
						.warning-text { font-size: 14px; color: #8A4EAF; text-align: center; margin: 30px 0; font-weight: 500; }
						.support-text { font-size: 14px; color: #283B3F; text-align: center; margin: 40px 0 60px 0; line-height: 1.5; }
						.footer-logo { text-align: center; }
						.footer-logo-icon { width: 30px; height: 30px; background-color: rgba(255, 255, 255, 0.3); border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 16px; font-weight: bold; color: #ffffff; }
						a { color: #ffffff; text-decoration: underline; }
				</style>
		</head>
		<body>
				<div class="email-container">

						<p class="description">
								Hola '
                         || l_usuario.nombres
                         || ', Tu contraseña ha sido restablecida exitosamente.
						</p>

						<p class="support-text">
								Si no solicitaste restablecer tu contraseña, contacta con nuestro <a href="mailto:soporte@fimaki.com">equipo de soporte</a> inmediatamente.
						</p>

				</div>
		</body>
		</html>';

	-- Send the email with the generated password
        apex_mail.send(
            p_to        => l_usuario.correo,
            p_from      => l_from_email,
            p_body      => null,
            p_body_html => l_cuerpo_html,
            p_subj      => l_asunto
        );

        apex_mail.push_queue;
    exception
        when no_data_found then
            raise_application_error(-20004, 'Usuario no encontrado: ' || p_nombre_usuario);
        when others then
            rollback; -- Rollback any changes in case of error
            raise_application_error(-20005, 'Error al cambiar la contraseña: ' || sqlerrm);
    end cambiar_contrasena;

end iam_authz_utils;
/


-- sqlcl_snapshot {"hash":"64a537f316f7307459c762c2cb02236fc1ec0e61","type":"PACKAGE_BODY","name":"IAM_AUTHZ_UTILS","schemaName":"FIMAKI_SEC_DB","sxml":""}