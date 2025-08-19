-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726833 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_score_empresa_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_score_empresa_bu_trg.sql:null:c443353594ff4905e0223f0ad6517e3d25bddb9e:create

create or replace editionable trigger fimaki_back_db.bko_score_empresa_bu_trg before
    update on fimaki_back_db.bko_score_empresa
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_score_empresa_bu_trg;
/

alter trigger fimaki_back_db.bko_score_empresa_bu_trg enable;

