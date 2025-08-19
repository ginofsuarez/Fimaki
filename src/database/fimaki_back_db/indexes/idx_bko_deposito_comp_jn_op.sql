create index fimaki_back_db.idx_bko_deposito_comp_jn_op on
    fimaki_back_db.bko_deposito_comprobante_jn (
        jn_operation
    );


-- sqlcl_snapshot {"hash":"62dfb95e7f758c9f624fb82c0dabc6ba904dbcc8","type":"INDEX","name":"IDX_BKO_DEPOSITO_COMP_JN_OP","schemaName":"FIMAKI_BACK_DB","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n   <NAME>IDX_BKO_DEPOSITO_COMP_JN_OP</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n         <NAME>BKO_DEPOSITO_COMPROBANTE_JN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>JN_OPERATION</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}