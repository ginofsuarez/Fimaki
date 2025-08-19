begin
  -- === ENTIDAD_FINANCIERA (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'ENTIDAD_FINANCIERA' as codigo,
                'ENTIDAD_FINANCIERA' as nombre,
                'ENTIDAD_FINANCIERA' as descripcion,
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
  -- === ENTIDAD_FINANCIERA (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'BANCO' as codigo, 'Banco' as nombre, 'Banco' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'COOPERATIVA' as codigo, 'Cooperativa' as nombre, 'Cooperativa' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'FINTECH' as codigo, 'Fintech' as nombre, 'Fintech' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'BILLETERA' as codigo, 'Billetera' as nombre, 'Billetera' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'PASARELA' as codigo, 'Pasarela' as nombre, 'Pasarela' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ENTIDAD_FINANCIERA' as codigo_ref_tipo, 'OTRO' as codigo, 'Otro' as nombre, 'Otro' as descripcion, 60 as secuencia, 'S' as activo_sn from dual
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