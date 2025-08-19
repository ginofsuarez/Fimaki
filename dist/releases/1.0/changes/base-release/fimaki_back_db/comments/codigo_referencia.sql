-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725779 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/codigo_referencia.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/codigo_referencia.sql:null:16cc8ad8069dab72d012392a7d664c1ececa01d1:create

comment on column fimaki_back_db.codigo_referencia.activo_sn is
    'S/N';

comment on column fimaki_back_db.codigo_referencia.codigo is
    'Código legible y predefinido (ej. INV-WEB, REF-JURIDIC)';

comment on column fimaki_back_db.codigo_referencia.codigo_ref_tipo is
    'Identificador del código de referencia Padre';

comment on column fimaki_back_db.codigo_referencia.creado is
    'Fecha de creación del registro';

comment on column fimaki_back_db.codigo_referencia.creado_por is
    'Usuario interno o sistema que lo registró';

comment on column fimaki_back_db.codigo_referencia.descripcion is
    'Descripción funcional del código.';

comment on column fimaki_back_db.codigo_referencia.id_codigo_referencia is
    'Identificador único del código de referencia';

comment on column fimaki_back_db.codigo_referencia.modificado is
    'Última fecha de modificación del registro.';

comment on column fimaki_back_db.codigo_referencia.modificado_por is
    'Usuario interno o sistema que lo modificó.';

comment on column fimaki_back_db.codigo_referencia.nombre is
    'Nombre funcional del codigo de referencia.';

comment on column fimaki_back_db.codigo_referencia.secuencia is
    'orden de visualizacion';

