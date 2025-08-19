-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726972 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/variable_sistema_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/variable_sistema_biu_trg.sql:null:ae9521dd6845a8b372a957e9ce9fcdb2108565f3:create

create or replace editionable trigger fimaki_back_db.variable_sistema_biu_trg before
    insert on fimaki_back_db.variable_sistema
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
end variable_sistema_biu_trg;
/

alter trigger fimaki_back_db.variable_sistema_biu_trg enable;

