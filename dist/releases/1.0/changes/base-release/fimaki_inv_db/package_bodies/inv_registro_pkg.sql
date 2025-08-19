-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727153 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/package_bodies/inv_registro_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/package_bodies/inv_registro_pkg.sql:null:e7186b70b7f8cd6665ece7eebd10bfa5a823ac78:create

create or replace package body fimaki_inv_db.inv_registro_pkg as
    -- ***********************************************************************
    -- Procedure: insert_usuario_temporal
    -- Description: Inserta un nuevo registro en la tabla usuario_temporal.
    -- No realiza actualizaciones. Si el registro ya existe, se generará un error.
    -- ***********************************************************************
    procedure insert_usuario_temporal (
        p_tipo_persona_rc          in inv_usuario_temporal.tipo_persona_rc%type,
        p_tipo_documento_rc        in inv_usuario_temporal.tipo_documento_rc%type,
        p_numero_documento         in inv_usuario_temporal.numero_documento%type,
        p_razon_social             in inv_usuario_temporal.razon_social%type,
        p_nombres                  in inv_usuario_temporal.nombres%type,
        p_apellido_paterno         in inv_usuario_temporal.apellido_paterno%type,
        p_apellido_materno         in inv_usuario_temporal.apellido_materno%type,
        p_fecha_nacimiento         in inv_usuario_temporal.fecha_nacimiento%type,
        p_correo                   in inv_usuario_temporal.correo%type,
        p_celular                  in inv_usuario_temporal.celular%type,
        p_tipo_rol_rc              in inv_usuario_temporal.tipo_rol_rc%type,
        p_estado_rc                in inv_usuario_temporal.estado_rc%type,
        p_ip_origen                in inv_usuario_temporal.ip_origen%type,
        p_user_agent               in inv_usuario_temporal.user_agent%type,
        p_observaciones            in inv_usuario_temporal.observaciones%type,
        p_version_terminos         in inv_usuario_temporal.version_terminos%type,
        p_version_datos_personales in inv_usuario_temporal.version_datos_personales%type,
        p_version_contrato_mandato in inv_usuario_temporal.version_contrato_mandato%type,
        p_id_pais                  in inv_usuario_temporal.id_pais%type,
        p_id_subdivision_n1        in inv_usuario_temporal.id_subdivision_n1%type,
        p_id_subdivision_n2        in inv_usuario_temporal.id_subdivision_n2%type,
        p_contrasena               in varchar2,
        p_id_usuario_temp          out inv_usuario_temporal.id_usuario_temp%type
    ) is
    begin
        insert into inv_usuario_temporal (
            tipo_persona_rc,
            tipo_documento_rc,
            numero_documento,
            razon_social,
            nombres,
            apellido_paterno,
            apellido_materno,
            fecha_nacimiento,
            correo,
            celular,
            tipo_rol_rc,
            estado_rc,
            ip_origen,
            user_agent,
            observaciones,
            version_terminos,
            version_datos_personales,
            version_contrato_mandato,
            id_pais,
            id_subdivision_n1,
            id_subdivision_n2,
            fecha_registro,
            contrasena
        ) values ( p_tipo_persona_rc,
                   p_tipo_documento_rc,
                   p_numero_documento,
                   p_razon_social,
                   p_nombres,
                   p_apellido_paterno,
                   p_apellido_materno,
                   p_fecha_nacimiento,
                   p_correo,
                   p_celular,
                   p_tipo_rol_rc,
                   p_estado_rc,
                   p_ip_origen,
                   p_user_agent,
                   p_observaciones,
                   p_version_terminos,
                   p_version_datos_personales,
                   p_version_contrato_mandato,
                   p_id_pais,
                   p_id_subdivision_n1,
                   p_id_subdivision_n2,
                   current_timestamp,
                   iam_auth_encryption.encrypt(p_contrasena) ) returning id_usuario_temp into p_id_usuario_temp;

    end insert_usuario_temporal;

    /*
      Author:      RV, Fimaki
      Description: Migrar datos de INV_USUARIO a BKO_PERSONA y asignar rol INVERSIONISTA
      Overview:
        - Copia los datos de INV_USUARIO a BKO_PERSONA
        - Marca el usuario como migrado
        - Registra rol INVERSIONISTA en BKO_ROL_PERSONA

      Parameters:
        p_id_usuario: ID del usuario en INV_USUARIO

      Modification History 
      Date       Who  Description 
      ---------- ---- --------------------------------------------------- 
      2025-05-30 RV   Creado [REG-011] Migración completa a BKO_PERSONA
    */
    procedure finalizar_registro_usuario (
        p_id_usuario_temp in number
    ) is
        l_usuario_temp   inv_usuario_temporal%rowtype;
        l_id_persona     number;
        l_id_rol_persona number;
        l_id_usuario     number;
    begin
        apex_debug.enable(p_level => 5); -- <-- Info
        apex_debug.message('FINALIZAR_REGISTRO_USUARIO → ',
                           p_level => 5);
      -- Obtener los datos desde INV_USUARIO
        select
            *
        into l_usuario_temp
        from
            inv_usuario_temporal
        where
            id_usuario_temp = p_id_usuario_temp;

        apex_debug.message('FINALIZAR_REGISTRO_USUARIO → p_id_usuario_temp -> ' || p_id_usuario_temp,
                           p_level => 5);
        bko_persona_pkg.upsert_persona(
            p_id_persona        => l_id_persona, -- NULL para insertar, o un ID existente para actualizar
            p_tipo_persona_rc   => l_usuario_temp.tipo_persona_rc,    -- NATURAL o JURIDICA
            p_tipo_documento_rc => l_usuario_temp.tipo_documento_rc,        -- Tipo de documento (DNI, RUC, etc.)
            p_numero_doc        => l_usuario_temp.numero_documento,   -- Número del documento
            p_nombres           => l_usuario_temp.nombres,       -- Nombres (si es NATURAL)
            p_apellido_paterno  => l_usuario_temp.apellido_paterno,      -- Apellido paterno (si es NATURAL)
            p_apellido_materno  => l_usuario_temp.apellido_materno,      -- Apellido materno (si es NATURAL)
            p_razon_social      => l_usuario_temp.razon_social,         -- Razón social (si es JURIDICA)
            p_fecha_nacimiento  => l_usuario_temp.fecha_nacimiento, -- Fecha de nacimiento (si es NATURAL)
            p_estado_rc         => 'ACTIVO',     -- Estado (ACTIVO, INACTIVO, BLOQUEADO)
            p_id_pais           => l_usuario_temp.id_pais,            -- ID del país
            p_id_subdivision_n1 => l_usuario_temp.id_subdivision_n1,           -- ID de la subdivisión nivel 1 (ej. Departamento)
            p_id_subdivision_n2 => l_usuario_temp.id_subdivision_n2            -- ID de la subdivisión nivel 2 (ej. Provincia)
        );

        bko_persona_pkg.upsert_rol_persona(
            p_id_rol_persona => l_id_rol_persona, -- NULL para insertar, o un ID existente para actualizar
            p_id_persona     => l_id_persona,                -- ID de la persona
            p_tipo_rol_rc    => l_usuario_temp.tipo_rol_rc,              -- Tipo de rol (ej. INVERSIONISTA)
            p_fecha_inicio   => current_timestamp,
            p_fecha_fin      => null,             -- NULL si el rol está vigente
            p_activo_sn      => 'S'               -- S=Activo, N=Inactivo
        );

        iam_authz_utils.crear_usuario(
            p_nombre_usuario   => l_usuario_temp.correo,
            p_correo           => l_usuario_temp.correo,
            p_nombres          => l_usuario_temp.nombres,
            p_apellido_paterno => l_usuario_temp.apellido_paterno,
            p_apellido_materno => l_usuario_temp.apellido_materno,
            p_contrasena       => l_usuario_temp.contrasena,
            p_id_persona       => l_id_persona,
            p_id_usuario_out   => l_id_usuario
        );

    -- Marcar como migrado en INV_USUARIO
        update inv_usuario_temporal
        set
            estado_rc = 'MIGRADO'
        where
            id_usuario_temp = p_id_usuario_temp;

    exception
        when others then
            apex_debug.error('Error en finalizar_registro_usuario: ' || sqlerrm);
            raise;
    end finalizar_registro_usuario;

    procedure fn_sentry_activar_cuenta (
        p_token      varchar2,
        p_id_usuario number
    ) is
        l_username varchar2(100);
        l_session  number;
    begin

      -- Marcar token como usado y registrar metadatos
        update inv_usuario_token
        set
            usado = 'S',
            fecha_uso = current_timestamp,
            ip_uso = owa_util.get_cgi_env('REMOTE_ADDR'),
            user_agent_uso = owa_util.get_cgi_env('HTTP_USER_AGENT')
        where
            token = p_token;

        apex_debug.message('Token invalidado, finalizar registro de usuario = ' || p_id_usuario);  
      -- Ejecutar migración a BKO_PERSONA, etc.
        finalizar_registro_usuario(p_id_usuario);

      -- Obtener nombre de usuario desde IAM_USUARIO usando el correo de BKO_PERSONA
        select
            bp.correo
        into l_username
        from
            inv_usuario_temporal bp
        where
            bp.id_usuario_temp = p_id_usuario;

        apex_custom_auth.set_user(upper(l_username));
    exception
        when no_data_found then
            apex_debug.error('Error en fn_sentry_activar_cuenta: ' || sqlerrm);

        -- Token inválido, expirado o correo no encontrado
        when others then
            apex_debug.error('Error en fn_sentry_activar_cuenta: ' || sqlerrm);
    end fn_sentry_activar_cuenta;

end inv_registro_pkg;
/

