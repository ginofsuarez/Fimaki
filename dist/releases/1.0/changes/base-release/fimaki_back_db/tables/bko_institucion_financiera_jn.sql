-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726418 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_institucion_financiera_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_institucion_financiera_jn.sql:null:17175f6cffbfe17001d8b6fdf8c0872fe5bb5d6c:create

create table fimaki_back_db.bko_institucion_financiera_jn (
    jn_operation     char(3 byte) not null enable,
    jn_oracle_user   varchar2(30 byte) not null enable,
    jn_datetime      date not null enable,
    jn_notes         varchar2(240 byte),
    jn_appln         varchar2(100 byte),
    jn_session       number(38, 0),
    id_institucion   number not null enable,
    nombre           varchar2(100 char) not null enable,
    siglas           varchar2(10 char),
    codigo_regulador varchar2(20 char),
    tipo_entidad_rc  varchar2(10 char),
    moneda_base_rc   varchar2(10 char) not null enable,
    activo_sn        varchar2(1 char) not null enable,
    id_pais          number not null enable
);

