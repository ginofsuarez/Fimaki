-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726762 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_institucion_financiera_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_institucion_financiera_bu_trg.sql:null:1026e66c0340e778cd6efc2dfc4f86eae816565a:create

create or replace editionable trigger fimaki_back_db.bko_institucion_financiera_bu_trg before
    update on fimaki_back_db.bko_institucion_financiera
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end trg_auditoria_bko_institucion_financiera;
/

alter trigger fimaki_back_db.bko_institucion_financiera_bu_trg enable;

