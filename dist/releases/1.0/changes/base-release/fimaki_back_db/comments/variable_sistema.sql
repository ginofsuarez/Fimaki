-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725802 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/variable_sistema.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/variable_sistema.sql:null:efd1e03cea1c688ea6209b559c535bde4761cddd:create

comment on column fimaki_back_db.variable_sistema.creado is
    'Fecha de creacion.';

comment on column fimaki_back_db.variable_sistema.creado_por is
    'Usuario creador.';

comment on column fimaki_back_db.variable_sistema.descripcion is
    'Description de la variable.';

comment on column fimaki_back_db.variable_sistema.id_variable is
    'Identificador unico';

comment on column fimaki_back_db.variable_sistema.modificado is
    'Ultima fecha de moidificacion.';

comment on column fimaki_back_db.variable_sistema.modificado_por is
    'Ultimo usuario que modificó.';

comment on column fimaki_back_db.variable_sistema.nombre_variable is
    'Nombre de la variable.';

comment on column fimaki_back_db.variable_sistema.valor is
    'Valor de variable.';

