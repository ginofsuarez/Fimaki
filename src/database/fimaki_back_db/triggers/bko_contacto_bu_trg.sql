create or replace editionable trigger fimaki_back_db.bko_contacto_bu_trg before
    update on fimaki_back_db.bko_contacto
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_contacto_bu_trg;
/

alter trigger fimaki_back_db.bko_contacto_bu_trg enable;


-- sqlcl_snapshot {"hash":"e8916442e37c6918d6f77e49060cc2f2b820e991","type":"TRIGGER","name":"BKO_CONTACTO_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}