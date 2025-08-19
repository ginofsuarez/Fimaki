create index fimaki_back_db.idx_bko_deposito_comp_jn_dt on
    fimaki_back_db.bko_deposito_comprobante_jn (
        jn_datetime
    );


-- sqlcl_snapshot {"hash":"316a9c89a883b143c46aa7a634a9ad6feb822cbc","type":"INDEX","name":"IDX_BKO_DEPOSITO_COMP_JN_DT","schemaName":"FIMAKI_BACK_DB","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n   <NAME>IDX_BKO_DEPOSITO_COMP_JN_DT</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n         <NAME>BKO_DEPOSITO_COMPROBANTE_JN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>JN_DATETIME</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}