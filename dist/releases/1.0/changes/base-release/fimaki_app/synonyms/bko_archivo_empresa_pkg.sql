-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725599 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_archivo_empresa_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_archivo_empresa_pkg.sql:null:2c4f6a87e8d614bdd106a311624baa1eb67b67a2:create

create or replace editionable synonym fimaki_app.bko_archivo_empresa_pkg for fimaki_back_db.bko_archivo_empresa_pkg;

