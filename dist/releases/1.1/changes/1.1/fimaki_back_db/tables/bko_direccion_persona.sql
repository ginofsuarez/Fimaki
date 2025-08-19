-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642427803 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_direccion_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_direccion_persona.sql:0c4aba4686d979ceaae1fff03c4aa55f02ea1359:274a6f90e51522c3b98cd95171b2773682ae9f6b:alter

alter table fimaki_back_db.bko_direccion_persona modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_direccion_persona modify (
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
        'BKO_DIRECCION_PERSONA',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_DIRECCION_PERSONA" DROP CONSTRAINT ' || cname;
end;
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'BKO_DIRECCION_PERSONA',
        ' principal_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_DIRECCION_PERSONA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_direccion_persona
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

alter table fimaki_back_db.bko_direccion_persona
    add
        check ( principal_sn in ( 'S', 'N' ) ) enable
/

