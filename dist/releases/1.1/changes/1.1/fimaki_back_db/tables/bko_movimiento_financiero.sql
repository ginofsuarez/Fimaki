-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642430219 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_movimiento_financiero.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_movimiento_financiero.sql:345ba062a1d678b7ba694c72c7758e0a36351432:27be059ecda923cdcc239166132e245e31a014dc:alter

alter table fimaki_back_db.bko_movimiento_financiero modify (
    fecha_movimiento date default sysdate
)
/

alter table fimaki_back_db.bko_movimiento_financiero modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_movimiento_financiero modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

