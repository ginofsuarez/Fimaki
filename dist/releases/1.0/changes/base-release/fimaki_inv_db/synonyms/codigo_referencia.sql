-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727258 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/codigo_referencia.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/codigo_referencia.sql:null:d76274f57b31a28e6a8b93a21f79795523877b46:create

create or replace editionable synonym fimaki_inv_db.codigo_referencia for fimaki_back_db.codigo_referencia;

