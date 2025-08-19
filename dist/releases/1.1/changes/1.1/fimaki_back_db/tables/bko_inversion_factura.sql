-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642429835 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_inversion_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_inversion_factura.sql:51b82091fa6b2237331fc331f3c4ad075257b4e7:9375b5dc44272412cec563950fe97316bee91c21:alter

alter table fimaki_back_db.bko_inversion_factura modify (
    fecha_inversion date default sysdate
)
/

alter table fimaki_back_db.bko_inversion_factura modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_inversion_factura modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

