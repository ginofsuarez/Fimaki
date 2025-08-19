-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642428583 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_empresa_score.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_empresa_score.sql:be8705c2090634521548072c0b180d4f8d91a631:b3681d58bfe10e0439a8b9b798bc8af34a7ed1eb:alter

alter table fimaki_back_db.bko_empresa_score modify (
    fecha_score date default sysdate
)
/

alter table fimaki_back_db.bko_empresa_score modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_empresa_score modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'BKO_EMPRESA_SCORE',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_EMPRESA_SCORE" DROP CONSTRAINT ' || cname;
end;
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'BKO_EMPRESA_SCORE',
        ' tipo_score in ( ''CEDENTE'', ''PAGADOR'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_EMPRESA_SCORE" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_empresa_score
    add
        check ( tipo_score in ( 'CEDENTE', 'PAGADOR' ) ) enable
/

alter table fimaki_back_db.bko_empresa_score
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

