-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755640727428 stripComments:false  logicalFilePath:base-release/fimaki_sec_db/synonyms/bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/synonyms/bko_persona.sql:null:2173006e7eb4489b093415e8958a055a66158eda:create

create or replace editionable synonym fimaki_sec_db.bko_persona for fimaki_back_db.bko_persona;

