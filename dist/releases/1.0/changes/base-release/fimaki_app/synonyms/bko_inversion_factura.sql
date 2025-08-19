-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725613 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_inversion_factura.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_inversion_factura.sql:null:86b8049a18e896e95400bc6c203b18747261df30:create

create or replace editionable synonym fimaki_app.bko_inversion_factura for fimaki_back_db.bko_inversion_factura;

