create or replace procedure fimaki_inv_db.limpiar_registros_expirados as
begin
    -- Deshabilitar tokens expirados
    update inv_usuario_token
    set
        usado = 'S'
    where
        expiracion < systimestamp;

    -- Establecer el estado de los usuarios temporales a 'EXPIRADO' si sus tokens están a punto de expirar
    update inv_usuario_temporal
    set
        estado_rc = 'EXPIRADO'
    where
        id_usuario_temp in (
            select
                id_usuario
            from
                inv_usuario_token
            where
                    expiracion < systimestamp
                and usado = 'N'
        );

    -- Eliminar registros de usuario con más de un mes
    delete from inv_usuario_temporal
    where
        fecha_registro < add_months(systimestamp, -1);

    commit;
end;
/


-- sqlcl_snapshot {"hash":"f9062127aab81fbcaec008be518dd87aa36a238d","type":"PROCEDURE","name":"LIMPIAR_REGISTROS_EXPIRADOS","schemaName":"FIMAKI_INV_DB","sxml":""}