-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725730 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_cuenta_bancaria.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_cuenta_bancaria.sql:null:4562b3f1ae897f51c25e8ab5c8ca94b75e0a4d8a:create

comment on column fimaki_back_db.bko_cuenta_bancaria.alias is
    'Nombre personalizado para identificar la cuenta (opcional)';

comment on column fimaki_back_db.bko_cuenta_bancaria.cci is
    'Número de cuenta asignado por el banco';

comment on column fimaki_back_db.bko_cuenta_bancaria.creado is
    'Fecha y hora de creación del registro';

comment on column fimaki_back_db.bko_cuenta_bancaria.creado_por is
    'Usuario que creó el registro';

comment on column fimaki_back_db.bko_cuenta_bancaria.es_principal_sn is
    'Indica si esta cuenta es la principal para la persona (S/N)';

comment on column fimaki_back_db.bko_cuenta_bancaria.id_cuenta_bancaria is
    'Identificador único de la cuenta bancaria';

comment on column fimaki_back_db.bko_cuenta_bancaria.modificado is
    'Fecha y hora de la última modificación del registro';

comment on column fimaki_back_db.bko_cuenta_bancaria.modificado_por is
    'Último usuario que modificó el registro';

comment on column fimaki_back_db.bko_cuenta_bancaria.numero_cuenta is
    'Número de cuenta asignado por el banco';

