create or replace editionable trigger fimaki_back_db.bko_movimiento_financiero_biu_trg before
    insert or update on fimaki_back_db.bko_movimiento_financiero
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

alter trigger fimaki_back_db.bko_movimiento_financiero_biu_trg enable;


-- sqlcl_snapshot {"hash":"2b9d09759236985c0bc026257f8e9bf96a938076","type":"TRIGGER","name":"BKO_MOVIMIENTO_FINANCIERO_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}