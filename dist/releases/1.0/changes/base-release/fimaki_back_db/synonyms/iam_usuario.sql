-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726194 stripComments:false  logicalFilePath:base-release/fimaki_back_db/synonyms/iam_usuario.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/synonyms/iam_usuario.sql:null:5f16798be4d35b02c6a66c510d8cb3ae33fa10b8:create

create or replace editionable synonym fimaki_back_db.iam_usuario for fimaki_sec_db.iam_usuario;

