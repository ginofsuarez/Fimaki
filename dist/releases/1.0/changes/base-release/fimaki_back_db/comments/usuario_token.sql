-- liquibase formatted sql
-- changeset fimaki_back_db:1755640725797 stripComments:false  logicalFilePath:base-release/fimaki_back_db/comments/usuario_token.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/comments/usuario_token.sql:null:96a89f9e02c0430abab9037bc5d55a1d853d259c:create

comment on table fimaki_back_db.usuario_token is
    'Tabla que almacena los tokens de activacion y reset de contrasena de los usuarios.';

comment on column fimaki_back_db.usuario_token.expiracion is
    'Fecha de expiracion del token.';

comment on column fimaki_back_db.usuario_token.fecha_generacion is
    'Fecha de generacion del token.';

comment on column fimaki_back_db.usuario_token.fecha_uso is
    'Fecha en la que se uso el token.';

comment on column fimaki_back_db.usuario_token.id_token is
    'Identificador unico del token.';

comment on column fimaki_back_db.usuario_token.id_usuario is
    'Identificador del usuario al que pertenece el token.';

comment on column fimaki_back_db.usuario_token.ip_uso is
    'IP desde la que se uso el token.';

comment on column fimaki_back_db.usuario_token.tipo_rc is
    'Tipo de token (activacion, reset, etc.).';

comment on column fimaki_back_db.usuario_token.token is
    'Token de activacion o reset.';

comment on column fimaki_back_db.usuario_token.usado is
    'Indica si el token ha sido usado (S/N).';

comment on column fimaki_back_db.usuario_token.user_agent_uso is
    'User agent desde el que se uso el token.';

