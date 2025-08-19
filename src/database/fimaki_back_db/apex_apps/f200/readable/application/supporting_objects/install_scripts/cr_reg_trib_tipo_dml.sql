begin
  -- === REG_TRIB (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'REG_TRIB' as codigo,
                'REG_TRIB' as nombre,
                'REG_TRIB' as descripcion,
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
  -- === REG_TRIB (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'REG_TRIB' as codigo_ref_tipo, 'RUS' as codigo, 'Nuevo Régimen Único Simplificado (Nuevo RUS)' as nombre, '.' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'REG_TRIB' as codigo_ref_tipo, 'RER' as codigo, 'Régimen Especial de Renta (RER)' as nombre, '.' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'REG_TRIB' as codigo_ref_tipo, 'RMT' as codigo, 'Régimen MYPE Tributario (RMT)' as nombre, '.' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'REG_TRIB' as codigo_ref_tipo, 'RG' as codigo, 'Régimen General de Renta (RG)' as nombre, '.' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
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