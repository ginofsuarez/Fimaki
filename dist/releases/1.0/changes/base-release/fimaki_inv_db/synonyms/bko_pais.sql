-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727250 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/bko_pais.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/bko_pais.sql:null:91e8355a25a620a53350c67745fc3ce5599a68e7:create

create or replace editionable synonym fimaki_inv_db.bko_pais for fimaki_back_db.bko_pais;

