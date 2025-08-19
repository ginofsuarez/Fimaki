-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726186 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_solicitud_deposito_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_solicitud_deposito_fk2.sql:null:e9423e281e63faacf14ee477b3278c2f94aa34ad:create

alter table fimaki_back_db.bko_solicitud_deposito
    add constraint bko_solicitud_deposito_fk2
        foreign key ( id_movimiento_financiero )
            references fimaki_back_db.bko_movimiento_financiero ( id_movimiento_financiero )
        enable;

