comment on table fimaki_back_db.bko_rol_persona is
    'Asignación de uno o más roles a una persona (INVERSIONISTA, CEDENTE, PAGADOR, etc.).';

comment on column fimaki_back_db.bko_rol_persona.activo_sn is
    'Indica si el rol está activo (S=Sí, N=No).';

comment on column fimaki_back_db.bko_rol_persona.creado is
    'Fecha y hora de creación del registro.';

comment on column fimaki_back_db.bko_rol_persona.creado_por is
    'Usuario que creó el registro.';

comment on column fimaki_back_db.bko_rol_persona.fecha_fin is
    'Fecha hasta la cual el rol estuvo activo (NULL si aún vigente).';

comment on column fimaki_back_db.bko_rol_persona.fecha_inicio is
    'Fecha desde la cual el rol está activo.';

comment on column fimaki_back_db.bko_rol_persona.id_persona is
    'ID de la persona a la que se asigna el rol.';

comment on column fimaki_back_db.bko_rol_persona.id_rol_persona is
    'ID único del rol asignado a la persona.';

comment on column fimaki_back_db.bko_rol_persona.modificado is
    'Fecha y hora de la última modificación del registro.';

comment on column fimaki_back_db.bko_rol_persona.modificado_por is
    'Último usuario que modificó el registro.';

comment on column fimaki_back_db.bko_rol_persona.tipo_rol_rc is
    'Tipo de rol asignado (ej. CEDENTE, PAGADOR, INVERSIONISTA, etc.).';


-- sqlcl_snapshot {"hash":"e29cb74378bbb311582d80db3fb9759eb9dce0cf","type":"COMMENT","name":"bko_rol_persona","schemaName":"fimaki_back_db","sxml":""}