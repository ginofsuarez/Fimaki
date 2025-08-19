-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642431743 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_solicitud_deposito.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_solicitud_deposito.sql:25fd692d70cc0c6aab8d9c24aa98d48c229910da:1035e0d6d3c9415c541871e8774186747130314c:alter

alter table fimaki_back_db.bko_solicitud_deposito modify (
    fecha_transferencia timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_solicitud_deposito modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

