-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727270 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/utils_pkg.sql:null:3e78b61c97ebf4efaa9d4591db88ce11c0114ad6:create

create or replace editionable synonym fimaki_inv_db.utils_pkg for fimaki_back_db.utils_pkg;

