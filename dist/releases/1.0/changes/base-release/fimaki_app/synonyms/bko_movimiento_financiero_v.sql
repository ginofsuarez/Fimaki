-- liquibase formatted sql
-- changeset FIMAKI_APP:1755640725618 stripComments:false  logicalFilePath:base-release/fimaki_app/synonyms/bko_movimiento_financiero_v.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_app/synonyms/bko_movimiento_financiero_v.sql:null:4cf2ab5cccd17d85700112cfb440d81e6736ebf6:create

create or replace editionable synonym fimaki_app.bko_movimiento_financiero_v for fimaki_back_db.bko_movimiento_financiero_v;

