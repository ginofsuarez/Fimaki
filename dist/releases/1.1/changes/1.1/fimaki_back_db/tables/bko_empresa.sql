-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642428206 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_empresa.sql:dca5b630cf86d3b5761e2778929b747754296348:fc22201bfe8cc887505ba371dc18891623e7b1b7:alter

alter table fimaki_back_db.bko_empresa modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_empresa modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

