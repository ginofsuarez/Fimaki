-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727457 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/tables/iam_usuario_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/tables/iam_usuario_jn.sql:null:89b04733e318ff3378ef795dce2a3dfb2f0f3f69:create

create table fimaki_sec_db.iam_usuario_jn (
    jn_operation                  char(3 byte) not null enable,
    jn_oracle_user                varchar2(30 byte) not null enable,
    jn_datetime                   date not null enable,
    jn_notes                      varchar2(240 byte),
    jn_appln                      varchar2(100 byte),
    jn_session                    number(38, 0),
    id_usuario                    number not null enable,
    nombre_usuario                varchar2(100 char) not null enable,
    correo                        varchar2(100 char) not null enable,
    nombres                       varchar2(100 char) not null enable,
    apellido_paterno              varchar2(100 char) not null enable,
    apellido_materno              varchar2(100 char),
    contrasena                    raw(256) not null enable,
    bloqueado_sn                  varchar2(1 char) not null enable,
    requiere_cambio_contrasena_sn varchar2(1 char) not null enable,
    contrasena_expira_en          timestamp(6) with local time zone,
    id_persona                    number
);

