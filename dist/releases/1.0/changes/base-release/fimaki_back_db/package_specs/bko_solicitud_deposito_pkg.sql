-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726059 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/bko_solicitud_deposito_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/bko_solicitud_deposito_pkg.sql:null:2a376e0c1504b0325f9e06389f65e0b8950da8b2:create

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

