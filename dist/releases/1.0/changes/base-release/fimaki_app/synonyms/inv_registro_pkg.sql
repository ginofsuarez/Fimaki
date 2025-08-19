-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725701 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/inv_registro_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/inv_registro_pkg.sql:null:ef1803e6b8ab93fb218314ae328fd7df7c150785:create

create or replace editionable synonym fimaki_app.inv_registro_pkg for fimaki_inv_db.inv_registro_pkg;

