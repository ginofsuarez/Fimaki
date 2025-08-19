-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726178 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_score_empresa_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_score_empresa_fk1.sql:null:ff4cece78a5c277e89900808dc1e2214c4a41b56:create

alter table fimaki_back_db.bko_score_empresa
    add constraint bko_score_empresa_fk1
        foreign key ( id_rol_persona )
            references fimaki_back_db.bko_rol_persona ( id_rol_persona )
        enable;

