-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727267 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/iam_authz_utils.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/iam_authz_utils.sql:null:1e00efe46349f502464fcff110f91c5c9ad9e049:create

create or replace editionable synonym fimaki_inv_db.iam_authz_utils for fimaki_sec_db.iam_authz_utils;

