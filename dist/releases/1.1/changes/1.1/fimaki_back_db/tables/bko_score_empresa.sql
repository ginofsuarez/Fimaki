-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642431366 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_score_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_score_empresa.sql:8b874a46c3cf9b9f769ed4975b43dc9817bd34b0:0a8bfc24f5ffd30ab19565d3408ed70994cdf98a:alter

alter table fimaki_back_db.bko_score_empresa modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_score_empresa modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

