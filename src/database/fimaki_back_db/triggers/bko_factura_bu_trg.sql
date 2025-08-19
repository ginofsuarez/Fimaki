create or replace editionable trigger fimaki_back_db.bko_factura_bu_trg before
    insert or update on fimaki_back_db.bko_factura
    for each row
begin
    if inserting then
        :new.creado := current_timestamp;
        :new.creado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    elsif updating then
        :new.modificado := current_timestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end bko_factura_bu_trg;
/

alter trigger fimaki_back_db.bko_factura_bu_trg enable;


-- sqlcl_snapshot {"hash":"788f8df5a0ff31cbbf31001d14747609ad1b735c","type":"TRIGGER","name":"BKO_FACTURA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}