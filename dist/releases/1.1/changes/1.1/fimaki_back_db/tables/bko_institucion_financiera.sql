-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642429448 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_institucion_financiera.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_institucion_financiera.sql:02fdea36b01242702da4cd58ac9dc59db3a77016:51c09f4ff08ffd46543380e3586fd5cefeaaa6ec:alter

alter table fimaki_back_db.bko_institucion_financiera modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_institucion_financiera modify (
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
        'BKO_INSTITUCION_FINANCIERA',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_INSTITUCION_FINANCIERA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_institucion_financiera
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

