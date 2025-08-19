-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726859 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_solicitud_deposito_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_solicitud_deposito_biu_trg.sql:null:676cb26eb8fbdd9566fc1e8add6873f6c4690cd9:create

create or replace editionable trigger fimaki_back_db.bko_solicitud_deposito_biu_trg before
    insert or update on fimaki_back_db.bko_solicitud_deposito
    for each row
begin
    if inserting then
        :new.creado := current_timestamp;
        :new.creado_por := coalesce(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    else
        :new.modificado := current_timestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end;
/

alter trigger fimaki_back_db.bko_solicitud_deposito_biu_trg enable;

