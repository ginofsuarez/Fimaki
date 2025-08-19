-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725786 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/mail_template.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/mail_template.sql:null:e3f5aa371a72367c5e9dd2174b4a6c90374c2929:create

comment on table fimaki_back_db.mail_template is
    'Tabla para almacenar plantillas de correo electrónico';

