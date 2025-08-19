create or replace package fimaki_back_db.bko_operaciones_pkg as

    --|| Description: Obtiene el Retorno de la Inversion ROI
    --|| Author: Gino Suarez
    -- FUNCTION get_roi( 
    --       p_monto_a_pago IN NUMBER
    --     , p_tasa_interes IN NUMBER
    --     , p_plazo_dias   IN NUMBER
    --     ) RETURN number;

    --|| Description: Obtiene el Saldo de Cuentas disponible por Moneda
    --|| Author: Gino Suarez
    function get_saldo_disponible (
        p_rol_persona in bko_movimiento_financiero.id_rol_persona%type,
        p_moneda_rc   in codigo_referencia.codigo%type
    ) return number;

    --|| Description: Obtiene el Saldo de Cuentas disponible por Cuenta Bancaria
    --|| Author: Gino Suarez
    function get_cuenta_saldo_disponible (
        p_id_cuenta_bancaria in bko_cuenta_bancaria.id_cuenta_bancaria%type
    ) return number;
    
     --|| Description: Obtiene el Saldo de Cuentas disponible por Cuenta Bancaria
    --|| Author: Gino Suarez
    function get_cuenta_saldo_disponible (
        p_id_cuenta_bancaria in bko_cuenta_bancaria.id_cuenta_bancaria%type,
        p_fecha_corte        in date
    ) return number;

    --|| Description: Obtiene el Retorno de la Inversion
    --|| Author: Gino Suarez
    function calcular_roi (
        p_tasa_anual      in number,
        p_fecha_pago      in date,
        p_fecha_inversion in date,
        p_monto_invertido in number
    ) return number;

end bko_operaciones_pkg;
/


-- sqlcl_snapshot {"hash":"085774d2315bde1d8ed207234f5acc7d6531cc1a","type":"PACKAGE_SPEC","name":"BKO_OPERACIONES_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}