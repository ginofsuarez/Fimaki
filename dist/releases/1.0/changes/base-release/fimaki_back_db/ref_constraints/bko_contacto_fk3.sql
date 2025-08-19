-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726102 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_contacto_fk3.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_contacto_fk3.sql:null:ed91f9cb61cb0e9d8bf2e364397a2f8c8f73baef:create

alter table fimaki_back_db.bko_contacto
    add constraint bko_contacto_fk3
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

