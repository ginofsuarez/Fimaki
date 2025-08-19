-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725605 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_empresa.sql:null:2b6d40f3f26b5457c5e42f2aff7375412a489591:create

create or replace editionable synonym fimaki_app.bko_empresa for fimaki_back_db.bko_empresa;

