-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726098 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_archivo_factura_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_archivo_factura_fk2.sql:null:db8cf9a441da548e076f0f2c4ecf55994f63c82c:create

alter table fimaki_back_db.bko_archivo_factura
    add constraint bko_archivo_factura_fk2
        foreign key ( id_archivo )
            references fimaki_back_db.bko_archivo ( id_archivo )
        enable;

