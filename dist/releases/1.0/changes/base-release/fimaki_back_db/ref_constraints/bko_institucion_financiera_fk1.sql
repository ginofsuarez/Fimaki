-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726145 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_institucion_financiera_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_institucion_financiera_fk1.sql:null:26afaa5be3f81a5f588b2821e29728d3494df482:create

alter table fimaki_back_db.bko_institucion_financiera
    add constraint bko_institucion_financiera_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;

