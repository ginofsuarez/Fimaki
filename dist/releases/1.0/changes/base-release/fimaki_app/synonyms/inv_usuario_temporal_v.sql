-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725705 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/inv_usuario_temporal_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/inv_usuario_temporal_v.sql:null:ed23922accc9d09195274fa42a004c7cb03a5670:create

create or replace editionable synonym fimaki_app.inv_usuario_temporal_v for fimaki_inv_db.inv_usuario_temporal_v;

