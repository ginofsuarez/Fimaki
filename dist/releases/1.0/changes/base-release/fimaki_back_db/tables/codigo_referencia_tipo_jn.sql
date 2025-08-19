-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726596 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/codigo_referencia_tipo_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/codigo_referencia_tipo_jn.sql:null:0dafb53f99ea533f3b353424bb56be3771def96e:create

create table fimaki_back_db.codigo_referencia_tipo_jn (
    jn_operation       char(3 byte) not null enable,
    jn_oracle_user     varchar2(30 byte) not null enable,
    jn_datetime        date not null enable,
    jn_notes           varchar2(240 byte),
    jn_appln           varchar2(100 byte),
    jn_session         number(38, 0),
    id_codigo_ref_tipo number not null enable,
    codigo             varchar2(20 char) not null enable,
    nombre             varchar2(100 char) not null enable,
    descripcion        varchar2(200 char) not null disable,
    sistema_sn         varchar2(1 char) not null enable,
    activo_sn          varchar2(1 char) not null enable,
    creado_por         varchar2(100 char) not null enable,
    creado             timestamp(6) with local time zone not null enable,
    modificado_por     varchar2(100 char),
    modificado         timestamp(6) with local time zone
);

