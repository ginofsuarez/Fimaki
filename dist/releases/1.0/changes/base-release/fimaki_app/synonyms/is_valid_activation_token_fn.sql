-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725712 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/is_valid_activation_token_fn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/is_valid_activation_token_fn.sql:null:f1855de1fc605b69a5fbed0560893f50839649da:create

create or replace editionable synonym fimaki_app.is_valid_activation_token_fn for fimaki_inv_db.is_valid_activation_token_fn;

