-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725685 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/codigo_referencia.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/codigo_referencia.sql:null:0fdd7b999a4ff49d0f8c7ea6ad3d373fd5494830:create

create or replace editionable synonym fimaki_app.codigo_referencia for fimaki_back_db.codigo_referencia;

