-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642425860 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_contacto.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_contacto.sql:56d4468838b6a2ea1b10174ed1b36cb8548be88e:1667440b555f9e19649d95870b2e9c7f8fff7b76:alter

alter table fimaki_back_db.bko_contacto modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_contacto modify (
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
        'BKO_CONTACTO',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_CONTACTO" DROP CONSTRAINT ' || cname;
end;
/

/*  Uncomment drop statement after ensuring it is performing the correct actions
ALTER TABLE "FIMAKI_BACK_DB"."BKO_CONTACTO" DROP CONSTRAINT "BKO_CONTACTO_CK1"
/
*/

alter table fimaki_back_db.bko_contacto
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

alter table fimaki_back_db.bko_contacto
    add constraint bko_contacto_ck1
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

