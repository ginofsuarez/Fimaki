-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725784 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/codigo_referencia_tipo.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/codigo_referencia_tipo.sql:null:cf075057203ceff72fcb46ddc2946e7ce935afdd:create

comment on column fimaki_back_db.codigo_referencia_tipo.activo_sn is
    'S/N - activo/inactivo';

comment on column fimaki_back_db.codigo_referencia_tipo.codigo is
    'Código legible y predefinido (ej. INV-WEB, REF-JURIDIC).';

comment on column fimaki_back_db.codigo_referencia_tipo.creado is
    'Fecha de registro.';

comment on column fimaki_back_db.codigo_referencia_tipo.creado_por is
    'Usuario interno o sistema que lo registró';

comment on column fimaki_back_db.codigo_referencia_tipo.descripcion is
    'Descripción funcional del código.';

comment on column fimaki_back_db.codigo_referencia_tipo.id_codigo_ref_tipo is
    'Identificador único del código de referencia Tipo';

comment on column fimaki_back_db.codigo_referencia_tipo.modificado is
    'Última fecha de modificación del registro.';

comment on column fimaki_back_db.codigo_referencia_tipo.modificado_por is
    'Usuario interno o sistema que lo modificó';

comment on column fimaki_back_db.codigo_referencia_tipo.nombre is
    'Nombre funcional del código.';

comment on column fimaki_back_db.codigo_referencia_tipo.sistema_sn is
    'S/N - si puede ser seleccionado/modificado por el usuario final';

