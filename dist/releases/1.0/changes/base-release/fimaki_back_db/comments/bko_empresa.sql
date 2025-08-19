-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725734 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_empresa.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_empresa.sql:null:3cfbe538d82c416312fa9a1fcaffbb3661544f1c:create

comment on column fimaki_back_db.bko_empresa.actividad_economica_rc is
    'Sector de operación de la empresa';

comment on column fimaki_back_db.bko_empresa.estado_rc is
    'ACTIVO / INACTIVO / BLOQUEADO';

comment on column fimaki_back_db.bko_empresa.fecha_constitucion is
    'Fecha de constitución legal';

comment on column fimaki_back_db.bko_empresa.id_empresa is
    'Identificador único de la empresa';

comment on column fimaki_back_db.bko_empresa.pagina_web is
    'Página web (opcional)';

