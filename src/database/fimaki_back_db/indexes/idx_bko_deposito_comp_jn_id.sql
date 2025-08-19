create index fimaki_back_db.idx_bko_deposito_comp_jn_id on
    fimaki_back_db.bko_deposito_comprobante_jn (
        id_comprobante
    );


-- sqlcl_snapshot {"hash":"3374a040b2961a584dcd3ad5f109a4ff80bbe067","type":"INDEX","name":"IDX_BKO_DEPOSITO_COMP_JN_ID","schemaName":"FIMAKI_BACK_DB","sxml":"\n  <INDEX xmlns=\"http://xmlns.oracle.com/ku\" version=\"1.0\">\n   <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n   <NAME>IDX_BKO_DEPOSITO_COMP_JN_ID</NAME>\n   <TABLE_INDEX>\n      <ON_TABLE>\n         <SCHEMA>FIMAKI_BACK_DB</SCHEMA>\n         <NAME>BKO_DEPOSITO_COMPROBANTE_JN</NAME>\n      </ON_TABLE>\n      <COL_LIST>\n         <COL_LIST_ITEM>\n            <NAME>ID_COMPROBANTE</NAME>\n         </COL_LIST_ITEM>\n      </COL_LIST>\n      \n   </TABLE_INDEX>\n</INDEX>"}