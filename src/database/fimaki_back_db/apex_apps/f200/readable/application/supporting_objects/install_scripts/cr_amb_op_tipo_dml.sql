begin
  -- === AMB_OP (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'AMB_OP' as codigo,
                'AMB_OP' as nombre,
                'AMB_OP' as descripcion,
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

  -- === AMB_OP (referencias) ===

  merge into codigo_referencia x
  using (select 'AMB_OP' as codigo_ref_tipo,
                'LOC' as codigo
         from dual) y
    on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = 'Empresas Locales',
               x.descripcion = '.',
               x.secuencia = 10,
               x.activo_sn = 'S'
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn)
    values ('AMB_OP', 'LOC', 'Empresas Locales', '.', 10, 'S');

  merge into codigo_referencia x
  using (select 'AMB_OP' as codigo_ref_tipo,
                'REG' as codigo
         from dual) y
    on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = 'Empresas Regionales',
               x.descripcion = '.',
               x.secuencia = 20,
               x.activo_sn = 'S'
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn)
    values ('AMB_OP', 'REG', 'Empresas Regionales', '.', 20, 'S');

  merge into codigo_referencia x
  using (select 'AMB_OP' as codigo_ref_tipo,
                'NAC' as codigo
         from dual) y
    on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = 'Empresas Nacionales',
               x.descripcion = '.',
               x.secuencia = 30,
               x.activo_sn = 'S'
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn)
    values ('AMB_OP', 'NAC', 'Empresas Nacionales', '.', 30, 'S');

  merge into codigo_referencia x
  using (select 'AMB_OP' as codigo_ref_tipo,
                'INT' as codigo
         from dual) y
    on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = 'Empresas Multinacionales',
               x.descripcion = '.',
               x.secuencia = 40,
               x.activo_sn = 'S'
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn)
    values ('AMB_OP', 'INT', 'Empresas Multinacionales', '.', 40, 'S');

  commit;
end;
/