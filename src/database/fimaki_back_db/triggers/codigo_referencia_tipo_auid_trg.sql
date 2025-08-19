create or replace editionable trigger fimaki_back_db.codigo_referencia_tipo_auid_trg after
    insert or update or delete on fimaki_back_db.codigo_referencia_tipo
    for each row
declare
    rec   codigo_referencia_tipo_jn%rowtype;
    blank codigo_referencia_tipo_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_codigo_ref_tipo := :new.id_codigo_ref_tipo;
        rec.codigo := :new.codigo;
        rec.nombre := :new.nombre;
        rec.descripcion := :new.descripcion;
        rec.sistema_sn := :new.sistema_sn;
        rec.activo_sn := :new.activo_sn;
        rec.creado_por := :new.creado_por;
        rec.creado := :new.creado;
        rec.modificado_por := :new.modificado_por;
        rec.modificado := :new.modificado;
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
        rec.id_codigo_ref_tipo := :old.id_codigo_ref_tipo;
        rec.codigo := :old.codigo;
        rec.nombre := :old.nombre;
        rec.descripcion := :old.descripcion;
        rec.sistema_sn := :old.sistema_sn;
        rec.activo_sn := :old.activo_sn;
        rec.creado_por := :old.creado_por;
        rec.creado := :old.creado;
        rec.modificado_por := :old.modificado_por;
        rec.modificado := :old.modificado;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into codigo_referencia_tipo_jn values rec;

end;
/

alter trigger fimaki_back_db.codigo_referencia_tipo_auid_trg enable;


-- sqlcl_snapshot {"hash":"5c1b86592b20f9790cd4a0c695a6c61d336c679d","type":"TRIGGER","name":"CODIGO_REFERENCIA_TIPO_AUID_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}