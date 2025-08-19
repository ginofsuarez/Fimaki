-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726692 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_cuenta_bancaria_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_cuenta_bancaria_auid_trg.sql:null:acbadffc70db8ced3f4065788f740afa9d84781a:create

create or replace editionable trigger fimaki_back_db.bko_cuenta_bancaria_auid_trg after
    insert or update or delete on fimaki_back_db.bko_cuenta_bancaria
    for each row
declare
    rec   bko_cuenta_bancaria_jn%rowtype;
    blank bko_cuenta_bancaria_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_cuenta_bancaria := :new.id_cuenta_bancaria;
        rec.numero_cuenta := :new.numero_cuenta;
        rec.cci := :new.cci;
        rec.moneda_rc := :new.moneda_rc;
        rec.alias := :new.alias;
        rec.es_principal_sn := :new.es_principal_sn;
        rec.id_persona := :new.id_persona;
        rec.id_institucion := :new.id_institucion;
        rec.id_pais := :new.id_pais;
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
        rec.id_cuenta_bancaria := :old.id_cuenta_bancaria;
        rec.numero_cuenta := :old.numero_cuenta;
        rec.cci := :old.cci;
        rec.moneda_rc := :old.moneda_rc;
        rec.alias := :old.alias;
        rec.es_principal_sn := :old.es_principal_sn;
        rec.id_persona := :old.id_persona;
        rec.id_institucion := :old.id_institucion;
        rec.id_pais := :old.id_pais;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into bko_cuenta_bancaria_jn values rec;

end;
/

alter trigger fimaki_back_db.bko_cuenta_bancaria_auid_trg enable;

