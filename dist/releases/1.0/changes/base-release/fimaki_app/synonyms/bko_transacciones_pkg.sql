-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725683 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_transacciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_transacciones_pkg.sql:null:3a95b96bc731a817e7587e2197ef34e2bd7f2fe8:create

create or replace editionable synonym fimaki_app.bko_transacciones_pkg for fimaki_back_db.bko_transacciones_pkg;

