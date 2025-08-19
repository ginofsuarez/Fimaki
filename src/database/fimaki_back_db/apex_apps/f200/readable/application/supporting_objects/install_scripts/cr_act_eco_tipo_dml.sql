begin
  -- === ACT_ECO (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'ACT_ECO' as codigo,
                'ACT_ECO' as nombre,
                'ACT_ECO' as descripcion,
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
  -- === ACT_ECO (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'ACT_ECO' as codigo_ref_tipo, 'COM' as codigo, 'Comerciales' as nombre, '.' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'SER' as codigo, 'Servicios' as nombre, '.' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'IND' as codigo, 'Industriales' as nombre, '.' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'AGR' as codigo, 'Agropecuarias' as nombre, '.' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'CON' as codigo, 'Construcción' as nombre, '.' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'TRA' as codigo, 'Transporte y Logística' as nombre, '.' as descripcion, 60 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'FIN' as codigo, 'Financieras' as nombre, '.' as descripcion, 70 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'TEC' as codigo, 'Tecnología e Informática' as nombre, '.' as descripcion, 80 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'EXT' as codigo, 'Extractivas' as nombre, '.' as descripcion, 90 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ACT_ECO' as codigo_ref_tipo, 'ENE' as codigo, 'Energía' as nombre, '.' as descripcion, 100 as secuencia, 'S' as activo_sn from dual
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