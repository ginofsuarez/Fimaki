-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726129 stripComments:false  logicalFilePath:base-release/fimaki_back_db/ref_constraints/bko_empresa_fk1.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/ref_constraints/bko_empresa_fk1.sql:null:3ef703b54809db6b2ea174a4d45f509df626074e:create

alter table fimaki_back_db.bko_empresa
    add constraint bko_empresa_fk1
        foreign key ( id_persona )
            references fimaki_back_db.bko_persona ( id_persona )
        enable;

