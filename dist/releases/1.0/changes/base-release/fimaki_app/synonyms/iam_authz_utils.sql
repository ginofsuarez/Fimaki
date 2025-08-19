-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725697 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/iam_authz_utils.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/iam_authz_utils.sql:null:2f98b2e11033356adb1af7164b674bcf68fd71a7:create

create or replace editionable synonym fimaki_app.iam_authz_utils for fimaki_sec_db.iam_authz_utils;

