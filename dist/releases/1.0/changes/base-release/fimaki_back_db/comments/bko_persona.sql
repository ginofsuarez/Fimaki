-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725752 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_persona.sql:null:cc7994354b09eceef3f0cbb41a81e86bea013379:create

comment on table fimaki_back_db.bko_persona is
    'Representa a toda entidad registrada en el sistema, ya sea una persona natural o una persona jurídica. Centraliza la información de identidad, documento y contacto. Sirve como base para los distintos roles funcionales que puede asumir una persona en la plataforma (ej. inversionista, cedente, pagador, representante legal).'
    ;

comment on column fimaki_back_db.bko_persona.apellido_materno is
    'Apellido materno (si es persona natural)';

comment on column fimaki_back_db.bko_persona.apellido_paterno is
    'Apellido paterno (si es persona natural)';

comment on column fimaki_back_db.bko_persona.creado is
    'Fecha y hora de creación del registro';

comment on column fimaki_back_db.bko_persona.creado_por is
    'Usuario que creó el registro';

comment on column fimaki_back_db.bko_persona.estado_rc is
    'ACTIVO / INACTIVO / BLOQUEADO';

comment on column fimaki_back_db.bko_persona.fecha_nacimiento is
    'Fecha de nacimiento (si es persona natural)';

comment on column fimaki_back_db.bko_persona.id_persona is
    'Identificador único de la persona';

comment on column fimaki_back_db.bko_persona.id_subdivision_n1 is
    'Subnivel 1 (ej. Departamento / State)';

comment on column fimaki_back_db.bko_persona.id_subdivision_n2 is
    'Subnivel 2 (ej. Provincia / County)';

comment on column fimaki_back_db.bko_persona.modificado is
    'Fecha y hora de la última modificación del registro';

comment on column fimaki_back_db.bko_persona.modificado_por is
    'Último usuario que modificó el registro';

comment on column fimaki_back_db.bko_persona.nombres is
    'Nombres (si es persona natural)';

comment on column fimaki_back_db.bko_persona.numero_doc is
    'Número del documento de identidad';

comment on column fimaki_back_db.bko_persona.razon_social is
    'Si es persona jurídica';

comment on column fimaki_back_db.bko_persona.tipo_documento_rc is
    'Tipo de documento: DNI, RUC, CE, PASAPORTE, etc.';

comment on column fimaki_back_db.bko_persona.tipo_persona_rc is
    'NATURAL / JURIDICA';

