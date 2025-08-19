comment on column fimaki_back_db.subdivision_geografica.activo_sn is
    'ACTIVO / INACTIVO';

comment on column fimaki_back_db.subdivision_geografica.creado is
    'Fecha de creacion.';

comment on column fimaki_back_db.subdivision_geografica.creado_por is
    'Usuario interno o de sistema creador.';

comment on column fimaki_back_db.subdivision_geografica.id_pais is
    'Clave foranea de Pais';

comment on column fimaki_back_db.subdivision_geografica.id_subdivision is
    'Identificador único de la subdivisión';

comment on column fimaki_back_db.subdivision_geografica.id_subdivision_padre is
    'Subdivisión geográfica superior';

comment on column fimaki_back_db.subdivision_geografica.modificado is
    'Ultima feha de modificacion.';

comment on column fimaki_back_db.subdivision_geografica.modificado_por is
    'Usuario interno o sistema que lo modificó.';

comment on column fimaki_back_db.subdivision_geografica.nivel is
    'Nivel jerárquico (1, 2, 3…)';

comment on column fimaki_back_db.subdivision_geografica.nombre is
    'Nombre de la región/estado/provincia';

comment on column fimaki_back_db.subdivision_geografica.tipo_rc is
    'Ej. DEPARTAMENTO, PROVINCIA, STATE, COUNTY';


-- sqlcl_snapshot {"hash":"2a04cbf0a304037c32278d2cec710371f1ad513b","type":"COMMENT","name":"subdivision_geografica","schemaName":"fimaki_back_db","sxml":""}