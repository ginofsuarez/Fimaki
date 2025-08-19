create or replace editionable trigger fimaki_back_db.bko_solicitud_deposito_biu_trg before
    insert or update on fimaki_back_db.bko_solicitud_deposito
    for each row
begin
    if inserting then
        :new.creado := current_timestamp;
        :new.creado_por := coalesce(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    else
        :new.modificado := current_timestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end;
/

alter trigger fimaki_back_db.bko_solicitud_deposito_biu_trg enable;


-- sqlcl_snapshot {"hash":"a91f8f10a174d5199c883a3ff8b67c8baa7ceffc","type":"TRIGGER","name":"BKO_SOLICITUD_DEPOSITO_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}