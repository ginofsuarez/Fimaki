-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726932 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/codigo_referencia_tipo_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/codigo_referencia_tipo_auid_trg.sql:null:c8631a627736d478e97923af3777d6b163a93cf3:create

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

