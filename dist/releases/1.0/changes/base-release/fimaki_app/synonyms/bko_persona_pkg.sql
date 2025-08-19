-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725627 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_persona_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_persona_pkg.sql:null:a3b11e587fc3e1341875a626055c132e0a1ddea0:create

create or replace editionable synonym fimaki_app.bko_persona_pkg for fimaki_back_db.bko_persona_pkg;

