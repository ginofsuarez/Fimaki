-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726733 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_empresa_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_empresa_bu_trg.sql:null:673cb19a2b5b659cb4525af026c1a69898ff9e62:create

create or replace editionable trigger fimaki_back_db.bko_empresa_bu_trg before
    update on fimaki_back_db.bko_empresa
    for each row
begin
    :new.modificado := localtimestamp;
    :new.modificado_por := nvl(
        sys_context('APEX$SESSION', 'APP_USER'),
        user
    );
end bko_empresa_bu_trg;
/

alter trigger fimaki_back_db.bko_empresa_bu_trg enable;

