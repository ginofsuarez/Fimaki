-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642432530 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/usuario_token.sql:878a8c0942042a2f7adbaf2f99d7964e66d79583:69f96c2e527e44039c32f4dc39bc437af7509bc7:alter

alter table fimaki_back_db.usuario_token modify (
    fecha_generacion timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.usuario_token modify (
    expiracion timestamp(6) with local time zone default current_timestamp + interval '1' hour
)
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_BACK_DB',
        'USUARIO_TOKEN',
        ' usado in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_BACK_DB"."USUARIO_TOKEN" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_back_db.usuario_token
    add
        check ( usado in ( 'S', 'N' ) ) enable
/

