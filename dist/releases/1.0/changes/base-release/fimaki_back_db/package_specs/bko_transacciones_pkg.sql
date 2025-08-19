-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726067 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_specs/bko_transacciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_specs/bko_transacciones_pkg.sql:null:a499b9c9c2dfc5f31d31ddd179ae8e7b3f616dbb:create

create or replace package fimaki_back_db.bko_transacciones_pkg as
    procedure registrar_deposito_comprobante (
        p_id_deposito       in bko_deposito_comprobante.id_deposito%type,
        p_archivo_nombre    in bko_deposito_comprobante.archivo_nombre%type,
        p_archivo_tipo_mime in bko_deposito_comprobante.archivo_tipo_mime%type,
        p_archivo_contenido in bko_deposito_comprobante.archivo_contenido%type
    );

    procedure registrar_movimiento_financiero (
        p_id_movimiento_financiero in out bko_movimiento_financiero.id_movimiento_financiero%type,
        p_id_rol_persona           in bko_movimiento_financiero.id_rol_persona%type,
        p_id_factura               in bko_movimiento_financiero.id_factura%type,
        p_id_inversion_factura     in bko_movimiento_financiero.id_inversion_factura%type,
        p_tipo_movimiento_rc       in bko_movimiento_financiero.tipo_movimiento_rc%type,
        p_monto                    in bko_movimiento_financiero.monto%type,
        p_moneda_rc                in bko_movimiento_financiero.moneda_rc%type,
        p_estado_rc                in bko_movimiento_financiero.estado_rc%type,
        p_referencia_externa       in bko_movimiento_financiero.referencia_externa%type,
        p_fecha_movimiento         in bko_movimiento_financiero.fecha_movimiento%type,
        p_observaciones            in bko_movimiento_financiero.observaciones%type,
        p_id_cuenta_bancaria       in bko_movimiento_financiero.id_cuenta_bancaria%type,
        p_id_deposito              in bko_movimiento_financiero.id_deposito%type default null
    );

end bko_transacciones_pkg;
/

