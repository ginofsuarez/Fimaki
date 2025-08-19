-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726698 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_deposito_comprobante_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_deposito_comprobante_bu_trg.sql:null:2ba4dc9762327812e55879e1234682e443b21f7b:create

create or replace editionable trigger fimaki_back_db.bko_deposito_comprobante_bu_trg before
    update on fimaki_back_db.bko_deposito_comprobante
    for each row
begin
    -- Actualizar los campos de auditoría antes de un UPDATE
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
    :new.modificado := current_timestamp;
end bko_deposito_comprobante_bu_trg;
/

alter trigger fimaki_back_db.bko_deposito_comprobante_bu_trg enable;

