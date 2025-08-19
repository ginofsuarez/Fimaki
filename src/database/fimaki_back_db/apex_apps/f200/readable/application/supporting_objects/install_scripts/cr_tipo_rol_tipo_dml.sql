begin
  -- === TIPO_ROL (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'TIPO_ROL' as codigo,
                'TIPO_ROL' as nombre,
                'TIPO_ROL' as descripcion,
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
  -- === TIPO_ROL (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'TIPO_ROL' as codigo_ref_tipo, 'INVERSNSTA' as codigo, 'Inversionista' as nombre, 'Inversionista' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIPO_ROL' as codigo_ref_tipo, 'CED' as codigo, 'Cedente' as nombre, 'Empresa que vende facturas' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIPO_ROL' as codigo_ref_tipo, 'PAG' as codigo, 'Pagador' as nombre, 'Deudor de la factura' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIPO_ROL' as codigo_ref_tipo, 'TODOS' as codigo, 'Todos' as nombre, 'Todos los roles' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
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