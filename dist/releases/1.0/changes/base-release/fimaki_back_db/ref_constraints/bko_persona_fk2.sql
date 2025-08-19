-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726169 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_persona_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_persona_fk2.sql:null:0c3ac8aef268c98ff2c8ca5268fc595d9367a8c4:create

alter table fimaki_back_db.bko_persona
    add constraint bko_persona_fk2
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;

