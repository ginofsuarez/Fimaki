-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726939 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/codigo_referencia_tipo_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/codigo_referencia_tipo_biu_trg.sql:null:1243638381b4ec51d5878ff905841ef945cd1a58:create

create or replace editionable trigger fimaki_back_db.codigo_referencia_tipo_biu_trg before
    insert on fimaki_back_db.codigo_referencia_tipo
    for each row
begin
    if inserting then
        :new.creado := localtimestamp;
        :new.creado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    elsif updating then
        :new.modificado := localtimestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end codigo_referencia_tipo_biu_trg;
/

alter trigger fimaki_back_db.codigo_referencia_tipo_biu_trg enable;

