-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755642423736 stripComments:false  logicalFilePath:1.1/fimaki_back_db/package_bodies/bko_solicitud_deposito_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_bodies/bko_solicitud_deposito_pkg.sql:aff58b8940a7e90b0475dc17882f7bf59799370c:16b67c530051994985f5b3eaa548ccbdf14fbf0e:alter

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

        -- === Envío de email de prueba (no bloquea si falla) ===
        if sql%rowcount = 1 then
            declare
                l_to   varchar2(320) := 'agamazapata@gmail.com'; -- <-- CAMBIAR
                l_from varchar2(320) := 'no-responder@fimaki.com.pe';       -- <-- CAMBIAR (debe estar permitido en tu SMTP)
                l_html clob;
                l_sgid number;
            begin
                l_html := '<p><b>[TEST]</b> Depósito confirmado.</p>'
                          || '<ul>'
                          || '<li><b>ID Depósito:</b> '
                          || p_id_deposito
                          || '</li>'
                          || '<li><b>Monto:</b> '
                          || to_char(l_deposito.monto, 'FM999G999G990D00')
                          || ' '
                          || nvl(l_moneda_rc, '')
                          || '</li>'
                          || '<li><b>ID Movimiento:</b> '
                          || nvl(
                    to_char(l_id_movimiento_financiero),
                    '(n/a)'
                )
                          || '</li>'
                          || '<li><b>Fecha validación:</b> '
                          || to_char(systimestamp at time zone 'America/Lima', 'DD/MM/YYYY HH24:MI:SS')
                          || '</li>'
                          || '</ul>';

                apex_mail.send(
                    p_to        => l_to,
                    p_from      => l_from,
                    p_subj      => '[TEST] Depósito confirmado #' || p_id_deposito,
                    p_body      => null,
                    p_body_html => l_html
                );

            exception
                when others then
                    null; -- no bloquear la aprobación por fallo de correo
            end;
        end if;

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

