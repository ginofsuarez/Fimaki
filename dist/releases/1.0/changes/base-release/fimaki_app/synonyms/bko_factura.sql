-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725608 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_factura.sql:null:ae143c9fb8da9b9547363b45685b601a3f3680ef:create

create or replace editionable synonym fimaki_app.bko_factura for fimaki_back_db.bko_factura;

