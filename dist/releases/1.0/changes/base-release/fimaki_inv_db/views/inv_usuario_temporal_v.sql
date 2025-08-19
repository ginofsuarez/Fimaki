-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727312 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/views/inv_usuario_temporal_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/views/inv_usuario_temporal_v.sql:null:26e167c6e1dc629702cd6f4597049caf41b2f2f9:create

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

