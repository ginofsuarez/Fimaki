-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726125 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_direccion_persona_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_direccion_persona_fk1.sql:null:0cfb1d7140cf5cc07934278afdb713ba7a6bbb37:create

alter table fimaki_back_db.bko_direccion_persona
    add constraint bko_direccion_persona_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
        enable;

