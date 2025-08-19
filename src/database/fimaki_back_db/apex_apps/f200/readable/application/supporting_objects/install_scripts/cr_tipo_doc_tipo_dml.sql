begin
  -- === TIPO_DOC (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'TIPO_DOC' as codigo,
                'TIPO_DOC' as nombre,
                'TIPO_DOC' as descripcion,
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
  -- === TIPO_DOC (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'TIPO_DOC' as codigo_ref_tipo, 'DNI' as codigo, 'DNI' as nombre, 'Documento Nacional de Identidad' as descripcion, 10 as secuencia, 'S' as activo_sn, 'NAT' as atributo1 from dual
    union all
    select 'TIPO_DOC' as codigo_ref_tipo, 'CE' as codigo, 'CE' as nombre, 'Carnet de Extranjeria' as descripcion, 20 as secuencia, 'S' as activo_sn, 'NAT' as atributo1 from dual
    union all
    select 'TIPO_DOC' as codigo_ref_tipo, 'PAS' as codigo, 'PAS' as nombre, 'Pasaporte' as descripcion, 30 as secuencia, 'S' as activo_sn, 'NAT' as atributo1 from dual
    union all
    select 'TIPO_DOC' as codigo_ref_tipo, 'RUC' as codigo, 'RUC' as nombre, 'Registro Unico de Contribuyente' as descripcion, 40 as secuencia, 'S' as activo_sn, 'JUR' as atributo1 from dual
  ) y
  on (x.codigo_ref_tipo = y.codigo_ref_tipo and x.codigo = y.codigo)
  when matched then
    update set x.nombre = y.nombre, x.descripcion = y.descripcion, x.secuencia = y.secuencia, x.activo_sn = y.activo_sn, x.atributo1 = y.atributo1
  when not matched then
    insert (codigo_ref_tipo, codigo, nombre, descripcion, secuencia, activo_sn, atributo1)
    values (y.codigo_ref_tipo, y.codigo, y.nombre, y.descripcion, y.secuencia, y.activo_sn, y.atributo1);
  commit;
end;
/