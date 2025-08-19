-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725695 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/iam_authentication.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/iam_authentication.sql:null:5f625319af31a15dd090d30015d82ac528707271:create

create or replace editionable synonym fimaki_app.iam_authentication for fimaki_sec_db.iam_authentication;

