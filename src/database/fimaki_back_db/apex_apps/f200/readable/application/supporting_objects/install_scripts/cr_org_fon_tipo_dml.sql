begin
  -- === ORG_FON (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'ORG_FON' as codigo,
                'ORG_FON' as nombre,
                'ORG_FON' as descripcion,
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
  -- === ORG_FON (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'ORG_FON' as codigo_ref_tipo, 'SAL' as codigo, 'Salario' as nombre, 'Salario' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'HON' as codigo, 'Honorarios' as nombre, 'Honorarios profesionales / servicios independientes' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'AHO' as codigo, 'Ahorros' as nombre, 'Ahorros personales' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'REN' as codigo, 'Renta' as nombre, 'Renta por alquiler de inmuebles' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'INDM' as codigo, 'Indemnización' as nombre, 'Indemnización / Compensación por tiempo de servicios (CTS)' as descripcion, 100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'PRES' as codigo, 'Préstamo' as nombre, 'Préstamo bancario o financiamiento formal' as descripcion, 110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'JUB' as codigo, 'Jubilación' as nombre, 'Jubilación / pensión' as descripcion, 120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'OTR' as codigo, 'Otros' as nombre, 'Otros (especificar)' as descripcion, 130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'GAN' as codigo, 'Ganancias' as nombre, 'Ganancias por inversiones financieras (bonos, acciones, fondos mutuos, etc.)' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'VENT' as codigo, 'Venta' as nombre, 'Venta de bienes (inmuebles, vehículos, etc.)' as descripcion, 60 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'HER' as codigo, 'Herencia' as nombre, 'Herencia' as descripcion, 70 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'DON' as codigo, 'Donación' as nombre, 'Donación' as descripcion, 80 as secuencia, 'S' as activo_sn from dual
    union all
    select 'ORG_FON' as codigo_ref_tipo, 'UTL' as codigo, 'Utilidades' as nombre, 'Utilidades de empresa propia o participación en negocios' as descripcion, 90 as secuencia, 'S' as activo_sn from dual
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