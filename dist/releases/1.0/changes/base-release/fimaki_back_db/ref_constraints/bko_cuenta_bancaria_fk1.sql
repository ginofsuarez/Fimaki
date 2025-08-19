-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726114 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_cuenta_bancaria_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_cuenta_bancaria_fk1.sql:null:e29736a41b347eec4545b5b00d0fcd79faa1b803:create

alter table fimaki_back_db.bko_cuenta_bancaria
    add constraint bko_cuenta_bancaria_fk1
        foreign key ( id_institucion )
            references fimaki_back_db.bko_institucion_financiera ( id_institucion )
        enable;

