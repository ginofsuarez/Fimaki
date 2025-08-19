-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727265 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/iam_authentication.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/iam_authentication.sql:null:65f531d075debad801732b3c65ab4b494d0c7878:create

create or replace editionable synonym fimaki_inv_db.iam_authentication for fimaki_sec_db.iam_authentication;

