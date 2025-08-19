-- liquibase formatted sql
-- changeset ADMIN:1755640725596 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_app.view.emp_archivos_tmp_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/object_grants/object_grants_as_grantor.fimaki_app.view.emp_archivos_tmp_v.sql:null:624a73be488b1e306b45e9c2052523bb49118e3b:create

grant select on fimaki_app.emp_archivos_tmp_v to fimaki_back_db;

