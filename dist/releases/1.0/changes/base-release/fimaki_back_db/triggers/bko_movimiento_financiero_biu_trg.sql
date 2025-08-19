-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726776 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_movimiento_financiero_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_movimiento_financiero_biu_trg.sql:null:485e19ed1403d3cb50bd777e0afef9c12fb8d25a:create

create or replace editionable trigger fimaki_back_db.bko_movimiento_financiero_biu_trg before
    insert or update on fimaki_back_db.bko_movimiento_financiero
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

alter trigger fimaki_back_db.bko_movimiento_financiero_biu_trg enable;

