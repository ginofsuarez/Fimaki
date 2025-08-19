-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726912 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/codigo_referencia_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/codigo_referencia_biu_trg.sql:null:89cfcd9d30318dd3ce172d43295cba3117c9ddc2:create

create or replace editionable trigger fimaki_back_db.codigo_referencia_biu_trg before
    insert on fimaki_back_db.codigo_referencia
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
end codigo_referencia_biu_trg;
/

alter trigger fimaki_back_db.codigo_referencia_biu_trg enable;

