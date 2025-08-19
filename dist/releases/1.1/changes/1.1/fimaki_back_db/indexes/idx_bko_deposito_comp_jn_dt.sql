-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642423688 stripComments:false  logicalFilePath:1.1/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_dt.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/indexes/idx_bko_deposito_comp_jn_dt.sql:null:316a9c89a883b143c46aa7a634a9ad6feb822cbc:create

create index fimaki_back_db.idx_bko_deposito_comp_jn_dt on
    fimaki_back_db.bko_deposito_comprobante_jn (
        jn_datetime
    );

