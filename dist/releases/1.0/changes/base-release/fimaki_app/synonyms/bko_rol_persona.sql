-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725630 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_rol_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_rol_persona.sql:null:8717c8a04fefae6d8ff3289a6826aa8c4598585c:create

create or replace editionable synonym fimaki_app.bko_rol_persona for fimaki_back_db.bko_rol_persona;

