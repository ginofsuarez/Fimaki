-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726087 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_archivo_empresa_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_archivo_empresa_fk1.sql:null:264b5fd4f66902287569028917551c881aa59b5d:create

alter table fimaki_back_db.bko_archivo_empresa
    add constraint bko_archivo_empresa_fk1
        foreign key ( id_empresa )
            references fimaki_back_db.bko_empresa ( id_empresa )
        enable;

