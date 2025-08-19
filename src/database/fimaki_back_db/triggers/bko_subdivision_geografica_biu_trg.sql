create or replace editionable trigger fimaki_back_db.bko_subdivision_geografica_biu_trg before
    insert on fimaki_back_db.bko_subdivision_geografica
    for each row
begin
    if inserting then
        :new.creado := localtimestamp;
        :new.creado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    elsif updating then
        :new.modificado := localtimestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end bko_subdivision_geografica_biu_trg;
/

alter trigger fimaki_back_db.bko_subdivision_geografica_biu_trg enable;


-- sqlcl_snapshot {"hash":"0730f158e9036d3ef84445a4340d454344b2d9af","type":"TRIGGER","name":"BKO_SUBDIVISION_GEOGRAFICA_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}