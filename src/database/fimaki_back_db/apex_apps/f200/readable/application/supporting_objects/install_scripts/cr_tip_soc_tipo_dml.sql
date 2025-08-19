begin
  -- === TIP_SOC (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'TIP_SOC' as codigo,
                'TIP_SOC' as nombre,
                'TIP_SOC' as descripcion,
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
  -- === TIP_SOC (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'TIP_SOC' as codigo_ref_tipo, 'EIRL' as codigo, 'Empresa Individual de Responsabilidad Limitada (EIRL)' as nombre, '.' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SA' as codigo, 'Sociedad Anónima (SA)' as nombre, '.' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SCOMRL' as codigo, 'Sociedad Comercial de Responsabilidad Limitada (SAL)' as nombre, '.' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SAC' as codigo, 'Sociedad Anónima Cerrada (SAC)' as nombre, '.' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SAA' as codigo, 'Sociedad Anónima Abierta (SAA)' as nombre, '.' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SC' as codigo, 'Sociedad Civil' as nombre, '.' as descripcion, 60 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SCL' as codigo, 'Sociedad Colectiva' as nombre, '.' as descripcion, 70 as secuencia, 'S' as activo_sn from dual
    union all
    select 'TIP_SOC' as codigo_ref_tipo, 'SCOM' as codigo, 'Sociedad Comandita' as nombre, '.' as descripcion, 80 as secuencia, 'S' as activo_sn from dual
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