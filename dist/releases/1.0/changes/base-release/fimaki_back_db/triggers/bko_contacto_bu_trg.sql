-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726668 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_contacto_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_contacto_bu_trg.sql:null:c48fa6f0c7cdabc6ea1d47a5e1df76bbe37088a0:create

create or replace editionable trigger fimaki_back_db.bko_contacto_bu_trg before
    update on fimaki_back_db.bko_contacto
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_contacto_bu_trg;
/

alter trigger fimaki_back_db.bko_contacto_bu_trg enable;

