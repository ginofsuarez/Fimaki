-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755642423696 stripComments:false  logicalFilePath:1.1/fimaki_inv_db/synonyms/subdivision_geografica.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/subdivision_geografica.sql:null:f57e64a5775a06372dcd2033d738b3160d8abc15:create

create or replace editionable synonym fimaki_inv_db.subdivision_geografica for fimaki_back_db.subdivision_geografica;

