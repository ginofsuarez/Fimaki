begin
  -- === EST_FACT (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'EST_FACT' as codigo,
                'EST_FACT' as nombre,
                'EST_FACT' as descripcion,
                'S' as sistema_sn,
                'S' as activo_sn
         from dual) y
    on (x.codigo = y.codigo)
  when matched then
    update set x.nombre = y.nombre,
               x.descripcion = y.descripcion,
               x.sistema_sn = y.sistema_sn,
               x.activo_sn = y.activo_sn
  when not matched then
    insert (codigo, nombre, descripcion, sistema_sn, activo_sn)
    values (y.codigo, y.nombre, y.descripcion, y.sistema_sn, y.activo_sn);
  -- === EST_FACT (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'EST_FACT' as codigo_ref_tipo, 'FACT_INGRESADA' as codigo, 'Ingresada' as nombre, '.' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'EST_FACT' as codigo_ref_tipo, 'FACT_CANCELADA' as codigo, 'Cancelada' as nombre, 'Factura pagada.' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'EST_FACT' as codigo_ref_tipo, 'FACT_VIGENTE' as codigo, 'Vigente' as nombre, '.' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
  ) y
  on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = y.nombre, x.descripcion = y.descripcion, x.secuencia = y.secuencia, x.activo_sn = y.activo_sn
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn)
    values (y.codigo_ref_tipo, y.codigo, y.nombre, y.descripcion, y.secuencia, y.activo_sn);
  commit;
end;
/