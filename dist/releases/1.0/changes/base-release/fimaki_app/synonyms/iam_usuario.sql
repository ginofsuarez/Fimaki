-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725698 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/iam_usuario.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/iam_usuario.sql:null:684316c855ad138c1ffac0101fdf78a2857cf39e:create

create or replace editionable synonym fimaki_app.iam_usuario for fimaki_sec_db.iam_usuario;

