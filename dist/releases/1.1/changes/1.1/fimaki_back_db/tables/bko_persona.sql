-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642430599 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_persona.sql:0e063794087f952fe1ba111949e956e9ecbf2ad0:37fb2afa217a7c80fcd86c935e3793b95a38a777:alter

alter table fimaki_back_db.bko_persona modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_persona modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

