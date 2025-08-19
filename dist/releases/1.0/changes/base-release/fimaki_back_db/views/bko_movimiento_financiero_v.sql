-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640727011 stripComments:false  logicalFilePath:base-release/fimaki_back_db/views/bko_movimiento_financiero_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/views/bko_movimiento_financiero_v.sql:null:a2422c0102a3727c79967387e1ef203aaf7237c2:create

create or replace force editionable view fimaki_back_db.bko_movimiento_financiero_v (
    id_movimiento_financiero,
    id_rol_persona,
    tipo_movimiento_rc,
    signo,
    tipo_movimiento,
    moneda_rc,
    estado_rc,
    id_cuenta_bancaria,
    monto,
    id_factura,
    id_inversion_factura,
    inversionista,
    numero_cuenta,
    cci,
    id_deposito,
    fecha_movimiento,
    tasa_interes
) as
    select
        m.id_movimiento_financiero,
        m.id_rol_persona,
        m.tipo_movimiento_rc,
        tm.atributo1                                         as signo,
        tm.nombre                                            as tipo_movimiento,
        m.moneda_rc,
        m.estado_rc,
        coalesce(d.id_cuenta_bancaria, m.id_cuenta_bancaria) as id_cuenta_bancaria,
        m.monto,
        m.id_factura,
        m.id_inversion_factura,
        trim(regexp_replace(nvl(p.nombres, '')
                            || ' '
                            || nvl(p.apellido_paterno, '')
                            || ' '
                            || nvl(p.apellido_materno, ''),
                            '\s+',
                            ' '))                                         as inversionista,
        b.numero_cuenta,
        b.cci,
        m.id_deposito,
        m.fecha_movimiento,
        f.tasa_interes --interes anual
    from
        bko_movimiento_financiero m
        left join bko_factura               f on f.id_factura = m.id_factura
        left join codigo_referencia         tm on tm.codigo = m.tipo_movimiento_rc
                                          and tm.codigo_ref_tipo = 'TIPO_MOV_FIN'
        left join bko_solicitud_deposito    d on d.id_deposito = m.id_deposito
        join bko_rol_persona           r on r.id_rol_persona = m.id_rol_persona
        join bko_persona               p on p.id_persona = r.id_persona
        left join bko_cuenta_bancaria       b on b.id_cuenta_bancaria = m.id_cuenta_bancaria;

