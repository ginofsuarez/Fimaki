-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726757 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_institucion_financiera_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_institucion_financiera_auid_trg.sql:null:59d72b909adbeb0bb86464770da3c5a6d4604a3e:create

create or replace editionable trigger fimaki_back_db.bko_institucion_financiera_auid_trg after
    insert or update or delete on fimaki_back_db.bko_institucion_financiera
    for each row
declare
    rec   bko_institucion_financiera_jn%rowtype;
    blank bko_institucion_financiera_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_institucion := :new.id_institucion;
        rec.nombre := :new.nombre;
        rec.siglas := :new.siglas;
        rec.codigo_regulador := :new.codigo_regulador;
        rec.tipo_entidad_rc := :new.tipo_entidad_rc;
        rec.moneda_base_rc := :new.moneda_base_rc;
        rec.activo_sn := :new.activo_sn;
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
        rec.id_institucion := :old.id_institucion;
        rec.nombre := :old.nombre;
        rec.siglas := :old.siglas;
        rec.codigo_regulador := :old.codigo_regulador;
        rec.tipo_entidad_rc := :old.tipo_entidad_rc;
        rec.moneda_base_rc := :old.moneda_base_rc;
        rec.activo_sn := :old.activo_sn;
        rec.id_pais := :old.id_pais;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into bko_institucion_financiera_jn values rec;

end;
/

alter trigger fimaki_back_db.bko_institucion_financiera_auid_trg enable;

