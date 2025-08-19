create or replace editionable trigger fimaki_back_db.bko_archivo_bu_trg before
    update on fimaki_back_db.bko_archivo
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_archivo_bu_trg;
/

alter trigger fimaki_back_db.bko_archivo_bu_trg enable;


-- sqlcl_snapshot {"hash":"eb19942bf2081965f04fdd1a29abaad94c9fcb80","type":"TRIGGER","name":"BKO_ARCHIVO_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}