-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726866 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_subdivision_geografica_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_subdivision_geografica_biu_trg.sql:null:831ce9e304bc6f9a881213996a23cf52bb49b4e3:create

create or replace editionable trigger fimaki_back_db.bko_subdivision_geografica_biu_trg before
    insert on fimaki_back_db.bko_subdivision_geografica
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
end bko_subdivision_geografica_biu_trg;
/

alter trigger fimaki_back_db.bko_subdivision_geografica_biu_trg enable;

