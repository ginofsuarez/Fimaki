-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726106 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_contacto_persona_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_contacto_persona_fk1.sql:null:adce6f2d97c428eedbd4f3b97af22802329df054:create

alter table fimaki_back_db.bko_contacto_persona
    add constraint bko_contacto_persona_fk1
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

