create or replace package fimaki_inv_db.inv_registro_pkg as
    /*
    * Package: registro_pkg
    * Description: Este paquete contiene procedimientos relacionados con el
    * registro y manejo de usuarios temporales en el sistema.
    */

    /*
    * Procedure: insert_usuario_temporal
    * Description: Inserta un nuevo registro en la tabla usuario_temporal.
    * No realiza actualizaciones. Si el registro ya existe, se generará un error.
    * Parameters:
    *   - p_tipo_persona_rc: Tipo de persona (NATURAL/JURIDICA).
    *   - p_tipo_documento_rc: Tipo de documento (DNI/CE/PASAPORTE).
    *   - p_numero_documento: Número de documento de identidad.
    *   - p_razon_social: Razón social (si es persona jurídica).
    *   - p_nombres: Nombres del usuario (si es persona natural).
    *   - p_apellido_paterno: Apellido paterno.
    *   - p_apellido_materno: Apellido materno.
    *   - p_fecha_nacimiento: Fecha de nacimiento (si es persona natural).
    *   - p_correo: Correo electrónico.
    *   - p_celular: Número de contacto.
    *   - p_tipo_rol_rc: Tipo de rol (ej. INVERSIONISTA).
    *   - p_estado_rc: Estado del registro (PENDIENTE/VALIDADO/etc.).
    *   - p_ip_origen: IP desde donde se generó el registro.
    *   - p_user_agent: Navegador o cliente usado.
    *   - p_observaciones: Comentarios técnicos o de validación.
    *   - p_version_terminos: Versión de términos aceptados.
    *   - p_version_datos_personales: Versión de consentimiento de datos personales.
    *   - p_version_contrato_mandato: Versión del contrato de mandato aceptado.
    *   - p_id_pais: Identificador del país.
    *   - p_id_subdivision_n1: Subdivisión nivel 1 (ej. Departamento/Estado).
    *   - p_id_subdivision_n2: Subdivisión nivel 2 (ej. Provincia/Condado).
    */

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
    );

    procedure finalizar_registro_usuario (
        p_id_usuario_temp in number
    );

    procedure fn_sentry_activar_cuenta (
        p_token      varchar2,
        p_id_usuario number
    );

end inv_registro_pkg;
/


-- sqlcl_snapshot {"hash":"8cea66fd9fae12973778c855903451609f4de6e8","type":"PACKAGE_SPEC","name":"INV_REGISTRO_PKG","schemaName":"FIMAKI_INV_DB","sxml":""}