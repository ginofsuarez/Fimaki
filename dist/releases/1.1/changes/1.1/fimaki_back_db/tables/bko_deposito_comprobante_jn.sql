-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642427404 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/bko_deposito_comprobante_jn.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/bko_deposito_comprobante_jn.sql:71aee0bd08b0d96471ed4f11460f6dccdcdf056c:11f4afd7c2e1467b7a98cba4be89a400380c1ddf:alter

alter table fimaki_back_db.bko_deposito_comprobante_jn modify (
    jn_operation not null enable
)
/

alter table fimaki_back_db.bko_deposito_comprobante_jn modify (
    jn_oracle_user not null enable
)
/

alter table fimaki_back_db.bko_deposito_comprobante_jn modify (
    jn_datetime not null enable
)
/

