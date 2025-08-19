-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642429049 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_factura.sql:5f3922f8c47fa55a2ff25ce7233f88fe79437f21:bf7a8fac956e415e02e013b625b416d6ae29f791:alter

alter table fimaki_back_db.bko_factura modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_factura modify (
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
        'BKO_FACTURA',
        ' factrack_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_FACTURA" DROP CONSTRAINT ' || cname;
end;
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'BKO_FACTURA',
        ' visible_en_oportunidades_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_FACTURA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_factura
    add
        check ( visible_en_oportunidades_sn in ( 'S', 'N' ) ) enable
/

alter table fimaki_back_db.bko_factura
    add
        check ( factrack_sn in ( 'S', 'N' ) ) enable
/

