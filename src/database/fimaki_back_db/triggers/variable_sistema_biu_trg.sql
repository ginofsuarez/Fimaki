create or replace editionable trigger fimaki_back_db.variable_sistema_biu_trg before
    insert on fimaki_back_db.variable_sistema
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
end variable_sistema_biu_trg;
/

alter trigger fimaki_back_db.variable_sistema_biu_trg enable;


-- sqlcl_snapshot {"hash":"4ba2b45726a5a9de8cc17a9e2eabff7a7034df28","type":"TRIGGER","name":"VARIABLE_SISTEMA_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}