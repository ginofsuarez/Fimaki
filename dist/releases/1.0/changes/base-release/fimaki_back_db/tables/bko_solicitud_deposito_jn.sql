-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726538 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_solicitud_deposito_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_solicitud_deposito_jn.sql:null:892abc5138ff88ff3e2a53c6691755d28d9a4d1d:create

create table fimaki_back_db.bko_solicitud_deposito_jn (
    jn_operation        char(3 byte) not null enable,
    jn_oracle_user      varchar2(30 byte) not null enable,
    jn_datetime         date not null enable,
    jn_notes            varchar2(240 byte),
    jn_appln            varchar2(100 byte),
    jn_session          number(38, 0),
    id_deposito         number not null enable,
    monto               number not null enable,
    fecha_transferencia timestamp(6) with local time zone not null enable,
    estado_rc           varchar2(20 char) not null enable,
    validado_por        varchar2(100 byte),
    fecha_validacion    timestamp(6) with local time zone,
    observaciones       varchar2(4000 byte),
    id_rol_persona      number not null enable,
    id_cuenta_bancaria  number not null enable
);

