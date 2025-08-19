-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726946 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/subdivision_geografica_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/subdivision_geografica_biu_trg.sql:null:0b508faea58bbf7957f1ef54ee6bb58cd04a1e84:create

create or replace editionable trigger fimaki_back_db.subdivision_geografica_biu_trg before
    insert on fimaki_back_db.subdivision_geografica
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
end subdivision_geografica_biu_trg;
/

alter trigger fimaki_back_db.subdivision_geografica_biu_trg enable;

