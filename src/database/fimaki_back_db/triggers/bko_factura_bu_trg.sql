create or replace editionable trigger fimaki_back_db.bko_factura_bu_trg before
    update on fimaki_back_db.bko_factura
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_factura_bu_trg;
/

alter trigger fimaki_back_db.bko_factura_bu_trg enable;


-- sqlcl_snapshot {"hash":"6bcfbc1c7ee31fb768501230edfda134eb036e13","type":"TRIGGER","name":"BKO_FACTURA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}