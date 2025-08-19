create or replace function fimaki_inv_db.is_valid_activation_token_fn return boolean is
    l_token      varchar2(1000);
    l_id_usuario number;
    l_exists     number;
begin
    -- grab the token value
    l_token := regexp_substr(
        owa_util.get_cgi_env('QUERY_STRING'),
        'x01=([^&]+)',
        1,
        1,
        null,
        1
    );

    apex_debug.message('Token recibido: ' || l_token);
    if l_token is null then
        return false;
    else
        -- Validar token
        select
            id_usuario
        into l_id_usuario
        from
            inv_usuario_token
        where
                token = l_token
            and tipo_rc = 'ACTIVACION'
            and ( usado is null
                  or usado != 'S' )
            and ( expiracion is null
                  or expiracion > systimestamp );

        apex_debug.message('Token existe (ACTIVACION)? ' || l_id_usuario);
        return true;
    end if;

exception
    when no_data_found then
        return false;
end is_valid_activation_token_fn;
/


-- sqlcl_snapshot {"hash":"6b104caf8bc70dadea6d04a012b154900c346891","type":"FUNCTION","name":"IS_VALID_ACTIVATION_TOKEN_FN","schemaName":"FIMAKI_INV_DB","sxml":""}