-- liquibase formatted sql
-- changeset ADMIN:1755640727107 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_inv_db.function.is_valid_activation_token_fn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/object_grants/object_grants_as_grantor.fimaki_inv_db.function.is_valid_activation_token_fn.sql:null:93a8052eeddf4c69317514ddb9b6279ffa412633:create

grant execute on fimaki_inv_db.is_valid_activation_token_fn to fimaki_app;

