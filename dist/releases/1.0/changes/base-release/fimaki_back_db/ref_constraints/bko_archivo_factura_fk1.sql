-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726094 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_archivo_factura_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_archivo_factura_fk1.sql:null:4c0a66d0f9293773c6604fafbb2118a47f5a1738:create

alter table fimaki_back_db.bko_archivo_factura
    add constraint bko_archivo_factura_fk1
        foreign key ( id_factura )
            references fimaki_back_db.bko_factura ( id_factura )
        enable;

