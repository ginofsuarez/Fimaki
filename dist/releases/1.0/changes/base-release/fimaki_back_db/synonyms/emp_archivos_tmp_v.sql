-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726192 stripComments:false  logicalFilePath:base-release/fimaki_back_db/synonyms/emp_archivos_tmp_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/synonyms/emp_archivos_tmp_v.sql:null:d8f5818dbcdf9428f675a2f98366de7341fd06d1:create

create or replace editionable synonym fimaki_back_db.emp_archivos_tmp_v for fimaki_app.emp_archivos_tmp_v;

