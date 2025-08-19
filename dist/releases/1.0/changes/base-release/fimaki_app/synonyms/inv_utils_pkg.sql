-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725709 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/inv_utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/inv_utils_pkg.sql:null:7b61297acf4ddf58b0bd74f48ed965b09c121f68:create

create or replace editionable synonym fimaki_app.inv_utils_pkg for fimaki_inv_db.inv_utils_pkg;

