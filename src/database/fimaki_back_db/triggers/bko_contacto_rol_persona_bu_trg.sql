create or replace editionable trigger fimaki_back_db.bko_contacto_rol_persona_bu_trg before
    update on fimaki_back_db.bko_contacto_persona
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_contacto_rol_persona_bu_trg;
/

alter trigger fimaki_back_db.bko_contacto_rol_persona_bu_trg enable;


-- sqlcl_snapshot {"hash":"7767d1e668fbb477548283277724fa11f4d1ae90","type":"TRIGGER","name":"BKO_CONTACTO_ROL_PERSONA_BU_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}