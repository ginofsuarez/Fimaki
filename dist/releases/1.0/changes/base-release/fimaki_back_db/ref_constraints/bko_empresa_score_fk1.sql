-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726133 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_empresa_score_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_empresa_score_fk1.sql:null:2c5774c93e722fd313cef1c7355ae3863f9690f6:create

alter table fimaki_back_db.bko_empresa_score
    add constraint bko_empresa_score_fk1
        foreign key ( id_empresa )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;

