-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726091 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_archivo_empresa_fk2.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_archivo_empresa_fk2.sql:null:cfcaac02732aadb7376aeadf6610490b6b57a67a:create

alter table fimaki_back_db.bko_archivo_empresa
    add constraint bko_archivo_empresa_fk2
        foreign key ( id_archivo )
            references fimaki_back_db.bko_archivo ( id_archivo )
        enable;

