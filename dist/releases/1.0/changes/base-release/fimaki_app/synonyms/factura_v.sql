-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725690 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/factura_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/factura_v.sql:null:53f86bbdb346c93bc9a3ab7bd0a881e1aade5ab0:create

create or replace editionable synonym fimaki_app.factura_v for fimaki_back_db.factura_v;

