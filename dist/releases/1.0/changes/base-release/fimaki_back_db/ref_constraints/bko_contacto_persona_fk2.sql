-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726110 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_contacto_persona_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_contacto_persona_fk2.sql:null:32bc072d7ec4823544ac78f8c29d7fbb9f1cbf05:create

alter table fimaki_back_db.bko_contacto_persona
    add constraint bko_contacto_persona_fk2
        foreign key ( id_contacto )
            references fimaki_back_db.bko_contacto ( id_contacto )
        enable;

