-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727483 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/triggers/iam_usuario_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/triggers/iam_usuario_bu_trg.sql:null:e956418d114dff0ff8d547e979cb311d1fc83849:create

create or replace editionable trigger fimaki_sec_db.iam_usuario_bu_trg before
    update on fimaki_sec_db.iam_usuario
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end iam_usuario_bu_trg;
/

alter trigger fimaki_sec_db.iam_usuario_bu_trg enable;

