-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640725977 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_bodies/bko_transacciones_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_bodies/bko_transacciones_pkg.sql:null:d9529497eeadaa252475a3e120df1ae1a6c86c57:create

create or replace package body fimaki_back_db.bko_transacciones_pkg as

    procedure registrar_deposito_comprobante (
        p_id_deposito       in bko_deposito_comprobante.id_deposito%type,
        p_archivo_nombre    in bko_deposito_comprobante.archivo_nombre%type,
        p_archivo_tipo_mime in bko_deposito_comprobante.archivo_tipo_mime%type,
        p_archivo_contenido in bko_deposito_comprobante.archivo_contenido%type
    ) is
    begin
    -- Si ya existe un comprobante para el deposito, se elimina
        delete bko_deposito_comprobante
        where
            id_deposito = p_id_deposito;

    -- Insertar el nuevo comprobante
        insert into bko_deposito_comprobante (
            id_deposito,
            archivo_nombre,
            archivo_tipo_mime,
            archivo_contenido
        ) values ( p_id_deposito,
                   p_archivo_nombre,
                   p_archivo_tipo_mime,
                   p_archivo_contenido );

    end registrar_deposito_comprobante;

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
    ) is
    begin
        if p_id_movimiento_financiero is null then
            insert into bko_movimiento_financiero (
                id_rol_persona,
                id_factura,
                id_inversion_factura,
                tipo_movimiento_rc,
                monto,
                moneda_rc,
                estado_rc,
                referencia_externa,
                fecha_movimiento,
                observaciones,
                id_cuenta_bancaria,
                id_deposito
            ) values ( p_id_rol_persona,
                       p_id_factura,
                       p_id_inversion_factura,
                       p_tipo_movimiento_rc,
                       p_monto,
                       p_moneda_rc,
                       p_estado_rc,
                       p_referencia_externa,
                       p_fecha_movimiento,
                       p_observaciones,
                       p_id_cuenta_bancaria,
                       p_id_deposito ) returning id_movimiento_financiero into p_id_movimiento_financiero;

        end if;
    end registrar_movimiento_financiero;

end bko_transacciones_pkg;
/

