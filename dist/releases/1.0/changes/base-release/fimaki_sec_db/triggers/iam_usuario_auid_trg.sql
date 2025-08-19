-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727477 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/triggers/iam_usuario_auid_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/triggers/iam_usuario_auid_trg.sql:null:1483e6590b28059631943876347bcc3cafb874ea:create

create or replace editionable trigger fimaki_sec_db.iam_usuario_auid_trg after
    insert or update or delete on fimaki_sec_db.iam_usuario
    for each row
declare
    rec   iam_usuario_jn%rowtype;
    blank iam_usuario_jn%rowtype;
begin
    rec := blank;
    if inserting
    or updating then
        rec.id_usuario := :new.id_usuario;
        rec.nombre_usuario := :new.nombre_usuario;
        rec.correo := :new.correo;
        rec.nombres := :new.nombres;
        rec.apellido_paterno := :new.apellido_paterno;
        rec.apellido_materno := :new.apellido_materno;
        rec.contrasena := :new.contrasena;
        rec.bloqueado_sn := :new.bloqueado_sn;
        rec.requiere_cambio_contrasena_sn := :new.requiere_cambio_contrasena_sn;
        rec.contrasena_expira_en := :new.contrasena_expira_en;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.id_persona := :new.id_persona;
        if inserting then
            rec.jn_operation := 'INS';
        elsif updating then
            rec.jn_operation := 'UPD';
        end if;

    elsif deleting then
        rec.id_usuario := :old.id_usuario;
        rec.nombre_usuario := :old.nombre_usuario;
        rec.correo := :old.correo;
        rec.nombres := :old.nombres;
        rec.apellido_paterno := :old.apellido_paterno;
        rec.apellido_materno := :old.apellido_materno;
        rec.contrasena := :old.contrasena;
        rec.bloqueado_sn := :old.bloqueado_sn;
        rec.requiere_cambio_contrasena_sn := :old.requiere_cambio_contrasena_sn;
        rec.contrasena_expira_en := :old.contrasena_expira_en;
        rec.jn_datetime := sysdate;
        rec.jn_oracle_user := sys_context('USERENV', 'SESSION_USER');
        rec.jn_appln := sys_context('USERENV', 'MODULE');
        rec.jn_session := sys_context('USERENV', 'SESSIONID');
        rec.jn_operation := 'DEL';
        rec.id_persona := :old.id_persona;
    end if;

    insert into iam_usuario_jn values rec;

end;
/

alter trigger fimaki_sec_db.iam_usuario_auid_trg enable;

