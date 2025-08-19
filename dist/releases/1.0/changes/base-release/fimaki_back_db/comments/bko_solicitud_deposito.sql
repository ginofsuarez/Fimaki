-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725764 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_solicitud_deposito.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_solicitud_deposito.sql:null:6f12813f7dc085452dc8865bf7495235944ae4fd:create

comment on table fimaki_back_db.bko_solicitud_deposito is
    'Tabla que almacena las solicitudes de depósito realizadas por los usuarios.';

comment on column fimaki_back_db.bko_solicitud_deposito.creado is
    'Fecha y hora de creación del registro.';

comment on column fimaki_back_db.bko_solicitud_deposito.creado_por is
    'Usuario que creó el registro.';

comment on column fimaki_back_db.bko_solicitud_deposito.estado_rc is
    'Estado de la solicitud (ej. PENDIENTE, VALIDADO, RECHAZADO).';

comment on column fimaki_back_db.bko_solicitud_deposito.fecha_transferencia is
    'Fecha y hora en la que se realizó la transferencia.';

comment on column fimaki_back_db.bko_solicitud_deposito.fecha_validacion is
    'Fecha y hora en la que se validó la solicitud.';

comment on column fimaki_back_db.bko_solicitud_deposito.id_cuenta_bancaria is
    'Identificador de la cuenta bancaria de origen.';

comment on column fimaki_back_db.bko_solicitud_deposito.id_deposito is
    'Identificador único de la solicitud de depósito.';

comment on column fimaki_back_db.bko_solicitud_deposito.id_rol_persona is
    'Identificador del rol de la persona que realiza la solicitud.';

comment on column fimaki_back_db.bko_solicitud_deposito.modificado is
    'Fecha y hora de la última modificación del registro.';

comment on column fimaki_back_db.bko_solicitud_deposito.modificado_por is
    'Último usuario que modificó el registro.';

comment on column fimaki_back_db.bko_solicitud_deposito.monto is
    'Monto del depósito solicitado.';

comment on column fimaki_back_db.bko_solicitud_deposito.observaciones is
    'Observaciones o comentarios sobre la solicitud de depósito.';

comment on column fimaki_back_db.bko_solicitud_deposito.validado_por is
    'Identificador del usuario que validó la solicitud.';

