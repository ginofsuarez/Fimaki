create or replace editionable trigger fimaki_back_db.subdivision_geografica_biu_trg before
    insert on fimaki_back_db.subdivision_geografica
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
end subdivision_geografica_biu_trg;
/

alter trigger fimaki_back_db.subdivision_geografica_biu_trg enable;


-- sqlcl_snapshot {"hash":"6dcf7f15780897cc2f9f54386c18fb5ab3af9884","type":"TRIGGER","name":"SUBDIVISION_GEOGRAFICA_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}