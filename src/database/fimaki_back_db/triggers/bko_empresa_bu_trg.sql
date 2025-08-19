create or replace editionable trigger fimaki_back_db.bko_empresa_bu_trg before
    update on fimaki_back_db.bko_empresa
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_empresa_bu_trg;
/

alter trigger fimaki_back_db.bko_empresa_bu_trg enable;


-- sqlcl_snapshot {"hash":"b08a119ab61271a4ad523c667a3f986f9e13b36f","type":"TRIGGER","name":"BKO_EMPRESA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}