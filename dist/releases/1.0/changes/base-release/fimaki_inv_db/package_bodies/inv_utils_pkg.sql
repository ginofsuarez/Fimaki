-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727218 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/package_bodies/inv_utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/package_bodies/inv_utils_pkg.sql:null:8513e845dda65c2c5b30ac6f045a0dfe10cc432f:create

create or replace package body fimaki_inv_db.inv_utils_pkg as

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Verifica límite de intentos de recuperación.
		Overview:    
			Esta función verifica si el número de intentos de recuperación de contraseña
			desde una IP específica y correo electrónico excede un límite definido.
			Si se excede el límite, retorna FALSE, de lo contrario TRUE.

		Parameters: 
			p_ip: IP del usuario que intenta recuperar la contraseña.
			p_user_agent: User agent del navegador del usuario.
			p_correo: Correo electrónico del usuario.
			p_max_attempts: Número máximo de intentos permitidos (default 3).
			p_window_minutes: Ventana de tiempo en minutos para contar los intentos (default 5).

		Returns:
			TRUE si el número de intentos está dentro del límite, FALSE si se ha excedido.

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-08-03 Gino Suarez          Created
	*/
    function check_rate_limit (
        p_ip           varchar2,
        p_user_agent   varchar2,
        p_correo       varchar2,
        p_max_attempts number default 3
		-- p_window_minutes NUMBER DEFAULT 5
    ) return boolean is

        l_attempt_count         number;
        l_reset_espera_horas    varchar2(1000) := utils_pkg.get_variable('RESET_ESPERA_HORAS');
        l_reset_max_attempts_ip varchar2(1000) := utils_pkg.get_variable('RESET_MAX_INTENTO_IP');
        l_max_attempts          number;
    begin
        l_max_attempts := coalesce(l_reset_max_attempts_ip, p_max_attempts);
		-- Contar intentos en la ventana de tiempo especificada
        select
            count(1)
        into l_attempt_count
        from
            inv_usuario_token
        where
                ip_uso = p_ip
            and upper(correo) = upper(p_correo)
            and tipo_rc = 'RECUPERACION'
            and fecha_generacion > current_timestamp - numtodsinterval(l_reset_espera_horas, 'HOUR');

		-- Si excede el límite, retornar false
        if l_attempt_count > l_max_attempts then
            return false;
        end if;
        return true;
    exception
        when others then
		-- Log error y retornar false por seguridad
            return false;
    end check_rate_limit;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Generar código de recuperación.
		Overview:    
			Esta función genera un código de recuperación aleatorio de 6 dígitos.
			El código se utiliza para la recuperación de contraseñas temporales.

		Parameters: 
			No parameters.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-29 Gino Suarez          Created
	*/
    procedure registrar_token (
        p_correo     in inv_usuario_token.correo%type,
        p_tipo_rc    in inv_usuario_token.tipo_rc%type,
        p_token      in varchar2,
        p_ip         in varchar2,
        p_user_agent in varchar2
    ) as
        l_token varchar2(64);
    begin			

		-- Inhabilitar cualquier token de recuperación previo
        update inv_usuario_token
        set
            usado = 'S'
        where
                tipo_rc = p_tipo_rc
            and upper(correo) = upper(p_correo);

		-- Encriptar el token
        l_token := iam_auth_encryption.encrypt(p_token);

		-- Insertar el token en la tabla usuario_token
        insert into fimaki_inv_db.inv_usuario_token (
            correo,
            token,
            tipo_rc,
            fecha_generacion,
            expiracion,
            usado,
            ip_uso,
            user_agent_uso
        ) values ( p_correo,
                   l_token,
                   p_tipo_rc,
                   current_timestamp,
                   current_timestamp + interval '5' minute  -- Expira en 5 minutos
                   ,
                   'N',
                   p_ip,
                   p_user_agent );

    exception
        when others then
					-- Manejo básico de error, podría loguearse
            raise_application_error(-20001, 'Error en la funcion generar_token ' || sqlerrm);
    end registrar_token;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Generar código de recuperación.
		Overview:    
			Esta función genera un código de recuperación aleatorio de 6 dígitos.
			El código se utiliza para la recuperación de contraseñas temporales.

		Parameters: 
			No parameters.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-29 Gino Suarez          Created.
	*/
    function generate_recovery_code (
        p_length in number default 4
    ) return varchar2 is
        l_code          varchar2(32);  -- Increased max size to handle larger codes.
        l_random_number number;
        l_min_value     number;
        l_max_value     number;
    begin
			-- Calculate min and max values based on length
        l_min_value := power(10, p_length - 1);
        l_max_value := power(10, p_length) - 1;

			-- Generate a random number between min_value and max_value
        l_random_number := mod(
            abs(dbms_crypto.randominteger),
            l_max_value - l_min_value + 1
        ) + l_min_value;

        l_code := to_char(l_random_number);
        return l_code;
    exception
        when others then
            raise_application_error(-20004, 'Error generating recovery code: ' || sqlerrm);
    end generate_recovery_code;

    procedure generar_token (
        p_id_usuario in inv_usuario_temporal.id_usuario_temp%type,
        p_tipo_rc    in inv_usuario_token.tipo_rc%type
    ) as
        l_token varchar2(64);
			-- l_expiracion   DATE := SYSDATE + INTERVAL '1' DAY;
    begin
			-- Generar un token único con hash SHA256 de GUID y timestamp
        l_token := upper(rawtohex(dbms_crypto.hash(
            utl_raw.cast_to_raw(sys_guid()
                                || to_char(systimestamp, 'YYYYMMDDHH24MISSFF')),
            dbms_crypto.hash_sh256
        )));

			-- Insertar el token en la tabla usuario_token
        insert into inv_usuario_token (
            id_usuario,
            token,
            tipo_rc,
            fecha_generacion
					-- , expiracion
            ,
            usado
        ) values ( p_id_usuario,
                   l_token,
                   p_tipo_rc,
                   current_timestamp
					-- , l_expiracion
                   ,
                   'N' );

    exception
        when others then
					-- Manejo básico de error, podría loguearse
            raise_application_error(-20001, 'Error en la funcion generar_token ' || sqlerrm);
    end generar_token;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Enviar correo de activación al usuario temporal.
		Overview:    
			Esta función envía un correo electrónico al usuario temporal con un enlace para activar su cuenta.
			El enlace contiene un token único que permite la activación de la cuenta.

		Parameters: 
			p_id_usuario: ID del usuario temporal al que se le enviará el correo.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-06-08 Gino Suarez          Created
	*/
    procedure enviar_email_activacion (
        p_id_usuario in inv_usuario_temporal.id_usuario_temp%type
    ) as

        l_correo      varchar2(100);
        l_nombre      varchar2(200);
        l_token       varchar2(64);
        l_url         varchar2(500);
        l_asunto      varchar2(200);
        l_cuerpo_html clob;
        l_from_email  varchar2(1000) := utils_pkg.get_variable('CORREO_NOTIF'); --'no-responder@fimaki.com.pe';
    begin
			-- Obtener correo, nombre y token asociado
        select
            ut.correo,
            ut.nombres,
            utok.token
        into
            l_correo,
            l_nombre,
            l_token
        from
                 inv_usuario_temporal ut
            join inv_usuario_token utok on ut.id_usuario_temp = utok.id_usuario
        where
                ut.id_usuario_temp = p_id_usuario
            and utok.usado = 'N'
            and utok.expiracion > current_timestamp;

			-- Armar URL de activación
			--VARIABLE_SISTEMA
        select
            valor
        into l_url
        from
            variable_sistema
        where
            nombre_variable = 'URL_FIMAKI';

			--l_url := 'https://app.fimaki.com/activar?token=' || l_token;
        l_url := l_url
                 || '?x01='
                 || l_token;
			-- Asunto del correo
        l_asunto := '🎉¡Bienvenido a FIMAKI, '
                    || l_nombre
                    || '! Activa tu cuenta en 1 clic';

			-- Cuerpo HTML del correo
        l_cuerpo_html := 'Hola '
                         || l_nombre
                         || ' 👋,'
                         || '<br><br>'
                         || '¡Gracias por unirte a FIMAKI!'
                         || '<br><br>'
                         || 'Tu cuenta está casi lista. Para comenzar a disfrutar de todos nuestros servicios, solo necesitas activar tu cuenta haciendo clic en el siguiente enlace:'
                         || '<br><br>'
                         || '👉 <a href="'
                         || l_url
                         || '">Activar mi cuenta</a>'
                         || '<br><br>'
                         || '⏳ Recuerda: este enlace estará disponible por solo 1 hora.'
                         || '<br><br>'
                         || 'Si no fuiste tú quien realizó este registro, puedes ignorar este mensaje.'
                         || '<br><br>'
                         || '¡Nos alegra tenerte con nosotros!'
                         || '<br><br>'
                         || 'Saludos,<br>'
                         || 'Equipo FIMAKI';

        apex_mail.send(
            p_to        => l_correo,
            p_from      => l_from_email,
            p_body      => null,
            p_body_html => l_cuerpo_html,
            p_subj      => l_asunto
        );

        apex_mail.push_queue;
    end enviar_email_activacion;

    function validar_cuenta_bancaria_pe (
        p_cuenta       in varchar2,
        p_tipo_cuenta  in varchar2,
        p_codigo_banco in varchar2
    ) return boolean is

        l_cuenta_limpia         varchar2(30);
        l_longitud              number;
        l_banco_en_cci          varchar2(3);
        l_tipo_cuenta_norm      varchar2(3);
        l_codigo_banco_norm     varchar2(10);

			-- Lista de códigos de banco válidos
        type t_lista_bancos is
            table of varchar2(3);
        v_codigos_banco_validos t_lista_bancos := t_lista_bancos('002', '003', '005', '007', '009',
                                                                 '011', '018', '023', '026', '038',
                                                                 '041', '053');
    begin
			-- Validar que los parámetros no sean nulos
        if p_cuenta is null
           or p_tipo_cuenta is null
        or p_codigo_banco is null then
            return false;
        end if;

			-- Normalizar entradas
        l_cuenta_limpia := regexp_replace(p_cuenta, '[^0-9]', '');
        l_longitud := length(l_cuenta_limpia);
        l_tipo_cuenta_norm := upper(trim(p_tipo_cuenta));
        l_codigo_banco_norm := trim(p_codigo_banco);
        if l_tipo_cuenta_norm = 'CCI' then
					-- *** VALIDACIÓN MÁS ESTRICTA PARA CCI ***
            if l_longitud != 20 then
                return false;
            end if;
            l_banco_en_cci := substr(l_cuenta_limpia, 1, 3);

					-- 1. ¿El código del CCI coincide con el parámetro de banco?
            if l_banco_en_cci != l_codigo_banco_norm then
                return false;
            end if;

					-- 2. ¿El código de banco es válido?
            for i in 1..v_codigos_banco_validos.count loop
                if v_codigos_banco_validos(i) = l_banco_en_cci then
                    return true; -- Ambas validaciones son correctas
                end if;
            end loop;

            return false; -- El código no está en la lista de bancos válidos

        elsif l_tipo_cuenta_norm = 'CC' then
					-- Para CC, el código de banco es irrelevante, solo validamos longitud
            if l_longitud between 6 and 18 then
                return true;
            else
                return false;
            end if;
        else
            return false; -- Tipo de cuenta inválido
        end if;

    exception
        when others then
            return false;
    end validar_cuenta_bancaria_pe;

	/*
		Author:      Gino Suarez, Waykitech.
		Description: Reset user password.
		Overview:    
			Este procedimiento restablece la contraseña de un usuario temporal y envía un correo electrónico con el nuevo código de recuperación.
			El código de recuperación se genera aleatoriamente y se registra en la base de datos.

		Parameters: 
			p_nombre_usuario: Nombre de usuario del usuario temporal cuya contraseña se va a restablecer.

		Returns:
			Return value or None

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-29 Gino Suarez          Created.
	*/
    procedure reset_user_password (
        p_nombre_usuario in iam_usuario.nombre_usuario%type,
        p_ip             in varchar2,
        p_user_agent     in varchar2
    ) as

        l_contrasena         varchar2(20);
        l_recovery_code      varchar2(6);
        l_encrypted_password iam_usuario.contrasena%type;
        l_asunto             varchar2(4000);
        l_cuerpo_html        clob;
        l_nombres            iam_usuario.nombres%type;
        l_correo             iam_usuario.correo%type;
        l_from_email         varchar2(1000) := utils_pkg.get_variable('CORREO_NOTIF');
        l_correo_soporte     varchar2(1000) := utils_pkg.get_variable('CORREO_SOPORTE');
        l_usuario            iam_usuario%rowtype;
    begin		

		-- Recupera el usuario por nombre de usuario
        select
            *
        into l_usuario
        from
            iam_usuario
        where
            upper(nombre_usuario) = upper(p_nombre_usuario);

		-- Verificar rate limit antes de proceder
        if not check_rate_limit(
            p_ip           => p_ip,
            p_user_agent   => p_user_agent,
            p_correo       => l_usuario.correo,
            p_max_attempts => 3  -- máximo 3 intentos
						-- p_window_minutes => 5 -- en ventana de 5 minutos
        ) then
        -- Si excede el límite, retornar silenciosamente
            raise_application_error(-20001, 'Límite de intentos excedido. Por favor, inténtalo más tarde.');
        end if;

		-- Generate a recovery code
        l_recovery_code := generate_recovery_code();

		-- Registrar el token de recuperación
        registrar_token(
            p_correo     => l_usuario.correo,
            p_tipo_rc    => 'RECUPERACION',
            p_token      => l_recovery_code,
            p_ip         => p_ip,
            p_user_agent => p_user_agent
        );

		-- Build email's body and subject
        l_asunto := 'Restablecimiento de contraseña - FIMAKI';
        l_cuerpo_html := '<!DOCTYPE html>
			<html lang="es">
			<head>
				<meta charset="UTF-8">
				<meta name="viewport" content="width=device-width, initial-scale=1.0">
				<style>
						body { margin: 0; padding: 0; font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial, sans-serif; background-color: #F6F6F6; color: #283B3F; line-height: 1.6; }
						.email-container { max-width: 600px; margin: 0 auto; padding: 40px 20px; background-color: #F6F6F6; min-height: 100vh; box-sizing: border-box; }
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
                         || ', se ha solicitado restablecer tu contraseña. Usa el código de verificación a continuación para completar el proceso.
							</p>

							<div class="verification-code">
									<div class="code-label">Código de verificación:</div>
									<div class="code-value">'
                         || l_recovery_code
                         || '</div>
							</div>

							<p class="warning-text">
									Nota: Este código caducará en 5 minutos
							</p>

							<p class="support-text">
									Si no solicitaste restablecer tu contraseña, contacta con nuestro <a href="mailto:'
                         || l_correo_soporte
                         || '">equipo de soporte</a> inmediatamente.
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
            null; -- No se encontró el usuario, Intencionalmente no hacemos nada para evitar una vulnerabilidad de seguridad (User Enumeration).
        when others then
            raise_application_error(-20001, 'error in procedure RESET_USER_PASSWORD ' || sqlerrm);
    end reset_user_password;

  /*
		Author:      Diego Calderón, Waykitech.
		Description: Validar token de recuperación.
		Overview:    
			Esta función valida si el token de verificación ingresado por el usuario es válido.
			Verifica que el token exista, no haya sido usado, no haya expirado y que el correo electrónico coincida.

		Parameters: 
			p_correo: Correo electrónico del usuario.
			p_token:  Código de verificación ingresado por el usuario.

		Returns:
			TRUE si el token es válido, FALSE en caso contrario.

		Modification History 
		Date       Who                  Description 
		---------- -------------------- --------------------------------- 
		2025-07-30 Diego Calderón       Created.
		2025-08-01 Gino Suarez       		Refactorización de código.
	*/
    function token_es_valido (
        p_correo in inv_usuario_token.correo%type,
        p_token  in inv_usuario_token.token%type
    ) return boolean as
        l_id_usuario iam_usuario.id_usuario%type;
    begin

		-- Verificar si el token existe en la base de datos y es válido
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
            and upper(correo) = upper(p_correo);

		-- Si no se encuentra el token, retornar FALSE
        if l_id_usuario = 0 then
            return false; -- Token no válido
        end if;
        return true; -- Token es válido

    exception
        when others then
					-- Catch any other unexpected errors in the procedure.
            raise_application_error(-20001, 'Error inesperado en la funcion VALIDAR_TOKEN_RECUPERACION: ' || sqlerrm);
    end token_es_valido;

end inv_utils_pkg;
/

