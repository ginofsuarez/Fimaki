-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727430 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/synonyms/inv_usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/synonyms/inv_usuario_token.sql:null:76938245fe59bb2237d5ed09a848d502c649f45b:create

create or replace editionable synonym fimaki_sec_db.inv_usuario_token for fimaki_inv_db.inv_usuario_token;

