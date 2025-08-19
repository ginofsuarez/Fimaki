-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726574 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/codigo_referencia_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/codigo_referencia_jn.sql:null:03c632bb469ab36a358ee2e2ff71b3b5acb3b280:create

create table fimaki_back_db.codigo_referencia_jn (
    jn_operation         char(3 byte) not null enable,
    jn_oracle_user       varchar2(30 byte) not null enable,
    jn_datetime          date not null enable,
    jn_notes             varchar2(240 byte),
    jn_appln             varchar2(100 byte),
    jn_session           number(38, 0),
    id_codigo_referencia number not null enable,
    codigo_ref_tipo      varchar2(20 char) not null enable,
    codigo               varchar2(20 char) not null enable,
    nombre               varchar2(200 char) not null enable,
    descripcion          varchar2(200 char) not null disable,
    secuencia            number not null enable,
    activo_sn            varchar2(1 char) not null enable,
    creado_por           varchar2(100 char) not null enable,
    creado               timestamp(6) with local time zone not null enable,
    modificado_por       varchar2(100 char),
    modificado           timestamp(6) with local time zone,
    atributo1            varchar2(100 char),
    atributo2            varchar2(100 char),
    atributo3            varchar2(100 char),
    atributo4            varchar2(100 char),
    atributo5            varchar2(100 char),
    atributo6            varchar2(100 char),
    atributo7            varchar2(100 char),
    atributo8            varchar2(100 char),
    atributo9            varchar2(100 char),
    atributo10           varchar2(100 char)
);

