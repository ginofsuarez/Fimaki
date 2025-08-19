-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725623 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_pais.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_pais.sql:null:272fa3faa57e8abaafbdc36629db7fdd2e011989:create

create or replace editionable synonym fimaki_app.bko_pais for fimaki_back_db.bko_pais;

