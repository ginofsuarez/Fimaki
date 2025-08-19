begin
  -- === TIP_SCORE (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'TIP_SCORE' as codigo,
                'TIP_SCORE' as nombre,
                'TIP_SCORE' as descripcion,
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
  -- === TIP_SCORE (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'TIP_SCORE' as codigo_ref_tipo, 'C' as codigo, 'Aceptable' as nombre, '.' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SCORE' as codigo_ref_tipo, 'D' as codigo, 'Regular' as nombre, '.' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SCORE' as codigo_ref_tipo, 'E' as codigo, 'Malo' as nombre, '.' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SCORE' as codigo_ref_tipo, 'A' as codigo, 'Excelente' as nombre, '.' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SCORE' as codigo_ref_tipo, 'B' as codigo, 'Bueno' as nombre, '.' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
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