create or replace editionable trigger fimaki_back_db.codigo_referencia_tipo_biu_trg before
    insert on fimaki_back_db.codigo_referencia_tipo
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
end codigo_referencia_tipo_biu_trg;
/

alter trigger fimaki_back_db.codigo_referencia_tipo_biu_trg enable;


-- sqlcl_snapshot {"hash":"e745df6f203de5d68ed52d2cd7eb69f55a85d0a2","type":"TRIGGER","name":"CODIGO_REFERENCIA_TIPO_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}