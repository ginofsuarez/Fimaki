-- liquibase formatted sql
-- changeset FIMAKI_SEC_DB:1755642423698 stripComments:false  logicalFilePath:1.1/fimaki_sec_db/synonyms/utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_sec_db/synonyms/utils_pkg.sql:null:5ae202e8823f98988f634fe230b14b0a8183836c:create

create or replace editionable synonym fimaki_sec_db.utils_pkg for fimaki_back_db.utils_pkg;

