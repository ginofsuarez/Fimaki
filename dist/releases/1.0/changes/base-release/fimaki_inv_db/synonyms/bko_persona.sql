-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727251 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/bko_persona.sql:null:b0393fec7a263ea4ad6059caffb6ce6bd664b04e:create

create or replace editionable synonym fimaki_inv_db.bko_persona for fimaki_back_db.bko_persona;

