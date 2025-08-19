-- liquibase formatted sql
-- changeset FIMAKI_APP:1755642423684 stripComments:false  logicalFilePath:1.1/fimaki_app/synonyms/bko_solicitud_deposito_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_solicitud_deposito_pkg.sql:null:a4495889953ab15d7181a4c9ad07a4360e55d56c:create

create or replace editionable synonym fimaki_app.bko_solicitud_deposito_pkg for fimaki_back_db.bko_solicitud_deposito_pkg;

