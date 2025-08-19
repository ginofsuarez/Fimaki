-- liquibase formatted sql
-- changeset ADMIN:1755642434210 stripComments:false  logicalFilePath:1.1/admin/object_grants/object_grants_as_grantor.sys.package_spec.dbms_crypto.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/sys/object_grants/object_grants_as_grantor.sys.package_spec.dbms_crypto.sql:a8f67fc08a4ebf4620b80cd8aa14a2dab3bda7b2:aab2129efee4655eeca5db4519c72d98ddc052ba:alter

grant execute on sys.dbms_crypto to fimaki_back_db;

grant execute on sys.dbms_crypto to fimaki_inv_db;

grant execute on sys.dbms_crypto to fimaki_sec_db;

