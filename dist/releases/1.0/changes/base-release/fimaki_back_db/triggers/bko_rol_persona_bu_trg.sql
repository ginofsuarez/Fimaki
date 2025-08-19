-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726828 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_rol_persona_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_rol_persona_bu_trg.sql:null:29c38aec7104c651ef43c1c0aabd8fa9f466eb6a:create

create or replace editionable trigger fimaki_back_db.bko_rol_persona_bu_trg before
    update on fimaki_back_db.bko_rol_persona
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_rol_persona_bu_trg;
/

alter trigger fimaki_back_db.bko_rol_persona_bu_trg enable;

