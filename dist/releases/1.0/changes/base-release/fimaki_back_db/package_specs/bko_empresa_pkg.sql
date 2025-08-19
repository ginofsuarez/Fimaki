-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726039 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/bko_empresa_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/bko_empresa_pkg.sql:null:49f887b2abb56bcbcc7f203449e10d81f6e1835a:create

create or replace package fimaki_back_db.bko_empresa_pkg as
    procedure upsert_bko_empresa (
        p_row in out bko_empresa%rowtype
    );

    function es_ruc_valido (
        p_ruc in varchar2
    ) return varchar2;

end bko_empresa_pkg;
/

