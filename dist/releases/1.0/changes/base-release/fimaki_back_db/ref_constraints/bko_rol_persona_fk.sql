-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726173 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_rol_persona_fk.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_rol_persona_fk.sql:null:f27fdf543aa936f698ec9a234d57930867f8f04a:create

alter table fimaki_back_db.bko_rol_persona
    add constraint bko_rol_persona_fk
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

