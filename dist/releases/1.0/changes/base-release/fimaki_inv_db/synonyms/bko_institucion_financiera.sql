-- liquibase formatted sql
-- changeset FIMAKI_INV_DB:1755640727248 stripComments:false  logicalFilePath:base-release/fimaki_inv_db/synonyms/bko_institucion_financiera.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_inv_db/synonyms/bko_institucion_financiera.sql:null:c52b339d73acc4b26b6011242fcf0b78e982eb1e:create

create or replace editionable synonym fimaki_inv_db.bko_institucion_financiera for fimaki_back_db.bko_institucion_financiera;

