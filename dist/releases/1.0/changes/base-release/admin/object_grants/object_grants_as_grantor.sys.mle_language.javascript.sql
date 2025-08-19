-- liquibase formatted sql
-- changeset ADMIN:1755640727487 stripComments:false  logicalFilePath:base-release/admin/object_grants/object_grants_as_grantor.sys.mle_language.javascript.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/sys/object_grants/object_grants_as_grantor.sys.mle_language.javascript.sql:null:e62ae100ff8360894e4305350ab268be5ca9424e:create

grant execute on sys.javascript to fimaki_app;

grant execute on sys.javascript to fimaki_inv_db;

grant execute on sys.javascript to fimaki_back_db;

grant execute on sys.javascript to fimaki_sec_db;

