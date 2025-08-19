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


-- sqlcl_snapshot {"hash":"e341b5224ab52ba7a391da154bbfa244d1e607a9","type":"TRIGGER","name":"BKO_DEPOSITO_COMPROBANTE_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}