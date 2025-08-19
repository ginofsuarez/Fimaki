declare
    l_nombre        bko_pais.nombre%type := 'Perú';
    l_codigo_iso    bko_pais.codigo_iso%type := 'PER';
    l_nacionalidad  bko_pais.nacionalidad%type := 'Peruano/a';
    l_activo_sn     bko_pais.activo_sn%type := 'S';
begin
    merge into bko_pais x
    using (select l_nombre as nombre
                , l_codigo_iso as codigo_iso
                , l_nacionalidad as nacionalidad
                , l_activo_sn as activo_sn
             from dual) y
       on (upper(x.nombre) = upper(y.nombre))
    when matched then
        update set x.codigo_iso = y.codigo_iso
                 , x.nacionalidad = y.nacionalidad
                 , x.activo_sn = y.activo_sn
             where upper(x.nombre) = upper(y.nombre)
    when not matched then
        insert (x.nombre, x.codigo_iso, x.nacionalidad, x.activo_sn)
        values (y.nombre, y.codigo_iso, y.nacionalidad, y.activo_sn);
end;