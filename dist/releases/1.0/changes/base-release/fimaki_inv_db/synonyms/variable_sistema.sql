-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727272 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/variable_sistema.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/variable_sistema.sql:null:0f939fc7cff13f949304655dd483aa41903820d2:create

create or replace editionable synonym fimaki_inv_db.variable_sistema for fimaki_back_db.variable_sistema;

