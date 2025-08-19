-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726117 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_cuenta_bancaria_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_cuenta_bancaria_fk2.sql:null:a16a4a3b6e1826790933a4dc53b25b49417db30b:create

alter table fimaki_back_db.bko_cuenta_bancaria
    add constraint bko_cuenta_bancaria_fk2
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

