-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725625 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_persona.sql:null:2a6dadc13cefdd66321e222ba7a5624ff13574d9:create

create or replace editionable synonym fimaki_app.bko_persona for fimaki_back_db.bko_persona;

