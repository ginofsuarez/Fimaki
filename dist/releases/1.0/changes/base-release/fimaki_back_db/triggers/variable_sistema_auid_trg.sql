-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726964 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/variable_sistema_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/variable_sistema_auid_trg.sql:null:62802fa57b79a94483d087201e3c60a480d9f932:create

create or replace editionable trigger fimaki_back_db.variable_sistema_auid_trg after
    insert or update or delete on fimaki_back_db.variable_sistema
    for each row
declare
    rec   variable_sistema_jn%rowtype;
    blank variable_sistema_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_variable := :new.id_variable;
        rec.nombre_variable := :new.nombre_variable;
        rec.valor := :new.valor;
        rec.descripcion := :new.descripcion;
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
        rec.id_variable := :old.id_variable;
        rec.nombre_variable := :old.nombre_variable;
        rec.valor := :old.valor;
        rec.descripcion := :old.descripcion;
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

    insert into variable_sistema_jn values rec;

end;
/

alter trigger fimaki_back_db.variable_sistema_auid_trg enable;

