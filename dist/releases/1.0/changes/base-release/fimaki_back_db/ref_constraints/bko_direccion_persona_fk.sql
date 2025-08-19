-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726121 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_direccion_persona_fk.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_direccion_persona_fk.sql:null:b77b60a153210aa6bd2158892d4a0c26be88b010:create

alter table fimaki_back_db.bko_direccion_persona
    add constraint bko_direccion_persona_fk
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

