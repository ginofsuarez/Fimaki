-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726201 stripComments:false  logicalFilePath:base-release/fimaki_back_db/tables/bko_archivo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_archivo.sql:null:247ace2fe9299bdf07a52b54c4ffe531fd312d1f:create

create table fimaki_back_db.bko_archivo (
    id_archivo        number
        generated always as identity
    not null enable,
    archivo_nombre    varchar2(255 char),
    archivo_tipo_mime varchar2(100 char),
    archivo_contenido blob,
    creado            timestamp(6) with local time zone default current_timestamp not null enable,
    creado_por        varchar2(100 char) default sys_context('USERENV', 'SESSION_USER') not null enable,
    modificado_por    varchar2(100 char),
    modificado        timestamp(6) with local time zone,
    atributo1         varchar2(50 char),
    atributo2         varchar2(50 char)
);

alter table fimaki_back_db.bko_archivo add primary key ( id_archivo )
    using index enable;

