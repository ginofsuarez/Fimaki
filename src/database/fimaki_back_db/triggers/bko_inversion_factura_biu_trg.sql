create or replace editionable trigger fimaki_back_db.bko_inversion_factura_biu_trg before
    insert or update on fimaki_back_db.bko_inversion_factura
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
end bko_inversion_factura_biu_trg;
/

alter trigger fimaki_back_db.bko_inversion_factura_biu_trg enable;


-- sqlcl_snapshot {"hash":"e5604c788de089138f1430ec06ef5b301e9f74ac","type":"TRIGGER","name":"BKO_INVERSION_FACTURA_BIU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}