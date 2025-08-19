-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725616 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_movimiento_financiero.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_movimiento_financiero.sql:null:2c3bef8639b2cbdc34ae23164f27ac2a5df005a5:create

create or replace editionable synonym fimaki_app.bko_movimiento_financiero for fimaki_back_db.bko_movimiento_financiero;

