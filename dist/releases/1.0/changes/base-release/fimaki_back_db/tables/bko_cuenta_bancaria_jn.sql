-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726292 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_cuenta_bancaria_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_cuenta_bancaria_jn.sql:null:d23fc27e0b1b7876ba0aefda9cb952b2ca658e17:create

create table fimaki_back_db.bko_cuenta_bancaria_jn (
    jn_operation       char(3 byte) not null enable,
    jn_oracle_user     varchar2(30 byte) not null enable,
    jn_datetime        date not null enable,
    jn_notes           varchar2(240 byte),
    jn_appln           varchar2(100 byte),
    jn_session         number(38, 0),
    id_cuenta_bancaria number not null enable,
    numero_cuenta      varchar2(20 char) not null enable,
    cci                varchar2(20 char) not null enable,
    moneda_rc          varchar2(10 char) not null enable,
    alias              varchar2(20 char),
    es_principal_sn    varchar2(1 char) not null enable,
    id_persona         number not null enable,
    id_institucion     number not null enable,
    id_pais            number not null enable
);

