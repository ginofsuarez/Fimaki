create or replace editionable trigger fimaki_back_db.bko_pais_biu_trg before
    insert or update on fimaki_back_db.bko_pais
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
end bko_pais_biu_trg;
/

alter trigger fimaki_back_db.bko_pais_biu_trg enable;


-- sqlcl_snapshot {"hash":"335285afdc651dbec468924967f111bb85b5c36a","type":"TRIGGER","name":"BKO_PAIS_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}