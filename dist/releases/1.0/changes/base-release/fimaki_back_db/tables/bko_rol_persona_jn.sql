-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726504 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_rol_persona_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_rol_persona_jn.sql:null:c8ca0dfcbf7d366f0d62e748417ef0ee2ab59ab4:create

create table fimaki_back_db.bko_rol_persona_jn (
    jn_operation   char(3 byte) not null enable,
    jn_oracle_user varchar2(30 byte) not null enable,
    jn_datetime    date not null enable,
    jn_notes       varchar2(240 byte),
    jn_appln       varchar2(100 byte),
    jn_session     number(38, 0),
    id_rol_persona number not null enable,
    id_persona     number not null enable,
    tipo_rol_rc    varchar2(20 char) not null enable,
    fecha_inicio   timestamp(6) with local time zone not null enable,
    fecha_fin      timestamp(6) with local time zone,
    activo_sn      varchar2(1 char)
);

