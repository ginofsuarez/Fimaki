-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642425052 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_archivo_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_archivo_empresa.sql:86ee2f60f03176375e3034447f96c8bf2845b140:adee5cbaf1f3efb50ea5a6fbc7d8a26e1118ed90:alter

alter table fimaki_back_db.bko_archivo_empresa modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_archivo_empresa modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

