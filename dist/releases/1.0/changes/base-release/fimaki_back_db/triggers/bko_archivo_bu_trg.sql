-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726662 stripComments:false  logicalFilePath:base-release/fimaki_back_db/triggers/bko_archivo_bu_trg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/triggers/bko_archivo_bu_trg.sql:null:86486c72014b6c4bd23b76469643db6de84d3684:create

create or replace editionable trigger fimaki_back_db.bko_archivo_bu_trg before
    update on fimaki_back_db.bko_archivo
    for each row
begin
    :new.modificado := current_timestamp;
    :new.modificado_por := sys_context('USERENV', 'SESSION_USER');
end bko_archivo_bu_trg;
/

alter trigger fimaki_back_db.bko_archivo_bu_trg enable;

