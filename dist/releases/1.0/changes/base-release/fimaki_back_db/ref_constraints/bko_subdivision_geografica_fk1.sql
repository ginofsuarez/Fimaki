-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726190 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_subdivision_geografica_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_subdivision_geografica_fk1.sql:null:8381194b0cf81be604755fa57daee19c7f4991db:create

alter table fimaki_back_db.bko_subdivision_geografica
    add constraint bko_subdivision_geografica_fk1
        foreign key ( id_pais )
            references fimaki_back_db.bko_pais ( id_pais )
                on delete cascade
        enable;

