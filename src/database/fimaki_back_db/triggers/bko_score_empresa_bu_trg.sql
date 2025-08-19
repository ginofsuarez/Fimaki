create or replace editionable trigger fimaki_back_db.bko_score_empresa_bu_trg before
    update on fimaki_back_db.bko_score_empresa
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_score_empresa_bu_trg;
/

alter trigger fimaki_back_db.bko_score_empresa_bu_trg enable;


-- sqlcl_snapshot {"hash":"695a6459af5a8ea0ceb5bdb3e07c37f40e0db0cf","type":"TRIGGER","name":"BKO_SCORE_EMPRESA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}