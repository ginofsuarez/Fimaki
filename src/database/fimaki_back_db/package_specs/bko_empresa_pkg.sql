create or replace package fimaki_back_db.bko_empresa_pkg as
    procedure upsert_bko_empresa (
        p_row in out bko_empresa%rowtype
    );

    function es_ruc_valido (
        p_ruc in varchar2
    ) return varchar2;

end bko_empresa_pkg;
/


-- sqlcl_snapshot {"hash":"49f887b2abb56bcbcc7f203449e10d81f6e1835a","type":"PACKAGE_SPEC","name":"BKO_EMPRESA_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}