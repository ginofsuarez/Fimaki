-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727269 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/iam_usuario.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/iam_usuario.sql:null:847aa88db66f2d597a853685cb0331ba859caf6b:create

create or replace editionable synonym fimaki_inv_db.iam_usuario for fimaki_sec_db.iam_usuario;

