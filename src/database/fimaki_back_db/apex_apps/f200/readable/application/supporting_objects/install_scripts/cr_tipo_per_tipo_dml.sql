begin
  -- === TIPO_PER (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'TIPO_PER' as codigo,
                'TIPO_PER' as nombre,
                'TIPO_PER' as descripcion,
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
  -- === TIPO_PER (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'TIPO_PER' as codigo_ref_tipo, 'JUR' as codigo, 'Persona Jurídica' as nombre, 'Jurídica' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIPO_PER' as codigo_ref_tipo, 'NAT' as codigo, 'Persona Natural' as nombre, 'Natural' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
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