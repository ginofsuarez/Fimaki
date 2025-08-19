-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642423691 stripComments:false  logicalFilePath:1.1/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_id.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_id.sql:null:3374a040b2961a584dcd3ad5f109a4ff80bbe067:create

create index fimaki_back_db.idx_bko_deposito_comp_jn_id on
    fimaki_back_db.bko_deposito_comprobante_jn (
        id_comprobante
    );

