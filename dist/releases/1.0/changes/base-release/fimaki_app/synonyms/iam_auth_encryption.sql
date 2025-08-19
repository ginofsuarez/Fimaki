-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725693 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/iam_auth_encryption.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/iam_auth_encryption.sql:null:3906017260372052f13bf0b14c69552f6d635d93:create

create or replace editionable synonym fimaki_app.iam_auth_encryption for fimaki_sec_db.iam_auth_encryption;

