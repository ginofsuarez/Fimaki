-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640727061 stripComments:false  logicalFilePath:base-release/fimaki_back_db/views/factura_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/views/factura_v.sql:null:13ad89a23e294b497df3e9bb6ddcc83219046f8d:create

create or replace force editionable view fimaki_back_db.factura_v (
    id_factura,
    fecha_ingreso,
    fecha_emision,
    fecha_pago,
    tipo_comprobante_rc,
    tipo_comprobante,
    serie,
    numero,
    moneda_rc,
    moneda,
    prefijo_moneda,
    monto_total,
    detraccion,
    descuentos,
    saldo_a_pago,
    fecha_vencimiento,
    observacion,
    id_empresa_cedente,
    id_empresa_pagador,
    estado_factura_rc,
    estado_factura,
    empresa_cedente,
    empresa_pagador,
    score_operacion_rc,
    score_cedente_rc,
    score_pagador_rc,
    visible_en_oportunidades_sn,
    fecha_publicacion,
    creado,
    creado_por,
    modificado,
    modificado_por,
    vence_en,
    tasa_interes,
    plazo_en_dias,
    dias_atraso,
    actividad_economica,
    clasificacion_operacion,
    clasificacion_pagador,
    clasificacion_operacion_color,
    clasificacion_pagador_color,
    archivo_contenido,
    monto_restante,
    porcentaje_financiado,
    simbolo_moneda
) as
    with monto_invertido_fact as (
        select
            id_factura,
            sum(monto_invertido) as monto_invertido
        from
            bko_inversion_factura
        group by
            id_factura
    )
    select
        f.id_factura,
        f.fecha_ingreso,
        f.fecha_emision,
        f.fecha_pago,
        f.tipo_comprobante_rc,
        t.nombre                                                     as tipo_comprobante,
        f.serie,
        f.numero,
        f.moneda_rc,
        m.nombre                                                     as moneda,
        m.atributo1                                                  as prefijo_moneda,
        f.monto_total,
        f.detraccion,
        f.descuentos,
        f.saldo_a_pago,
        f.fecha_vencimiento,
        f.observacion,
        f.id_empresa_cedente,
        f.id_empresa_pagador,
        f.estado_factura_rc,
        e.nombre                                                     as estado_factura,
        c.razon_social                                               as empresa_cedente,
        p.razon_social                                               as empresa_pagador,
        f.score_operacion_rc,
        f.score_cedente_rc,
        f.score_pagador_rc,
        f.visible_en_oportunidades_sn,
        f.fecha_publicacion,
        f.creado,
        f.creado_por,
        f.modificado,
        f.modificado_por,
        extract(day from(fecha_vencimiento - localtimestamp))
        || ' Dias '
        || extract(hour from(fecha_vencimiento - localtimestamp))
        || ' Hrs '
        || extract(minute from(fecha_vencimiento - localtimestamp))
        || ' Min'                                                    as vence_en,
        tasa_interes,
        trunc(f.fecha_vencimiento) - trunc(f.fecha_ingreso)          as plazo_en_dias
        --  , TRUNC(GREATEST( 
        --           f.fecha_vencimiento         -- si todavía no vence
        --         , localtimestamp              -- si ya venció
        --         )
        --     ) - TRUNC(f.fecha_ingreso) as plazo_en_dias
        ,
        greatest(0,
                 trunc(localtimestamp) - trunc(f.fecha_vencimiento)) as dias_atraso,
        ac.nombre                                                    as actividad_economica,
        so.nombre                                                    as clasificacion_operacion,
        sp.nombre                                                    as clasificacion_pagador,
        so.atributo1                                                 as clasificacion_operacion_color,
        sp.atributo1                                                 as clasificacion_pagador_color,
        ep.archivo_contenido,
        ( f.saldo_a_pago - nvl(mif.monto_invertido, 0) )             as monto_restante,
        case
            when f.saldo_a_pago = 0 then
                '0%'
            else
                to_char(round(100 * nvl(mif.monto_invertido, 0) / f.saldo_a_pago,
                              2))
                || '%'
        end                                                          as porcentaje_financiado,
        m.atributo1                                                  as simbolo_moneda
    from
             bko_factura f
        join bko_empresa          ec on ec.id_empresa = f.id_empresa_cedente
        join bko_persona          c on c.id_persona = ec.id_persona
        join bko_empresa          ep on ep.id_empresa = f.id_empresa_pagador
        join bko_persona          p on p.id_persona = ep.id_persona
        left join monto_invertido_fact mif on f.id_factura = mif.id_factura
        left join codigo_referencia    t on t.codigo = f.tipo_comprobante_rc
                                         and t.codigo_ref_tipo = 'TIP_COMP'
        left join codigo_referencia    m on m.codigo = f.moneda_rc
                                         and m.codigo_ref_tipo = 'TIPO_MON'
        left join codigo_referencia    e on e.codigo = f.estado_factura_rc
                                         and e.codigo_ref_tipo = 'EST_FACT'
        left join codigo_referencia    ac on ac.codigo = ec.actividad_economica_rc
                                          and ac.codigo_ref_tipo = 'ACT_ECO'
        left join codigo_referencia    so on so.codigo = f.score_operacion_rc
                                          and so.codigo_ref_tipo = 'TIP_SCORE'
        left join codigo_referencia    sp on sp.codigo = f.score_pagador_rc
                                          and sp.codigo_ref_tipo = 'TIP_SCORE';

