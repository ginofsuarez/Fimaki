-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725610 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_institucion_financiera.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_institucion_financiera.sql:null:c017230f6e864c189804a828d42a62c39738b6e7:create

create or replace editionable synonym fimaki_app.bko_institucion_financiera for fimaki_back_db.bko_institucion_financiera;

