declare
    l_id_pais number;
    l_departamento_id number;
    l_contador number;

    --Provincias
    l_provincias varchar2(4000);

    l_amazonas varchar2(4000) := 'Amazonas,Chachapoyas,Bagua,Bongará,Condorcanqui,Luya,Rodríguez de Mendoza,Utcubamba';
    l_ancash varchar2(4000) := 'Ancash,Huaraz,Aija,Antonio Raymondi,Asunción,Bolognesi,Carhuaz,Carlos F. Fitzcarrald,Casma,Corongo,Huari,Huarmey,Huaylas,Mariscal Luzuriaga,Ocros,Pallasca,Pomabamba,Recuay,Santa,Sihuas,Yungay';
    l_apurimac varchar2(4000) := 'Apurímac,Abancay,Antabamba,Aymaraes,Cotabambas,Grau,Chincheros,Andahuaylas';
    l_arequipa varchar2(4000) := 'Arequipa,Arequipa,Camaná,Caravelí,Castilla,Caylloma,Condesuyos,Islay,La Unión';
    l_ayacucho varchar2(4000) := 'Ayacucho,Cangallo,Huanta,Huamanga,Huanca Sancos,La Mar,Lucanas,Parinacochas,Páucar del Sara Sara,Sucre,Víctor Fajardo,Vilcashuamán';
    l_cajamarca varchar2(4000) := 'Cajamarca,Cajamarca,Cajabamba,Celendín,Chota,Contumazá,Cutervo,Hualgayoc,Jaén,San Ignacio,San Marcos,San Miguel,San Pablo,Santa Cruz';
    l_callao varchar2(4000) := 'Callao,Callao';
    l_cusco varchar2(4000) := 'Cusco,Cuzco,Acomayo,Anta,Calca,Canas,Canchis,Chumbivilcas,Espinar,La Convención,Paruro,Paucartambo,Quispicanchi,Urubamba';
    l_huancavelica varchar2(4000) := 'Huancavelica,Huancavelica,Acobamba,Angaraes,Castrovirreyna,Churcampa,Huaytará,Tayacaja';
    l_huanuco varchar2(4000) := 'Huánuco,Huánuco,Ambo,Dos de Mayo,Huacaybamba,Huamalíes,Leoncio Prado,Marañón,Pachitea,Puerto Inca,Lauricocha,Yarowilca';
    l_ica varchar2(4000) := 'Ica,Ica,Chincha,Nazca,Palpa,Pisco';
    l_junin varchar2(4000) := 'Junín,Chanchamayo,Chupaca,Concepción,Huancayo,Jauja,Junín,Satipo,Tarma,Yauli';
    l_la_libertad varchar2(4000) := 'La Libertad,Trujillo,Ascope,Bolívar,Chepén,Julcán,Otuzco,Gran Chimú,Pacasmayo,Pataz,Sánchez Carrión,Santiago de Chuco,Virú';
    l_lambayeque varchar2(4000) := 'Lambayeque,Chiclayo,Ferreñafe,Lambayeque';
    l_lima varchar2(4000) := 'Lima,Barranca,Cajatambo,Canta,Cañete,Huaral,Huarochirí,Huaura,Lima,Oyón,Yauyos';
    l_loreto varchar2(4000) := 'Loreto,Maynas,Putumayo,Alto Amazonas,Loreto,Mariscal Ramón Castilla,Requena,Ucayali,Datem del Marañón';
    l_madre_de_dios varchar2(4000) := 'Madre de Dios,Tambopata,Manu,Tahuamanu';
    l_moquegua varchar2(4000) := 'Moquegua,Mariscal Nieto,General Sánchez Cerro,Ilo';
    l_pasco varchar2(4000) := 'Pasco,Pasco,Oxapampa,Daniel A. Carrión';
    l_piura varchar2(4000) := 'Piura,Ayabaca,Huancabamba,Morropón,Piura,Sechura,Sullana,Paita,Talara';
    l_puno varchar2(4000) := 'Puno,San Román,Puno,Azángaro,Chucuito,El Collao,Melgar,Carabaya,Huancané,Sandia,San Antonio de Putina,Lampa,Yunguyo,Moho';
    l_san_martin varchar2(4000) := 'San Martín,Bellavista,El Dorado,Huallaga,Lamas,Mariscal Cáceres,Moyobamba,Picota,Rioja,San Martín,Tocache';
    l_tacna varchar2(4000) := 'Tacna,Tacna,Candarave,Jorge Basadre,Tarata';
    l_tumbes varchar2(4000) := 'Tumbes,Tumbes,Zarumilla,Contralmirante Villar';
    l_ucayali varchar2(4000) := 'Ucayali,Coronel Portillo,Atalaya,Padre Abad,Purús';

    l_tipo_rc varchar2(4000) := 'PROV';
    l_nivel number := 2;
    l_activo_sn varchar2(1) := 'S';

begin
    select id_pais
      into l_id_pais
      from bko_pais
     where nombre = 'Perú';

    l_provincias := l_amazonas || ':' || l_ancash || ':' || l_apurimac || ':' || l_arequipa || ':' || l_ayacucho || ':' || l_cajamarca || ':' || l_callao || ':' || l_cusco || ':' || l_huancavelica || ':' || l_huanuco || ':' || l_ica || ':' || l_junin || ':' || l_la_libertad || ':' || 
                    l_lambayeque || ':' || l_lima || ':' || l_loreto || ':' || l_madre_de_dios || ':' || l_moquegua || ':' || l_pasco || ':' || l_piura || ':' || l_puno || ':' || l_san_martin || ':' || l_tacna || ':' || l_tumbes || ':' || l_ucayali;

    for departamento in (select column_value as provincia from table(apex_string.split(l_provincias,':'))) loop
        l_contador := 0;
        for provincia in (select column_value as nombre from table(apex_string.split(departamento.provincia,','))) loop
            l_contador := l_contador + 1;
            if l_contador = 1 then
                --El primer miembro corresponde al departamento
                select id_subdivision
                  into l_departamento_id
                  from bko_subdivision_geografica
                 where upper(nombre) = upper(provincia.nombre)
                   and nivel = 1;
            else
                merge into bko_subdivision_geografica x
                using (select l_id_pais as id_pais
                            , l_departamento_id as id_subdivision_padre
                            , provincia.nombre as nombre
                            , l_tipo_rc as tipo_rc
                            , l_nivel as nivel
                            , l_activo_sn as activo_sn
                        from dual) y
                   on (upper(x.nombre) = upper(y.nombre) and x.id_pais = y.id_pais and x.id_subdivision_padre = y.id_subdivision_padre)
                when matched then
                    update set x.tipo_rc = y.tipo_rc
                             , x.nivel = y.nivel
                             , x.activo_sn = y.activo_sn
                         where upper(x.nombre) = upper(y.nombre) 
                           and x.id_pais = y.id_pais
                           and x.id_subdivision_padre = y.id_subdivision_padre
                when not matched then
                    insert (x.id_pais, x.id_subdivision_padre, x.nombre, x.tipo_rc, x.nivel, x.activo_sn)
                    values (y.id_pais, y.id_subdivision_padre, y.nombre, y.tipo_rc, y.nivel, y.activo_sn);
            end if;
        end loop;
    end loop;

    commit;
end;