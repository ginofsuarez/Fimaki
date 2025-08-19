create or replace package fimaki_back_db.utils_pkg as
  --|| Description:
  --|| Author: Gino Suarez
    function get_variable (
        p_nombre_variable in varchar2
    ) return varchar2;

  --|| Description:
  --|| Author: Gino Suarez
    function get_retorno_por_inversion (
        p_saldo_a_pago in number,
        p_tasa_interes in number,
        p_plazo_dias   in number
    ) return number;

  --|| Description:
  --|| Author: Gino Suarez
    function get_saldo_a_pago (
        p_monto_total in number,
        p_detraccion  in number
    ) return number;

  --|| Description:
  --|| Author: Gino Suarez
    function validar_cuenta_bancaria_pe (
        p_cuenta      in varchar2,
        p_tipo_cuenta in varchar2
    ) return boolean;

end utils_pkg;
/


-- sqlcl_snapshot {"hash":"af8f25ef5013e23f3b56a647cf82f8e0d7e62f23","type":"PACKAGE_SPEC","name":"UTILS_PKG","schemaName":"FIMAKI_BACK_DB","sxml":""}