-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726738 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_factura_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_factura_bu_trg.sql:null:d9bd92c9346fca2e399236d5576582a7e32edd7d:create

create or replace editionable trigger fimaki_back_db.bko_factura_bu_trg before
    update on fimaki_back_db.bko_factura
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_factura_bu_trg;
/

alter trigger fimaki_back_db.bko_factura_bu_trg enable;

