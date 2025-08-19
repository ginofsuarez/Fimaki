create or replace editionable trigger fimaki_back_db.bko_persona_auid_trg after
    insert or update or delete on fimaki_back_db.bko_persona
    for each row
declare
    rec   bko_persona_jn%rowtype;
    blank bko_persona_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_persona := :new.id_persona;
        rec.tipo_persona_rc := :new.tipo_persona_rc;
        rec.tipo_documento_rc := :new.tipo_documento_rc;
        rec.numero_doc := :new.numero_doc;
        rec.nombres := :new.nombres;
        rec.apellido_paterno := :new.apellido_paterno;
        rec.apellido_materno := :new.apellido_materno;
        rec.razon_social := :new.razon_social;
        rec.fecha_nacimiento := :new.fecha_nacimiento;
        rec.estado_rc := :new.estado_rc;
        rec.id_pais := :new.id_pais;
        rec.id_subdivision_n1 := :new.id_subdivision_n1;
        rec.id_subdivision_n2 := :new.id_subdivision_n2;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        if inserting then
            rec.jn_operation := 'INS';
        elsif updating then
            rec.jn_operation := 'UPD';
        end if;

    elsif deleting then
        rec.id_persona := :old.id_persona;
        rec.tipo_persona_rc := :old.tipo_persona_rc;
        rec.tipo_documento_rc := :old.tipo_documento_rc;
        rec.numero_doc := :old.numero_doc;
        rec.nombres := :old.nombres;
        rec.apellido_paterno := :old.apellido_paterno;
        rec.apellido_materno := :old.apellido_materno;
        rec.razon_social := :old.razon_social;
        rec.fecha_nacimiento := :old.fecha_nacimiento;
        rec.estado_rc := :old.estado_rc;
        rec.id_pais := :old.id_pais;
        rec.id_subdivision_n1 := :old.id_subdivision_n1;
        rec.id_subdivision_n2 := :old.id_subdivision_n2;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into bko_persona_jn values rec;

end;
/

alter trigger fimaki_back_db.bko_persona_auid_trg enable;


-- sqlcl_snapshot {"hash":"5ea1da34ca5faa8f9d01c729377dc0dc78de6961","type":"TRIGGER","name":"BKO_PERSONA_AUID_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}