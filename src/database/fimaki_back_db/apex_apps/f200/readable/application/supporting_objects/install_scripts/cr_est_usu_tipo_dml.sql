begin
  -- === EST_USU (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'EST_USU' as codigo,
                'EST_USU' as nombre,
                'EST_USU' as descripcion,
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
  -- === EST_USU (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'EST_USU' as codigo_ref_tipo, 'PEND' as codigo, 'Pendiente' as nombre, 'Pendiente' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'EST_USU' as codigo_ref_tipo, 'ACT' as codigo, 'Activo' as nombre, 'Activo' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'EST_USU' as codigo_ref_tipo, 'BLO' as codigo, 'Bloqueado' as nombre, 'Bloqueado' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'EST_USU' as codigo_ref_tipo, 'INACT' as codigo, 'Inactivo' as nombre, 'Inactivo' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
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