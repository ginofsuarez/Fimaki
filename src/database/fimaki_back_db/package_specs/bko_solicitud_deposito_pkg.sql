create or replace package fimaki_back_db.bko_solicitud_deposito_pkg as
    procedure confimar_solicitud_deposito (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type
    );

    procedure actualizar_estado_solicitud_deposito (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type,
        p_estado_rc   in bko_solicitud_deposito.estado_rc%type
    );

end bko_solicitud_deposito_pkg;
/


-- sqlcl_snapshot {"hash":"2a376e0c1504b0325f9e06389f65e0b8950da8b2","type":"PACKAGE_SPEC","name":"BKO_SOLICITUD_DEPOSITO_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}