-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725620 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_operaciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_operaciones_pkg.sql:null:8ee7a8514d00d466f60a1772f272e4cfdd593704:create

create or replace editionable synonym fimaki_app.bko_operaciones_pkg for fimaki_back_db.bko_operaciones_pkg;

