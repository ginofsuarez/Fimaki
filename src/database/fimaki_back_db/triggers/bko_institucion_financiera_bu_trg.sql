create or replace editionable trigger fimaki_back_db.bko_institucion_financiera_bu_trg before
    update on fimaki_back_db.bko_institucion_financiera
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end trg_auditoria_bko_institucion_financiera;
/

alter trigger fimaki_back_db.bko_institucion_financiera_bu_trg enable;


-- sqlcl_snapshot {"hash":"32d0829b7d1fbb16a987b8da04c959729ff56b21","type":"TRIGGER","name":"BKO_INSTITUCION_FINANCIERA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}