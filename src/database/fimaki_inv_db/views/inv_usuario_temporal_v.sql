create or replace force editionable view fimaki_inv_db.inv_usuario_temporal_v (
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
    fecha_registro,
    fecha_expiracion,
    estado_rc,
    fecha_aceptacion,
    id_pais,
    id_subdivision_n1,
    id_subdivision_n2
) as
    select
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
        fecha_registro,
        fecha_expiracion,
        estado_rc,
        fecha_aceptacion,
        id_pais,
        id_subdivision_n1,
        id_subdivision_n2
    from
        inv_usuario_temporal;


-- sqlcl_snapshot {"hash":"26e167c6e1dc629702cd6f4597049caf41b2f2f9","type":"VIEW","name":"INV_USUARIO_TEMPORAL_V","schemaName":"FIMAKI_INV_DB","sxml":""}