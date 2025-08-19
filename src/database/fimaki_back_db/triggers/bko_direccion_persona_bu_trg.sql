create or replace editionable trigger fimaki_back_db.bko_direccion_persona_bu_trg before
    update on fimaki_back_db.bko_pais
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_direccion_persona_bu_trg;
/

alter trigger fimaki_back_db.bko_direccion_persona_bu_trg enable;


-- sqlcl_snapshot {"hash":"0d83e4ed85250f515a5d0d34444b1fa7c2baf34f","type":"TRIGGER","name":"BKO_DIRECCION_PERSONA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}