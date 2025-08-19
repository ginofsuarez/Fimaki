-- liquibase formatted sql
-- changeset ADMIN:1755640725848 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.fimaki_back_db.table.variable_sistema.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/object_grants/object_grants_as_grantor.fimaki_back_db.table.variable_sistema.sql:null:b5261497f53349ef7ab4a7d3f6f5ce0db121ef56:create

grant select on fimaki_back_db.variable_sistema to fimaki_inv_db;

