-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725634 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_solicitud_deposito.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_solicitud_deposito.sql:null:9bf1cb8b3ae707e65fa83b23826bf1396e1ac41a:create

create or replace editionable synonym fimaki_app.bko_solicitud_deposito for fimaki_back_db.bko_solicitud_deposito;

