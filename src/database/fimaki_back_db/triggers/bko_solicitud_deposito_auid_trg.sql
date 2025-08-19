create or replace editionable trigger fimaki_back_db.bko_solicitud_deposito_auid_trg after
    insert or update or delete on fimaki_back_db.bko_solicitud_deposito
    for each row
declare
    rec   bko_solicitud_deposito_jn%rowtype;
    blank bko_solicitud_deposito_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_deposito := :new.id_deposito;
        rec.monto := :new.monto;
        rec.fecha_transferencia := :new.fecha_transferencia;
        rec.estado_rc := :new.estado_rc;
        rec.validado_por := :new.validado_por;
        rec.fecha_validacion := :new.fecha_validacion;
        rec.observaciones := :new.observaciones;
        rec.id_rol_persona := :new.id_rol_persona;
        rec.id_cuenta_bancaria := :new.id_cuenta_bancaria;
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
        rec.id_deposito := :old.id_deposito;
        rec.monto := :old.monto;
        rec.fecha_transferencia := :old.fecha_transferencia;
        rec.estado_rc := :old.estado_rc;
        rec.validado_por := :old.validado_por;
        rec.fecha_validacion := :old.fecha_validacion;
        rec.observaciones := :old.observaciones;
        rec.id_rol_persona := :old.id_rol_persona;
        rec.id_cuenta_bancaria := :old.id_cuenta_bancaria;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into bko_solicitud_deposito_jn values rec;

end;
/

alter trigger fimaki_back_db.bko_solicitud_deposito_auid_trg enable;


-- sqlcl_snapshot {"hash":"7ca32d1a698be62e4c7b89164c304e5c6e1bf10f","type":"TRIGGER","name":"BKO_SOLICITUD_DEPOSITO_AUID_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}