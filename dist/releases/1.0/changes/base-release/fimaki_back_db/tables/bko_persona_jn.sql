-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726480 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_persona_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_persona_jn.sql:null:60fea14d26e7d4e7c141d0572875170a2413ed16:create

create table fimaki_back_db.bko_persona_jn (
    jn_operation      char(3 byte) not null enable,
    jn_oracle_user    varchar2(30 byte) not null enable,
    jn_datetime       date not null enable,
    jn_notes          varchar2(240 byte),
    jn_appln          varchar2(100 byte),
    jn_session        number(38, 0),
    id_persona        number not null enable,
    tipo_persona_rc   varchar2(10 char),
    tipo_documento_rc varchar2(10 char),
    numero_doc        varchar2(20 char) not null enable,
    nombres           varchar2(100 char),
    apellido_paterno  varchar2(100 char),
    apellido_materno  varchar2(100 char),
    razon_social      varchar2(200 char),
    fecha_nacimiento  date,
    estado_rc         varchar2(10 char),
    id_pais           number not null enable,
    id_subdivision_n1 number,
    id_subdivision_n2 number
);

