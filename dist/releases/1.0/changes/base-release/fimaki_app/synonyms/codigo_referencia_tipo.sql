-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725688 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/codigo_referencia_tipo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/codigo_referencia_tipo.sql:null:565c1febcef61b850a12c89dab0aded0a2a38806:create

create or replace editionable synonym fimaki_app.codigo_referencia_tipo for fimaki_back_db.codigo_referencia_tipo;

