-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642432135 stripComments:false  logicalFilePath:1.1/fimaki_back_db/tables/mail_template.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/tables/mail_template.sql:a9b7133b47576b8e12420832f0d5f529b3ae764c:7788dc1a40ffad449aa089216c394025146f1bdc:alter

alter table fimaki_back_db.mail_template modify (
    codigo not null enable
)
/

alter table fimaki_back_db.mail_template modify (
    nombre not null enable
)
/

alter table fimaki_back_db.mail_template modify (
    asunto not null enable
)
/

alter table fimaki_back_db.mail_template modify (
    contenido_html not null enable
)
/

alter table fimaki_back_db.mail_template add primary key ( id_template )
    using index enable
/

alter table fimaki_back_db.mail_template add unique ( codigo )
    using index enable
/

alter table fimaki_back_db.mail_template
    add constraint chk_mail_template_activo
        check ( activo in ( 'S', 'N' ) ) enable
/

