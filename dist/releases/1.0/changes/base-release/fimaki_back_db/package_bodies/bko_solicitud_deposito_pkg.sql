-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640725963 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_bodies/bko_solicitud_deposito_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_bodies/bko_solicitud_deposito_pkg.sql:null:aff58b8940a7e90b0475dc17882f7bf59799370c:create

create or replace package body fimaki_back_db.bko_solicitud_deposito_pkg as

    procedure confimar_solicitud_deposito (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type
    ) is

        l_deposito                 bko_solicitud_deposito%rowtype;
        l_moneda_rc                bko_cuenta_bancaria.moneda_rc%type;
        l_id_movimiento_financiero bko_movimiento_financiero.id_movimiento_financiero%type := null;
    begin

        --Recupera el registro de Solicitud de Deposito
        select
            *
        into l_deposito
        from
            bko_solicitud_deposito
        where
            id_deposito = p_id_deposito;

        if l_deposito.estado_rc not in ( 'PENDIENTE', 'PENDIENTE_REVISION' ) then
            raise_application_error(-20002, 'El depósito no se puede confirmar porque no está en un estado valido.');
        end if;

        --Recupera el tipo de moneda de la Cuenta Bancaria asociada
        select
            moneda_rc
        into l_moneda_rc
        from
            bko_cuenta_bancaria
        where
            id_cuenta_bancaria = l_deposito.id_cuenta_bancaria;

        --Registra el Movimiento Financiero
        bko_transacciones_pkg.registrar_movimiento_financiero(
            p_id_movimiento_financiero => l_id_movimiento_financiero,
            p_id_rol_persona           => l_deposito.id_rol_persona,
            p_id_factura               => null,
            p_id_inversion_factura     => null,
            p_tipo_movimiento_rc       => 'DEPOSITO',
            p_monto                    => l_deposito.monto,
            p_moneda_rc                => l_moneda_rc,
            p_estado_rc                => 'CONFIRMADO',
            p_referencia_externa       => null,
            p_fecha_movimiento         => trunc(current_timestamp),
            p_observaciones            => null,
            p_id_cuenta_bancaria       => l_deposito.id_cuenta_bancaria,
            p_id_deposito              => l_deposito.id_deposito
        );

        --Finalmente actualizar el estado de la Solicitud de Deposito
        update bko_solicitud_deposito
        set
            estado_rc = 'CONFIRMADO',
            validado_por = coalesce(
                sys_context('APEX$SESSION', 'APP_USER'),
                user
            ),
            fecha_validacion = current_timestamp,
            id_movimiento_financiero = l_id_movimiento_financiero
        where
            id_deposito = p_id_deposito;

    exception
        when no_data_found then
        -- Manejo específico si no se encuentra el depósito o la cuenta (opcional, para mayor robustez)
            rollback;
            raise_application_error(-20003, 'No se encontró el depósito o la cuenta bancaria asociada.');
        when others then
            rollback;
            raise_application_error(-20001, 'Error in procedure CONFIMAR_SOLICITUD_DEPOSITO ' || sqlerrm);
    end confimar_solicitud_deposito;

    procedure actualizar_estado_solicitud_deposito (
        p_id_deposito in bko_solicitud_deposito.id_deposito%type,
        p_estado_rc   in bko_solicitud_deposito.estado_rc%type
    ) is
    begin
				-- Actualiza el estado de la solicitud de depósito
        update bko_solicitud_deposito
        set
            estado_rc = p_estado_rc,
            validado_por = coalesce(
                sys_context('APEX$SESSION', 'APP_USER'),
                user
            ),
            fecha_validacion = current_timestamp
        where
            id_deposito = p_id_deposito;

    exception
        when others then
            rollback;
            raise_application_error(-20004, 'Error al actualizar el estado de la solicitud de depósito: ' || sqlerrm);
    end actualizar_estado_solicitud_deposito;

end bko_solicitud_deposito_pkg;
/

