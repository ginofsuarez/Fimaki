-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642432920 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/variable_sistema.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/variable_sistema.sql:e4270f0673ff8a63768889a2af164ad9950cd8d1:c201fdf1ddaa46051515249ec3c98f01370fddc7:alter

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'VARIABLE_SISTEMA',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."VARIABLE_SISTEMA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.variable_sistema
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

