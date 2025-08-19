-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725757 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_rol_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_rol_persona.sql:null:e29cb74378bbb311582d80db3fb9759eb9dce0cf:create

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

