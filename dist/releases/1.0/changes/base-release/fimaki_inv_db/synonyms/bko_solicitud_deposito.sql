-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727256 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/bko_solicitud_deposito.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/bko_solicitud_deposito.sql:null:05b94d02a890e4c0194c995b9419908719541510:create

create or replace editionable synonym fimaki_inv_db.bko_solicitud_deposito for fimaki_back_db.bko_solicitud_deposito;

