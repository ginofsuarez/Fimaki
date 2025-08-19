-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726149 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_movimiento_financiero_fk1.sql:null:986f49ceb58dc32e6e3aab0e31fb852b54b08595:create

alter table fimaki_back_db.bko_movimiento_financiero
    add constraint bko_movimiento_financiero_fk1
        foreign key ( id_rol_persona )
            references fimaki_back_db.bko_rol_persona ( id_rol_persona )
        enable;

