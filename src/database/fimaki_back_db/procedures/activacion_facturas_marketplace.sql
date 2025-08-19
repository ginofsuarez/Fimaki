create or replace procedure fimaki_back_db.activacion_facturas_marketplace as
begin
    -- Actualizar las facturas que no están visibles en oportunidades
    update bko_factura
    set
        visible_en_oportunidades_sn = 'S',
        fecha_publicacion = localtimestamp
    where
            trunc(fecha_publicacion) = trunc(localtimestamp)
        and visible_en_oportunidades_sn = 'N';

end activacion_facturas_marketplace;
/


-- sqlcl_snapshot {"hash":"ac9c8eb8222b8b30385924dc3bfc11f5e2893d16","type":"PROCEDURE","name":"ACTIVACION_FACTURAS_MARKETPLACE","schemaName":"FIMAKI_BACK_DB","sxml":""}