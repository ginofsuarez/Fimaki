-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642424659 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_archivo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_archivo.sql:e68b052fa086723cac1ac018e7a787aa7dfe8a88:ad2f8e70bc6ad04fec238cd5514fb61de8b00e19:alter

alter table fimaki_back_db.bko_archivo modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_archivo modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

