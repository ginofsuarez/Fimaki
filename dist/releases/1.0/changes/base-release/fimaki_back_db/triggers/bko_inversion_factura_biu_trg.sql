-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726769 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_inversion_factura_biu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_inversion_factura_biu_trg.sql:null:86ce61a36faafa181ec8b405b0ee5d8c7811f615:create

create or replace editionable trigger fimaki_back_db.bko_inversion_factura_biu_trg before
    insert or update on fimaki_back_db.bko_inversion_factura
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
end bko_inversion_factura_biu_trg;
/

alter trigger fimaki_back_db.bko_inversion_factura_biu_trg enable;

