-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725602 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_cuenta_bancaria.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_cuenta_bancaria.sql:null:ea8ca0e95f2f9e7ee3d05d61b51c60734595bf35:create

create or replace editionable synonym fimaki_app.bko_cuenta_bancaria for fimaki_back_db.bko_cuenta_bancaria;

