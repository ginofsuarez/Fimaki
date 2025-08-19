-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642432938 stripComments:false  logicalFilePath:1.1/fimaki_back_db/triggers/bko_factura_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_factura_bu_trg.sql:6bcfbc1c7ee31fb768501230edfda134eb036e13:371aff9d11269b61c39d5f0b30b5c217fc96fc5b:alter

create or replace editionable trigger fimaki_back_db.bko_factura_bu_trg before
    insert or update on fimaki_back_db.bko_factura
    for each row
begin
    if inserting then
        :new.creado := current_timestamp;
        :new.creado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    elsif updating then
        :new.modificado := current_timestamp;
        :new.modificado_por := nvl(
            sys_context('APEX$SESSION', 'APP_USER'),
            user
        );
    end if;
end bko_factura_bu_trg;
/

alter trigger fimaki_back_db.bko_factura_bu_trg enable;

