-- liquibase formatted sql
-- changeset FIMAKI_BACK_DB:1755640726031 stripComments:false  logicalFilePath:base-release/fimaki_back_db/package_bodies/utils_pkg.sql runAlways:false runOnChange:false replaceIfExists:true failOnError:true
-- sqlcl_snapshot src/database/fimaki_back_db/package_bodies/utils_pkg.sql:null:959b27544a3b10218984f61e75f0011e543537f7:create

create or replace package body fimaki_back_db.utils_pkg as

    function get_variable (
        p_nombre_variable in varchar2
    ) return varchar2 is
        l_valor variable_sistema.valor%type;
    begin
        select
            valor
        into l_valor
        from
            variable_sistema
        where
            upper(nombre_variable) = upper(trim(p_nombre_variable));

        return l_valor;
    exception
        when no_data_found then
            return null;
    end get_variable;

    function get_retorno_por_inversion (
        p_saldo_a_pago in number,
        p_tasa_interes in number,
        p_plazo_dias   in number
    ) return number is
        l_roi number;
    begin
        l_roi := ( ( p_saldo_a_pago * p_tasa_interes ) / 100 ) / 30 * p_plazo_dias;
        return l_roi;
    exception
        when others then
            raise_application_error(-20001, 'Error in function GET_RETORNO_POR_INVERSION ' || sqlerrm);
    end get_retorno_por_inversion;

    function get_saldo_a_pago (
        p_monto_total in number,
        p_detraccion  in number
    ) return number is
        l_saldo_a_pago number;
    begin
        l_saldo_a_pago := p_monto_total - p_detraccion;
        return l_saldo_a_pago;
    exception
        when others then
            raise_application_error(-20001, 'Error in function GET_SALDO_A_PAGO ' || sqlerrm);
    end get_saldo_a_pago;

    function validar_cuenta_bancaria_pe (
        p_cuenta      in varchar2,
        p_tipo_cuenta in varchar2
    ) return boolean is

        l_cuenta_limpia         varchar2(30);
        l_longitud              number;
        l_codigo_banco          varchar2(3);
        l_tipo_cuenta_norm      varchar2(3);
        type t_lista_bancos is
            table of varchar2(3);
        v_codigos_banco_validos t_lista_bancos := t_lista_bancos('002', '003', '005', '007', '009',
                                                                 '011', '018', '023', '026', '038',
                                                                 '041', '053');
    begin
        if p_cuenta is null
           or p_tipo_cuenta is null then
            return false;
        end if;
        l_cuenta_limpia := regexp_replace(p_cuenta, '[^0-9]', '');
        l_longitud := length(l_cuenta_limpia);
        l_tipo_cuenta_norm := upper(trim(p_tipo_cuenta));
        if l_tipo_cuenta_norm = 'CCI' then
            if l_longitud != 20 then
                return false;
            end if;
            l_codigo_banco := substr(l_cuenta_limpia, 1, 3);
            for i in 1..v_codigos_banco_validos.count loop
                if v_codigos_banco_validos(i) = l_codigo_banco then
                    return true;
                end if;
            end loop;

            return false;
        elsif l_tipo_cuenta_norm = 'CC' then
            if l_longitud between 6 and 18 then
                return true;
            else
                return false;
            end if;
        else
            return false;
        end if;

    exception
        when others then
            return false;
    end validar_cuenta_bancaria_pe;

end utils_pkg;
/

