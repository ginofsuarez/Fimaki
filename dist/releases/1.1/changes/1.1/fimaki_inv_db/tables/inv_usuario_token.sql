-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755642433722 stripComments:false  logicalFilePath:1.1/fimaki_inv_db/tables/inv_usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/tables/inv_usuario_token.sql:debddcd5ac2e89080807589a5116949ce59b3917:42d50302430cf39936b4d358e681fd6438285366:alter

alter table fimaki_inv_db.inv_usuario_token modify (
    fecha_generacion timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_inv_db.inv_usuario_token modify (
    expiracion timestamp(6) with local time zone default current_timestamp + interval '1' hour
)
/

declare
    cname varchar2(128);
begin
    cname := dbms_metadata.get_check_constraint_name(
        sys_context('USERENV', 'CURRENT_USERID'),
        'TABLE',
        'FIMAKI_INV_DB',
        'INV_USUARIO_TOKEN',
        ' usado in ( ''S'', ''N'' ) ',
        false
    );

    execute immediate 'ALTER TABLE "FIMAKI_INV_DB"."INV_USUARIO_TOKEN" DROP CONSTRAINT ' || cname;
end;
/

alter table fimaki_inv_db.inv_usuario_token
    add
        check ( usado in ( 'S', 'N' ) ) enable
/

