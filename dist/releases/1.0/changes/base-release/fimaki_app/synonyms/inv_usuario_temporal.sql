-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725703 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/inv_usuario_temporal.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/inv_usuario_temporal.sql:null:c8b28941c375d2815200a2ac380ee0f5849dbfcc:create

create or replace editionable synonym fimaki_app.inv_usuario_temporal for fimaki_inv_db.inv_usuario_temporal;

