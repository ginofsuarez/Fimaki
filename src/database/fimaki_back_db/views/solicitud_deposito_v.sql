create or replace force editionable view fimaki_back_db.solicitud_deposito_v (
    id_deposito,
    monto,
    fecha_transferencia,
    estado_rc,
    validado_por,
    fecha_validacion,
    observaciones,
    id_rol_persona,
    id_cuenta_bancaria,
    creado_por,
    creado,
    modificado_por,
    modificado,
    id_movimiento_financiero,
    numero_cuenta,
    tipo_cuenta_rc,
    alias_cuenta,
    moneda_rc,
    moneda_simbolo,
    nombre_banco,
    activo_sn,
    inversionista,
    id_persona,
    correo
) as
    select
        s.id_deposito,
        s.monto,
        s.fecha_transferencia,
        s.estado_rc,
        s.validado_por,
        s.fecha_validacion,
        s.observaciones,
        s.id_rol_persona,
        s.id_cuenta_bancaria,
        s.creado_por,
        s.creado,
        s.modificado_por,
        s.modificado,
        s.id_movimiento_financiero,
        b.numero_cuenta,
        b.tipo_cuenta_rc,
        b.alias       as alias_cuenta,
        b.moneda_rc,
        m.atributo1   as moneda_simbolo,
        i.nombre      as nombre_banco,
        b.activo_sn,
        initcap(trim(regexp_replace(nvl(p.nombres, '')
                                    || ' '
                                    || nvl(p.apellido_paterno, '')
                                    || ' '
                                    || nvl(p.apellido_materno, ''),
                                    '\s+',
                                    ' '))) as inversionista,
        p.id_persona,
        u.correo
    from
             bko_solicitud_deposito s
        join bko_cuenta_bancaria        b on s.id_cuenta_bancaria = b.id_cuenta_bancaria
        join bko_institucion_financiera i on i.id_institucion = b.id_institucion
        join bko_rol_persona            r on s.id_rol_persona = r.id_rol_persona
        join bko_persona                p on r.id_persona = p.id_persona
        join iam_usuario                u on u.id_persona = p.id_persona
        join codigo_referencia          m on m.codigo = b.moneda_rc
                                    and codigo_ref_tipo = 'TIPO_MON';


-- sqlcl_snapshot {"hash":"37c8309f56d20bac1f07511fc56825a366350793","type":"VIEW","name":"SOLICITUD_DEPOSITO_V","schemaName":"FIMAKI_BACK_DB","sxml":""}