-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727253 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/bko_persona_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/bko_persona_pkg.sql:null:826424f5e4023b41297a760cf5d26034975d2db3:create

create or replace editionable synonym fimaki_inv_db.bko_persona_pkg for fimaki_back_db.bko_persona_pkg;

