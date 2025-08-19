-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726602 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/mail_template.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/mail_template.sql:null:a9b7133b47576b8e12420832f0d5f529b3ae764c:create

create table fimaki_back_db.mail_template (
    id_template    number
        generated always as identity
    not null enable,
    codigo         varchar2(50 byte),
    nombre         varchar2(100 byte),
    asunto         varchar2(200 byte),
    contenido_html clob,
    activo         char(1 byte) default 'S',
    creado_por     varchar2(100 byte),
    creado         timestamp(6) with local time zone default current_timestamp,
    modificado_por varchar2(100 byte),
    modificado     timestamp(6) with local time zone
);

