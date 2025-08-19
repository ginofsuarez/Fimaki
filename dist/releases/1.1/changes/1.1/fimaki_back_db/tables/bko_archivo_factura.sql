-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642425437 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_archivo_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_archivo_factura.sql:a6d4599e8a381be7d36390b7889e1f0801d6effc:0438189b00585f18154b3d7ed5ff371582ac7ebe:alter

alter table fimaki_back_db.bko_archivo_factura modify (
    creado timestamp(6) with local time zone default current_timestamp
)
/

alter table fimaki_back_db.bko_archivo_factura modify (
    creado_por varchar2(100 char) default sys_context('USERENV', 'SESSION_USER')
)
/

