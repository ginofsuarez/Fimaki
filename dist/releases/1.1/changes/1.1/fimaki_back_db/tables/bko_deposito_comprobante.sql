-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642427026 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_deposito_comprobante.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_deposito_comprobante.sql:eea4682d971a0111bcbea267f08d01fd27bab4dd:6a988cbc739db3c6781857eb99a9be16e4ac9fc4:alter

alter table fimaki_back_db.bko_deposito_comprobante modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

alter table fimaki_back_db.bko_deposito_comprobante modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

