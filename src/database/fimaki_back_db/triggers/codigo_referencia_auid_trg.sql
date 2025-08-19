create or replace editionable trigger fimaki_back_db.codigo_referencia_auid_trg after
    insert or update or delete on fimaki_back_db.codigo_referencia
    for each row
declare
    rec   codigo_referencia_jn%rowtype;
    blank codigo_referencia_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_codigo_referencia := :new.id_codigo_referencia;
        rec.codigo_ref_tipo := :new.codigo_ref_tipo;
        rec.codigo := :new.codigo;
        rec.nombre := :new.nombre;
        rec.descripcion := :new.descripcion;
        rec.secuencia := :new.secuencia;
        rec.activo_sn := :new.activo_sn;
        rec.creado_por := :new.creado_por;
        rec.creado := :new.creado;
        rec.modificado_por := :new.modificado_por;
        rec.modificado := :new.modificado;
        rec.atributo1 := :new.atributo1;
        rec.atributo2 := :new.atributo2;
        rec.atributo3 := :new.atributo3;
        rec.atributo4 := :new.atributo4;
        rec.atributo5 := :new.atributo5;
        rec.atributo6 := :new.atributo6;
        rec.atributo7 := :new.atributo7;
        rec.atributo8 := :new.atributo8;
        rec.atributo9 := :new.atributo9;
        rec.atributo10 := :new.atributo10;
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
        rec.id_codigo_referencia := :old.id_codigo_referencia;
        rec.codigo_ref_tipo := :old.codigo_ref_tipo;
        rec.codigo := :old.codigo;
        rec.nombre := :old.nombre;
        rec.descripcion := :old.descripcion;
        rec.secuencia := :old.secuencia;
        rec.activo_sn := :old.activo_sn;
        rec.creado_por := :old.creado_por;
        rec.creado := :old.creado;
        rec.modificado_por := :old.modificado_por;
        rec.modificado := :old.modificado;
        rec.atributo1 := :old.atributo1;
        rec.atributo2 := :old.atributo2;
        rec.atributo3 := :old.atributo3;
        rec.atributo4 := :old.atributo4;
        rec.atributo5 := :old.atributo5;
        rec.atributo6 := :old.atributo6;
        rec.atributo7 := :old.atributo7;
        rec.atributo8 := :old.atributo8;
        rec.atributo9 := :old.atributo9;
        rec.atributo10 := :old.atributo10;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into codigo_referencia_jn values rec;

end;
/

alter trigger fimaki_back_db.codigo_referencia_auid_trg enable;


-- sqlcl_snapshot {"hash":"4ae5825e5447e29641f9a7d446d1b873484b898f","type":"TRIGGER","name":"CODIGO_REFERENCIA_AUID_TRG","schemaName":"FIMAKI_BACK_DB","sxml":""}