-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725739 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_institucion_financiera.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_institucion_financiera.sql:null:ee1e9b73f7b00df8755f396cd9a201db22275859:create

comment on column fimaki_back_db.bko_institucion_financiera.activo_sn is
    'S=ACTIVO / N=NO ACTIVO';

comment on column fimaki_back_db.bko_institucion_financiera.codigo_regulador is
    'Código oficial o interno del regulador (SBS, SUNARP, etc.)';

comment on column fimaki_back_db.bko_institucion_financiera.creado is
    'Fecha y hora de creación del registro';

comment on column fimaki_back_db.bko_institucion_financiera.creado_por is
    'Usuario que creó el registro';

comment on column fimaki_back_db.bko_institucion_financiera.id_institucion is
    'Identificador único de la entidad financiera';

comment on column fimaki_back_db.bko_institucion_financiera.modificado is
    'Fecha y hora de la última modificación del registro';

comment on column fimaki_back_db.bko_institucion_financiera.modificado_por is
    'Último usuario que modificó el registro';

comment on column fimaki_back_db.bko_institucion_financiera.moneda_base_rc is
    'Moneda principal de operación';

comment on column fimaki_back_db.bko_institucion_financiera.nombre is
    'Nombre completo de la entidad financiera';

comment on column fimaki_back_db.bko_institucion_financiera.siglas is
    'Abreviatura o acrónimo (opcional)';

comment on column fimaki_back_db.bko_institucion_financiera.tipo_entidad_rc is
    'BANCO / COOPERATIVA / FINTECH / BILLETERA / PASARELA / OTRO';

