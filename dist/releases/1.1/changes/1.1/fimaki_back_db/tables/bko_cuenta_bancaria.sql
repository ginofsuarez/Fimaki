-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642426643 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_cuenta_bancaria.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_cuenta_bancaria.sql:d67cd6ea2bdde07b307e61b30c8d4b5ead31f26d:7689ce82d8e64f10180a9ed80485948e96d2467a:alter

alter table fimaki_back_db.bko_cuenta_bancaria modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_cuenta_bancaria modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'BKO_CUENTA_BANCARIA',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_CUENTA_BANCARIA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_cuenta_bancaria
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

