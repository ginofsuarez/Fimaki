-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727260 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/codigo_referencia_tipo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/codigo_referencia_tipo.sql:null:5bb00774e0dadf7552d19502e647cee1804c3f1a:create

create or replace editionable synonym fimaki_inv_db.codigo_referencia_tipo for fimaki_back_db.codigo_referencia_tipo;

