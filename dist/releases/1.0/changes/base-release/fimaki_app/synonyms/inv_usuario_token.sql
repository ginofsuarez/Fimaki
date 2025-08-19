-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725707 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/inv_usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/inv_usuario_token.sql:null:492557623efaf4edc4b7a97a4ce731fe24114db0:create

create or replace editionable synonym fimaki_app.inv_usuario_token for fimaki_inv_db.inv_usuario_token;

