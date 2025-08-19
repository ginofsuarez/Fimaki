comment on table fimaki_sec_db.iam_usuario is
    'Tabla que almacena los usuarios del sistema y su información de autenticación.';

comment on column fimaki_sec_db.iam_usuario.apellido_materno is
    'Apellido materno del usuario (opcional).';

comment on column fimaki_sec_db.iam_usuario.apellido_paterno is
    'Apellido paterno del usuario.';

comment on column fimaki_sec_db.iam_usuario.bloqueado_sn is
    'Indica si el usuario está bloqueado (S=Sí, N=No).';

comment on column fimaki_sec_db.iam_usuario.contrasena is
    'Contraseña cifrada del usuario.';

comment on column fimaki_sec_db.iam_usuario.contrasena_expira_en is
    'Fecha y hora en que expira la contraseña del usuario.';

comment on column fimaki_sec_db.iam_usuario.correo is
    'Correo electrónico único del usuario.';

comment on column fimaki_sec_db.iam_usuario.creado is
    'Fecha y hora de creación del registro.';

comment on column fimaki_sec_db.iam_usuario.creado_por is
    'Usuario que creó el registro.';

comment on column fimaki_sec_db.iam_usuario.id_usuario is
    'Identificador único del usuario.';

comment on column fimaki_sec_db.iam_usuario.modificado is
    'Fecha y hora de la última modificación del registro.';

comment on column fimaki_sec_db.iam_usuario.modificado_por is
    'Último usuario que modificó el registro.';

comment on column fimaki_sec_db.iam_usuario.nombres is
    'Nombres del usuario.';

comment on column fimaki_sec_db.iam_usuario.nombre_usuario is
    'Nombre de usuario único para autenticación.';

comment on column fimaki_sec_db.iam_usuario.requiere_cambio_contrasena_sn is
    'Indica si el usuario debe cambiar su contraseña al iniciar sesión (S=Sí, N=No).';


-- sqlcl_snapshot {"hash":"0ab583c3a0b3466062f887d83e9cd39a5c55945c","type":"COMMENT","name":"iam_usuario","schemaName":"fimaki_sec_db","sxml":""}