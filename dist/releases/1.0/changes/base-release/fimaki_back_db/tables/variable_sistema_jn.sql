-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726657 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/variable_sistema_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/variable_sistema_jn.sql:null:a644626a02cb6c0a9daacc787b83f242fbbef416:create

create table fimaki_back_db.variable_sistema_jn (
    jn_operation    char(3 byte) not null enable,
    jn_oracle_user  varchar2(30 byte) not null enable,
    jn_datetime     date not null enable,
    jn_notes        varchar2(240 byte),
    jn_appln        varchar2(100 byte),
    jn_session      number(38, 0),
    id_variable     number not null enable,
    nombre_variable varchar2(20 char) not null enable,
    valor           varchar2(4000 char) not null enable,
    descripcion     varchar2(4000 char) not null enable,
    creado_por      varchar2(100 char) not null enable,
    creado          timestamp(6) with local time zone not null enable,
    modificado_por  varchar2(100 char),
    modificado      timestamp(6) with local time zone
);

