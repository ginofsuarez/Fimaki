-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726728 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_direccion_persona_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_direccion_persona_bu_trg.sql:null:c2b5f1891feb29de8e0f9b5e5784f2bf1fe22edf:create

create or replace editionable trigger fimaki_back_db.bko_direccion_persona_bu_trg before
    update on fimaki_back_db.bko_pais
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_direccion_persona_bu_trg;
/

alter trigger fimaki_back_db.bko_direccion_persona_bu_trg enable;

