-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642430985 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_rol_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_rol_persona.sql:fa7a682b63acecb3ee28f7232c348ed8fdd33923:d00952013eb453223d9d980068be04bfd96810a7:alter

alter table fimaki_back_db.bko_rol_persona modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_rol_persona modify (
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
        'BKO_ROL_PERSONA',
        ' activo_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_ROL_PERSONA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_rol_persona
    add
        check ( activo_sn in ( 'S', 'N' ) ) enable
/

