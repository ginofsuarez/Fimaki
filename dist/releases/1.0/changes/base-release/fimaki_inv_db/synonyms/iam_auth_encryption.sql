-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727263 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/iam_auth_encryption.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/iam_auth_encryption.sql:null:586785e942b6cb3863e968fb3c320bfd16aadadd:create

create or replace editionable synonym fimaki_inv_db.iam_auth_encryption for fimaki_sec_db.iam_auth_encryption;

