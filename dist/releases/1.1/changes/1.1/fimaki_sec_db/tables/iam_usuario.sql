-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755642434199 stripComments:false  logicalFilePath:1.1/fimaki_sec_db/tables/iam_usuario.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/tables/iam_usuario.sql:e4d0642ae2e980f2a7b0ab1c953e5092482936c6:a59084ec7e79df2735b321f5cad0e1eef4342a44:alter

alter table fimaki_sec_db.iam_usuario modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_sec_db.iam_usuario modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

