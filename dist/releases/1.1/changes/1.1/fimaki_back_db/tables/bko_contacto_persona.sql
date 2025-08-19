-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642426258 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_contacto_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_contacto_persona.sql:1c8a1312290a175acf500f8c43df30939ce422d3:e79c0d44fb1b7c33836f68430da529ed8d65035f:alter

alter table fimaki_back_db.bko_contacto_persona modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_contacto_persona modify (
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
        'BKO_CONTACTO_PERSONA',
        ' principal_sn in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."BKO_CONTACTO_PERSONA" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.bko_contacto_persona
    add
        check ( principal_sn in ( 'S', 'N' ) ) enable
/

