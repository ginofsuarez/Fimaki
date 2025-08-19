comment on table fimaki_inv_db.inv_usuario_temporal is
    'Capturar la información inicial de registro sin crear aún un usuario, persona, ni rol_persona.
Solo cuando el usuario valida su correo y completa lo requerido, se “promueve” a las tablas reales.';

comment on column fimaki_inv_db.inv_usuario_temporal.apellido_materno is
    'Apellido materno';

comment on column fimaki_inv_db.inv_usuario_temporal.apellido_paterno is
    'Apellido paterno';

comment on column fimaki_inv_db.inv_usuario_temporal.celular is
    'Número de contacto';

comment on column fimaki_inv_db.inv_usuario_temporal.correo is
    'Correo electrónico';

comment on column fimaki_inv_db.inv_usuario_temporal.estado_rc is
    'PENDIENTE / VALIDADO / EXPIRADO / DESCARTADO';

comment on column fimaki_inv_db.inv_usuario_temporal.fecha_aceptacion is
    'Fecha y hora en la que se aceptaron todos los documentos';

comment on column fimaki_inv_db.inv_usuario_temporal.fecha_expiracion is
    'Fecha de vencimiento del registro';

comment on column fimaki_inv_db.inv_usuario_temporal.fecha_nacimiento is
    'Fecha de nacimiento (si persona NATURAL)';

comment on column fimaki_inv_db.inv_usuario_temporal.fecha_registro is
    'Fecha de inicio del registro';

comment on column fimaki_inv_db.inv_usuario_temporal.id_pais is
    'País declarado por el usuario';

comment on column fimaki_inv_db.inv_usuario_temporal.id_subdivision_n1 is
    'Subnivel 1 (ej. Departamento / State)';

comment on column fimaki_inv_db.inv_usuario_temporal.id_subdivision_n2 is
    'Subnivel 2 (ej. Provincia / County)';

comment on column fimaki_inv_db.inv_usuario_temporal.id_usuario_temp is
    'Identificador unico';

comment on column fimaki_inv_db.inv_usuario_temporal.ip_origen is
    'IP de donde se generó el registro';

comment on column fimaki_inv_db.inv_usuario_temporal.nombres is
    'Nombres del usuario (si es natural)';

comment on column fimaki_inv_db.inv_usuario_temporal.numero_documento is
    'Documento de identidad';

comment on column fimaki_inv_db.inv_usuario_temporal.observaciones is
    'Comentarios técnicos (log de validación, errores, etc.)';

comment on column fimaki_inv_db.inv_usuario_temporal.razon_social is
    'Si es persona Juridica';

comment on column fimaki_inv_db.inv_usuario_temporal.tipo_documento_rc is
    'DNI / CE / PASAPORTE';

comment on column fimaki_inv_db.inv_usuario_temporal.tipo_persona_rc is
    'NATURAL / JURIDICA';

comment on column fimaki_inv_db.inv_usuario_temporal.tipo_rol_rc is
    'INVERSIONISTA (u otro)';

comment on column fimaki_inv_db.inv_usuario_temporal.user_agent is
    'Navegador o cliente usado';

comment on column fimaki_inv_db.inv_usuario_temporal.version_contrato_mandato is
    'Versión del contrato de mandato aceptado (si aplica)';

comment on column fimaki_inv_db.inv_usuario_temporal.version_datos_personales is
    'Versión del consentimiento de uso de datos personales';

comment on column fimaki_inv_db.inv_usuario_temporal.version_terminos is
    'Versión del documento de Términos y Condiciones aceptado';


-- sqlcl_snapshot {"hash":"5c2141253f3c632e4839e808055f10d9e131767e","type":"COMMENT","name":"inv_usuario_temporal","schemaName":"fimaki_inv_db","sxml":""}