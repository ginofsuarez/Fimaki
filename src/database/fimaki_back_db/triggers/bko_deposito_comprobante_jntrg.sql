create or replace editionable trigger fimaki_back_db.bko_deposito_comprobante_jntrg after
    insert or update or delete on fimaki_back_db.bko_deposito_comprobante
    for each row
declare
    rec   bko_deposito_comprobante_jn%rowtype;
    blank bko_deposito_comprobante_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        -- Asignar valores NEW para INSERT y UPDATE
        rec.id_comprobante := :new.id_comprobante;
        rec.id_deposito := :new.id_deposito;
        rec.archivo_nombre := :new.archivo_nombre;
        rec.archivo_tipo_mime := :new.archivo_tipo_mime;
        rec.archivo_contenido := :new.archivo_contenido;
        rec.usuario_registro := :new.usuario_registro;
        rec.creado_por := :new.creado_por;
        rec.creado := :new.creado;
        rec.modificado_por := :new.modificado_por;
        rec.modificado := :new.modificado;
        rec.activo_sn := :new.activo_sn;

        -- Información de auditoría
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        if inserting then
            rec.jn_operation := 'INS';
            rec.jn_notes := 'Record inserted';
        elsif updating then
            rec.jn_operation := 'UPD';
            rec.jn_notes := 'Record updated';
        end if;

    elsif deleting then
        -- Asignar valores OLD para DELETE
        rec.id_comprobante := :old.id_comprobante;
        rec.id_deposito := :old.id_deposito;
        rec.archivo_nombre := :old.archivo_nombre;
        rec.archivo_tipo_mime := :old.archivo_tipo_mime;
        rec.archivo_contenido := :old.archivo_contenido;
        rec.usuario_registro := :old.usuario_registro;
        rec.creado_por := :old.creado_por;
        rec.creado := :old.creado;
        rec.modificado_por := :old.modificado_por;
        rec.modificado := :old.modificado;
        rec.activo_sn := :old.activo_sn;

        -- Información de auditoría
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
        rec.jn_notes := 'Record deleted';
    end if;

    -- Insertar registro en journal table
    insert into bko_deposito_comprobante_jn values rec;

exception
    when others then
        -- Log del error pero no fallar la transacción principal
        raise_application_error(-20001, 'Error in journal trigger: ' || sqlerrm);
end;
/

alter trigger fimaki_back_db.bko_deposito_comprobante_jntrg enable;


-- sqlcl_snapshot {"hash":"bea5d83993e9f2333c32574f8036e70973d5f6bc","type":"TRIGGER","name":"BKO_DEPOSITO_COMPROBANTE_JNTRG","schemaName":"FIMAKI_BACK_DB","sxml":""}