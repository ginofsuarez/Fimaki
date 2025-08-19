create or replace package body fimaki_back_db.bko_operaciones_pkg as

	-- FUNCTION get_roi( 
	-- 			p_monto_a_pago IN NUMBER
	-- 		, p_tasa_interes IN NUMBER
	-- 		, p_plazo_dias   IN NUMBER
	-- 		) RETURN number
	-- IS
	-- 		l_roi number(10,2);
	-- BEGIN
	-- 		l_roi := (p_monto_a_pago * (p_tasa_interes/100))/30*p_plazo_dias;
	-- 		return l_roi;
	-- EXCEPTION
	-- 		when others then
	-- 		raise_application_error(-20001,'Error in function GET_ROI '||sqlerrm);
	-- END;

    function get_saldo_disponible (
        p_rol_persona in bko_movimiento_financiero.id_rol_persona%type,
        p_moneda_rc   in codigo_referencia.codigo%type
    ) return number is
        l_saldo_disponible number(10, 2);
    begin
        select
            sum(
                case
                    when signo = 1   then
                        monto          -- dep, aportes, ajustes+
                    when signo = - 1 then
                        - monto          -- inv, ret, ajustes-
                    else
                        0
                end
            ) as saldo_disponible
        into l_saldo_disponible
        from
            bko_movimiento_financiero_v
        where
                id_rol_persona = p_rol_persona
            and moneda_rc = p_moneda_rc;

        return l_saldo_disponible;
    exception
        when no_data_found then
            return 0;
    end get_saldo_disponible;

    function get_cuenta_saldo_disponible (
        p_id_cuenta_bancaria in bko_cuenta_bancaria.id_cuenta_bancaria%type
    ) return number is
        l_saldo_disponible number(10, 2);
    begin
        select
            sum(
                case
                    when signo = 1   then
                        monto          -- dep, aportes, ajustes+
                    when signo = - 1 then
                        - monto          -- inv, ret, ajustes-
                    else
                        0
                end
            ) as saldo_disponible
        into l_saldo_disponible
        from
            bko_movimiento_financiero_v
        where
                1 = 1
            and id_cuenta_bancaria = p_id_cuenta_bancaria;

        return nvl(l_saldo_disponible, 0);
    exception
        when no_data_found then
            return 0;
    end get_cuenta_saldo_disponible;

    function get_cuenta_saldo_disponible (
        p_id_cuenta_bancaria in bko_cuenta_bancaria.id_cuenta_bancaria%type,
        p_fecha_corte        in date
    ) return number is
        l_saldo_disponible number(10, 2);
    begin
        select
            sum(
                case
                    when signo = 1   then
                        monto          -- dep, aportes, ajustes+
                    when signo = - 1 then
                        - monto          -- inv, ret, ajustes-
                    else
                        0
                end
            ) as saldo_disponible
        into l_saldo_disponible
        from
            bko_movimiento_financiero_v
        where
                1 = 1
            and id_cuenta_bancaria = p_id_cuenta_bancaria
            and fecha_movimiento <= p_fecha_corte;

        return nvl(l_saldo_disponible, 0);
    exception
        when no_data_found then
            return 0;
    end get_cuenta_saldo_disponible;

    function calcular_roi (
        p_tasa_anual      in number,
        p_fecha_pago      in date,
        p_fecha_inversion in date,
        p_monto_invertido in number
    ) return number is
        l_dias_diferencia number;
        l_roi             number;
    begin
      -- Calcular la diferencia de días entre fechas
        l_dias_diferencia := p_fecha_pago - p_fecha_inversion;

      -- Calcular ROI
        l_roi := ( power(1 +(p_tasa_anual / 100), l_dias_diferencia / 360) - 1 ) * p_monto_invertido;

        return l_roi;
    exception
        when others then
            raise_application_error(-20001, 'Error in Function CALCULAR_ROI ' || sqlerrm);
    end calcular_roi;

end bko_operaciones_pkg;
/


-- sqlcl_snapshot {"hash":"fa89350df528f32c78e5fe7c783c2b8f471b27c5","type":"PACKAGE_BODY","name":"BKO_OPERACIONES_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}