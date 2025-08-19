create or replace force editionable view fimaki_back_db.bko_empresa_v (
    id_empresa,
    actividad_economica_rc,
    actividad_economica,
    fecha_constitucion,
    pagina_web,
    empresa_estado_rc,
    id_persona,
    nombre_comercial,
    tipo_sociedad_rc,
    tamano_rc,
    ciiu_rc,
    ambito_operacional_rc,
    regimen_tributario_rc,
    tipo_contribuyente_rc,
    tipo_persona_rc,
    tipo_documento_rc,
    numero_doc,
    razon_social,
    persona_estado_rc,
    id_pais,
    id_subdivision_n1,
    id_subdivision_n2,
    creado_por,
    creado,
    modificado_por,
    modificado,
    score_cedente_rc,
    score_pagador_rc
) as
    select
        e.id_empresa,
        e.actividad_economica_rc,
        se.nombre   as actividad_economica,
        e.fecha_constitucion,
        e.pagina_web,
        e.estado_rc as empresa_estado_rc,
        e.id_persona,
        e.nombre_comercial,
        e.tipo_sociedad_rc,
        e.tamano_rc,
        e.ciiu_rc,
        e.ambito_operacional_rc,
        e.regimen_tributario_rc,
        e.tipo_contribuyente_rc,
        p.tipo_persona_rc,
        p.tipo_documento_rc,
        p.numero_doc,
        p.razon_social,
        p.estado_rc as persona_estado_rc,
        p.id_pais,
        p.id_subdivision_n1,
        p.id_subdivision_n2,
        p.creado_por,
        p.creado,
        p.modificado_por,
        p.modificado,
        e.score_cedente_rc,
        e.score_pagador_rc
    from
             bko_empresa e
        join bko_persona       p on e.id_persona = p.id_persona
        join codigo_referencia se on se.codigo = e.actividad_economica_rc
                                     and codigo_ref_tipo = 'ACT_ECO';


-- sqlcl_snapshot {"hash":"fe586025ccbe83a7465fa47150143cab7f9ea536","type":"VIEW","name":"BKO_EMPRESA_V","schemaName":"FIMAKI_BACK_DB","sxml":""}