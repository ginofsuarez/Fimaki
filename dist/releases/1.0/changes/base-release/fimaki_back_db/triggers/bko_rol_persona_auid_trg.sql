-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726823 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_rol_persona_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_rol_persona_auid_trg.sql:null:616a003d0175bcc25570b4d17cefa83e4f4d1a81:create

create or replace editionable trigger fimaki_back_db.bko_rol_persona_auid_trg after
    insert or update or delete on fimaki_back_db.bko_rol_persona
    for each row
declare
    rec   bko_rol_persona_jn%rowtype;
    blank bko_rol_persona_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_rol_persona := :new.id_rol_persona;
        rec.id_persona := :new.id_persona;
        rec.tipo_rol_rc := :new.tipo_rol_rc;
        rec.fecha_inicio := :new.fecha_inicio;
        rec.fecha_fin := :new.fecha_fin;
        rec.activo_sn := :new.activo_sn;
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
        rec.id_rol_persona := :old.id_rol_persona;
        rec.id_persona := :old.id_persona;
        rec.tipo_rol_rc := :old.tipo_rol_rc;
        rec.fecha_inicio := :old.fecha_inicio;
        rec.fecha_fin := :old.fecha_fin;
        rec.activo_sn := :old.activo_sn;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
    end if;

    insert into bko_rol_persona_jn values rec;

end;
/

alter trigger fimaki_back_db.bko_rol_persona_auid_trg enable;

