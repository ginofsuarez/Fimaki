comment on column fimaki_inv_db.inv_usuario_token.expiracion is
    'Fecha de expiracion del token.';

comment on column fimaki_inv_db.inv_usuario_token.fecha_generacion is
    'Fecha de generacion del token.';

comment on column fimaki_inv_db.inv_usuario_token.fecha_uso is
    'Fecha en la que se uso el token.';

comment on column fimaki_inv_db.inv_usuario_token.id_token is
    'Identificador unico del token.';

comment on column fimaki_inv_db.inv_usuario_token.id_usuario is
    'Identificador del usuario al que pertenece el token.';

comment on column fimaki_inv_db.inv_usuario_token.ip_uso is
    'IP desde la que se uso el token.';

comment on column fimaki_inv_db.inv_usuario_token.tipo_rc is
    'Tipo de token (activacion, reset, etc.).';

comment on column fimaki_inv_db.inv_usuario_token.token is
    'Token de activacion o reset.';

comment on column fimaki_inv_db.inv_usuario_token.usado is
    'Indica si el token ha sido usado (S/N).';

comment on column fimaki_inv_db.inv_usuario_token.user_agent_uso is
    'User agent desde el que se uso el token.';


-- sqlcl_snapshot {"hash":"1dd984dd9098b633eb4e260a623b16fb3dc16945","type":"COMMENT","name":"inv_usuario_token","schemaName":"fimaki_inv_db","sxml":""}