create or replace editionable trigger fimaki_back_db.codigo_referencia_biu_trg before
    insert on fimaki_back_db.codigo_referencia
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
end codigo_referencia_biu_trg;
/

alter trigger fimaki_back_db.codigo_referencia_biu_trg enable;


-- sqlcl_snapshot {"hash":"78823eb9a2ad88012890b120f4420abef008f258","type":"TRIGGER","name":"CODIGO_REFERENCIA_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}