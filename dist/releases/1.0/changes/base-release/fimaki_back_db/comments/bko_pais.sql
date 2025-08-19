-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725745 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/bko_pais.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/bko_pais.sql:null:35457839816d25d27864021dd90813313b9e1328:create

comment on column fimaki_back_db.bko_pais.activo_sn is
    'ACTIVO / INACTIVO';

comment on column fimaki_back_db.bko_pais.codigo_iso is
    'Código ISO alfa-2 o alfa-3 (ej. PE, US)';

comment on column fimaki_back_db.bko_pais.creado is
    'Fecha de creacion.';

comment on column fimaki_back_db.bko_pais.creado_por is
    'Usuario interno o sistema creador.';

comment on column fimaki_back_db.bko_pais.id_pais is
    'Identificador único del país';

comment on column fimaki_back_db.bko_pais.modificado is
    'Última fecha de modificación del registro.';

comment on column fimaki_back_db.bko_pais.modificado_por is
    'Usuario interno o sistema que lo modificó.';

comment on column fimaki_back_db.bko_pais.nacionalidad is
    'Gentilicio del país (opcional)';

comment on column fimaki_back_db.bko_pais.nombre is
    'Nombre oficial del país (ej. Perú, USA)';

