create or replace editionable trigger fimaki_back_db.bko_rol_persona_bu_trg before
    update on fimaki_back_db.bko_rol_persona
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_rol_persona_bu_trg;
/

alter trigger fimaki_back_db.bko_rol_persona_bu_trg enable;


-- sqlcl_snapshot {"hash":"95f4f36d0846893ef734c00d68a15699e3e36ad6","type":"TRIGGER","name":"BKO_ROL_PERSONA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}