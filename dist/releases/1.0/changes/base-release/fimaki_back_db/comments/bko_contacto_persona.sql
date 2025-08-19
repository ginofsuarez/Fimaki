-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725725 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_contacto_persona.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_contacto_persona.sql:null:b7ec605d9082173722dce12a0a608edef077b166:create

comment on table fimaki_back_db.bko_contacto_persona is
    'Información de contacto asociada a un rol específico de una persona (ej. contacto como CEDENTE, PAGADOR o INVERSIONISTA).';

comment on column fimaki_back_db.bko_contacto_persona.id_contacto_persona is
    'Identificador único del contacto.';

