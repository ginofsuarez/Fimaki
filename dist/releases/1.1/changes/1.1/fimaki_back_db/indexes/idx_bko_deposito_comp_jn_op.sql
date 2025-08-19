-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642423694 stripComments:false  logicalFilePath:1.1/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_op.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_op.sql:null:62dfb95e7f758c9f624fb82c0dabc6ba904dbcc8:create

create index fimaki_back_db.idx_bko_deposito_comp_jn_op on
    fimaki_back_db.bko_deposito_comprobante_jn (
        jn_operation
    );

