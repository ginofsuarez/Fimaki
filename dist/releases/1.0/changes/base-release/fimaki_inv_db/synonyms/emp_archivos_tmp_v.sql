-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727261 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/emp_archivos_tmp_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/emp_archivos_tmp_v.sql:null:67c3310dc898b885f23222644b8e63f3c9362025:create

create or replace editionable synonym fimaki_inv_db.emp_archivos_tmp_v for fimaki_app.emp_archivos_tmp_v;

