begin
  -- === CIIU (tipo) ===
  merge into codigo_referencia_tipo x
  using (select 'CIIU' as codigo,
                'CIIU' as nombre,
                'CIIU' as descripcion,
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
  -- === CIIU (referencias con alias) ===
  merge into codigo_referencia x
  using (
    select 'CIIU' as codigo_ref_tipo, '2821' as codigo, 'Fabricación de maquinaria agropecuaria y forestal' as nombre, 'nan' as descripcion, 2620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2822' as codigo, 'Fabricación de maquinaria para la conformación de metales y de máquinas herramienta' as nombre, 'nan' as descripcion, 2630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2823' as codigo, 'Fabricación de maquinaria metalúrgica' as nombre, 'nan' as descripcion, 2640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2824' as codigo, 'Fabricación de maquinaria para la explotación de minas y canteras y para obras de construcción' as nombre, 'nan' as descripcion, 2650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2825' as codigo, 'Fabricación de maquinaria para la elaboración de alimentos, bebidas y tabaco' as nombre, 'nan' as descripcion, 2660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2826' as codigo, 'Fabricación de maquinaria para la elaboración de productos textiles, prendas de vestir y cueros' as nombre, 'nan' as descripcion, 2670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2829' as codigo, 'Fabricación de otros tipos de maquinaria de uso especial' as nombre, 'nan' as descripcion, 2680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '29' as codigo, 'Fabricación de vehículos automotores, remolques y semirremolques' as nombre, 'nan' as descripcion, 2690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '291' as codigo, 'Fabricación de vehículos automotores' as nombre, 'nan' as descripcion, 2700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2910' as codigo, 'Fabricación de vehículos automotores' as nombre, 'nan' as descripcion, 2710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '292' as codigo, 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semirremolques' as nombre, 'nan' as descripcion, 2720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2920' as codigo, 'Fabricación de carrocerías para vehículos automotores; fabricación de remolques y semirremolques' as nombre, 'nan' as descripcion, 2730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '293' as codigo, 'Fabricación de partes, piezas y accesorios para vehículos automotores' as nombre, 'nan' as descripcion, 2740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2930' as codigo, 'Fabricación de partes, piezas y accesorios para vehículos automotores' as nombre, 'nan' as descripcion, 2750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '30' as codigo, 'Fabricación de otro equipo de transporte' as nombre, 'nan' as descripcion, 2760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '301' as codigo, 'Construcción de buques y otras embarcaciones' as nombre, 'nan' as descripcion, 2770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3011' as codigo, 'Construcción de buques y estructuras flotantes' as nombre, 'nan' as descripcion, 2780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3012' as codigo, 'Construcción de embarcaciones de recreo y de deporte' as nombre, 'nan' as descripcion, 2790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '302' as codigo, 'Fabricación de locomotoras y material rodante' as nombre, 'nan' as descripcion, 2800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3020' as codigo, 'Fabricación de locomotoras y material rodante' as nombre, 'nan' as descripcion, 2810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '303' as codigo, 'Fabricación de aeronaves, naves espaciales y maquinaria conexa' as nombre, 'nan' as descripcion, 2820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3030' as codigo, 'Fabricación de aeronaves, naves espaciales y maquinaria conexa' as nombre, 'nan' as descripcion, 2830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '304' as codigo, 'Fabricación de vehículos militares de combate' as nombre, 'nan' as descripcion, 2840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3040' as codigo, 'Fabricación de vehículos militares de combate' as nombre, 'nan' as descripcion, 2850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '309' as codigo, 'Fabricación de equipo de transporte n.c.p.' as nombre, 'nan' as descripcion, 2860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3091' as codigo, 'Fabricación de motocicletas' as nombre, 'nan' as descripcion, 2870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3092' as codigo, 'Fabricación de bicicletas y de sillones de ruedas para inválidos' as nombre, 'nan' as descripcion, 2880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3099' as codigo, 'Fabricación de otros tipos de equipo de transporte n.c.p.' as nombre, 'nan' as descripcion, 2890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '31' as codigo, 'Fabricación de muebles' as nombre, 'nan' as descripcion, 2900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '310' as codigo, 'Fabricación de muebles' as nombre, 'nan' as descripcion, 2910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3100' as codigo, 'Fabricación de muebles' as nombre, 'nan' as descripcion, 2920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '32' as codigo, 'Otras industrias manufactureras' as nombre, 'nan' as descripcion, 2930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '321' as codigo, 'Fabricación de joyas, bisutería y artículos conexos' as nombre, 'nan' as descripcion, 2940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3211' as codigo, 'Fabricación de joyas y artículos conexos' as nombre, 'nan' as descripcion, 2950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3212' as codigo, 'Fabricación de bisutería y artículos conexos' as nombre, 'nan' as descripcion, 2960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '322' as codigo, 'Fabricación de instrumentos de música' as nombre, 'nan' as descripcion, 2970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3220' as codigo, 'Fabricación de instrumentos de música' as nombre, 'nan' as descripcion, 2980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '323' as codigo, 'Fabricación de artículos de deporte' as nombre, 'nan' as descripcion, 2990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3230' as codigo, 'Fabricación de artículos de deporte' as nombre, 'nan' as descripcion, 3000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '324' as codigo, 'Fabricación de juegos y juguetes' as nombre, 'nan' as descripcion, 3010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3240' as codigo, 'Fabricación de juegos y juguetes' as nombre, 'nan' as descripcion, 3020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '325' as codigo, 'Fabricación de instrumentos y materiales médicos y odontológicos' as nombre, 'nan' as descripcion, 3030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3250' as codigo, 'Fabricación de instrumentos y materiales médicos y odontológicos' as nombre, 'nan' as descripcion, 3040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '329' as codigo, 'Otras industrias manufactureras n.c.p.' as nombre, 'nan' as descripcion, 3050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0721' as codigo, 'Extracción de minerales de uranio y torio' as nombre, 'nan' as descripcion, 700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '﻿A' as codigo, 'Agricultura, ganadería, silvicultura y pesca' as nombre, 'nan' as descripcion, 10 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '01' as codigo, 'Agricultura, ganadería, caza y actividades de servicios conexas' as nombre, 'nan' as descripcion, 20 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '011' as codigo, 'Cultivo de plantas no perennes' as nombre, 'nan' as descripcion, 30 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0111' as codigo, 'Cultivo de cereales (excepto arroz), legumbres y semillas oleaginosas' as nombre, 'nan' as descripcion, 40 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0112' as codigo, 'Cultivo de arroz' as nombre, 'nan' as descripcion, 50 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0113' as codigo, 'Cultivo de hortalizas y melones, raíces y tubérculos' as nombre, 'nan' as descripcion, 60 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0114' as codigo, 'Cultivo de caña de azúcar' as nombre, 'nan' as descripcion, 70 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0115' as codigo, 'Cultivo de tabaco' as nombre, 'nan' as descripcion, 80 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0116' as codigo, 'Cultivo de plantas de fibra' as nombre, 'nan' as descripcion, 90 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0119' as codigo, 'Cultivo de otras plantas no perennes' as nombre, 'nan' as descripcion, 100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '012' as codigo, 'Cultivo de plantas perennes' as nombre, 'nan' as descripcion, 110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0121' as codigo, 'Cultivo de uva' as nombre, 'nan' as descripcion, 120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0122' as codigo, 'Cultivo de frutas tropicales y subtropicales' as nombre, 'nan' as descripcion, 130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0123' as codigo, 'Cultivo de cítricos' as nombre, 'nan' as descripcion, 140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0124' as codigo, 'Cultivo de frutas de pepita y de hueso' as nombre, 'nan' as descripcion, 150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0125' as codigo, 'Cultivo de otros frutos y nueces de árboles y arbustos' as nombre, 'nan' as descripcion, 160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0126' as codigo, 'Cultivo de frutos oleaginosos' as nombre, 'nan' as descripcion, 170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0127' as codigo, 'Cultivo de plantas con las que se preparan bebidas' as nombre, 'nan' as descripcion, 180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0128' as codigo, 'Cultivo de especias y de plantas aromáticas, medicinales y farmacéuticas' as nombre, 'nan' as descripcion, 190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0129' as codigo, 'Cultivo de otras plantas perennes' as nombre, 'nan' as descripcion, 200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '013' as codigo, 'Propagación de plantas' as nombre, 'nan' as descripcion, 210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0130' as codigo, 'Propagación de plantas' as nombre, 'nan' as descripcion, 220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '014' as codigo, 'Ganadería' as nombre, 'nan' as descripcion, 230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0141' as codigo, 'Cría de ganado bovino y búfalos' as nombre, 'nan' as descripcion, 240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0142' as codigo, 'Cría de caballos y otros equinos' as nombre, 'nan' as descripcion, 250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0143' as codigo, 'Cría de camellos y otros camélidos' as nombre, 'nan' as descripcion, 260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0144' as codigo, 'Cría de ovejas y cabras' as nombre, 'nan' as descripcion, 270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0145' as codigo, 'Cría de cerdos' as nombre, 'nan' as descripcion, 280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0146' as codigo, 'Cría de aves de corral' as nombre, 'nan' as descripcion, 290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0149' as codigo, 'Cría de otros animales' as nombre, 'nan' as descripcion, 300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '015' as codigo, 'Cultivo de productos agrícolas en combinación con la cría de animales (explotación mixta)' as nombre, 'nan' as descripcion, 310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0150' as codigo, 'Cultivo de productos agrícolas en combinación con la cría de animales (explotación mixta)' as nombre, 'nan' as descripcion, 320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '016' as codigo, 'Actividades de apoyo a la agricultura y la ganadería y actividades poscosecha' as nombre, 'nan' as descripcion, 330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0161' as codigo, 'Actividades de apoyo a la agricultura' as nombre, 'nan' as descripcion, 340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0162' as codigo, 'Actividades de apoyo a la ganadería' as nombre, 'nan' as descripcion, 350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0163' as codigo, 'Actividades poscosecha' as nombre, 'nan' as descripcion, 360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0164' as codigo, 'Tratamiento de semillas para propagación' as nombre, 'nan' as descripcion, 370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '017' as codigo, 'Caza ordinaria y mediante trampas y actividades de servicios conexas' as nombre, 'nan' as descripcion, 380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0170' as codigo, 'Caza ordinaria y mediante trampas y actividades de servicios conexas' as nombre, 'nan' as descripcion, 390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '02' as codigo, 'Silvicultura y extracción de madera' as nombre, 'nan' as descripcion, 400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '021' as codigo, 'Silvicultura y otras actividades forestales' as nombre, 'nan' as descripcion, 410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0210' as codigo, 'Silvicultura y otras actividades forestales' as nombre, 'nan' as descripcion, 420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '022' as codigo, 'Extracción de madera' as nombre, 'nan' as descripcion, 430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0220' as codigo, 'Extracción de madera' as nombre, 'nan' as descripcion, 440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '023' as codigo, 'Recolección de productos forestales distintos de la madera' as nombre, 'nan' as descripcion, 450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0230' as codigo, 'Recolección de productos forestales distintos de la madera' as nombre, 'nan' as descripcion, 460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '024' as codigo, 'Servicios de apoyo a la silvicultura' as nombre, 'nan' as descripcion, 470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0240' as codigo, 'Servicios de apoyo a la silvicultura' as nombre, 'nan' as descripcion, 480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '03' as codigo, 'Pesca y acuicultura' as nombre, 'nan' as descripcion, 490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '031' as codigo, 'Pesca' as nombre, 'nan' as descripcion, 500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0311' as codigo, 'Pesca marítima' as nombre, 'nan' as descripcion, 510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0312' as codigo, 'Pesca de agua dulce' as nombre, 'nan' as descripcion, 520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '032' as codigo, 'Acuicultura' as nombre, 'nan' as descripcion, 530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0321' as codigo, 'Acuicultura marina' as nombre, 'nan' as descripcion, 540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0322' as codigo, 'Acuicultura de agua dulce' as nombre, 'nan' as descripcion, 550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '05' as codigo, 'Extracción de carbón de piedra y lignito' as nombre, 'nan' as descripcion, 560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '051' as codigo, 'Extracción de carbón de piedra' as nombre, 'nan' as descripcion, 570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0510' as codigo, 'Extracción de carbón de piedra' as nombre, 'nan' as descripcion, 580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '052' as codigo, 'Extracción de lignito' as nombre, 'nan' as descripcion, 590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0520' as codigo, 'Extracción de lignito' as nombre, 'nan' as descripcion, 600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '06' as codigo, 'Extracción de petróleo crudo y gas natural' as nombre, 'nan' as descripcion, 610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '061' as codigo, 'Extracción de petróleo crudo' as nombre, 'nan' as descripcion, 620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0610' as codigo, 'Extracción de petróleo crudo' as nombre, 'nan' as descripcion, 630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '062' as codigo, 'Extracción de gas natural' as nombre, 'nan' as descripcion, 640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0620' as codigo, 'Extracción de gas natural' as nombre, 'nan' as descripcion, 650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '07' as codigo, 'Extracción de minerales metalíferos' as nombre, 'nan' as descripcion, 660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '071' as codigo, 'Extracción de minerales de hierro' as nombre, 'nan' as descripcion, 670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0710' as codigo, 'Extracción de minerales de hierro' as nombre, 'nan' as descripcion, 680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '072' as codigo, 'Extracción de minerales metalíferos no ferrosos' as nombre, 'nan' as descripcion, 690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '142' as codigo, 'Fabricación de artículos de piel' as nombre, 'nan' as descripcion, 1310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0729' as codigo, 'Extracción de otros minerales metalíferos no ferrosos' as nombre, 'nan' as descripcion, 710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '08' as codigo, 'Explotación de otras minas y canteras' as nombre, 'nan' as descripcion, 720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '081' as codigo, 'Extracción de piedra, arena y arcilla' as nombre, 'nan' as descripcion, 730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0810' as codigo, 'Extracción de piedra, arena y arcilla' as nombre, 'nan' as descripcion, 740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '089' as codigo, 'Explotación de minas y canteras n.c.p.' as nombre, 'nan' as descripcion, 750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0891' as codigo, 'Extracción de minerales para la fabricación de abonos y productos químicos' as nombre, 'nan' as descripcion, 760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0892' as codigo, 'Extracción de turba' as nombre, 'nan' as descripcion, 770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0893' as codigo, 'Extracción de sal' as nombre, 'nan' as descripcion, 780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0899' as codigo, 'Explotación de otras minas y canteras n.c.p.' as nombre, 'nan' as descripcion, 790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '09' as codigo, 'Actividades de servicios de apoyo para la explotación de minas y canteras' as nombre, 'nan' as descripcion, 800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '091' as codigo, 'Actividades de apoyo para la extracción de petróleo y gas natural' as nombre, 'nan' as descripcion, 810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0910' as codigo, 'Actividades de apoyo para la extracción de petróleo y gas natural' as nombre, 'nan' as descripcion, 820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '099' as codigo, 'Actividades de apoyo para otras actividades de explotación de minas y canteras' as nombre, 'nan' as descripcion, 830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '0990' as codigo, 'Actividades de apoyo para otras actividades de explotación de minas y canteras' as nombre, 'nan' as descripcion, 840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '10' as codigo, 'Elaboración de productos alimenticios' as nombre, 'nan' as descripcion, 850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '101' as codigo, 'Elaboración y conservación de carne' as nombre, 'nan' as descripcion, 860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1010' as codigo, 'Elaboración y conservación de carne' as nombre, 'nan' as descripcion, 870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '102' as codigo, 'Elaboración y conservación de pescado, crustáceos y moluscos' as nombre, 'nan' as descripcion, 880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1020' as codigo, 'Elaboración y conservación de pescado, crustáceos y moluscos' as nombre, 'nan' as descripcion, 890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '103' as codigo, 'Elaboración y conservación de frutas, legumbres y hortalizas' as nombre, 'nan' as descripcion, 900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1030' as codigo, 'Elaboración y conservación de frutas, legumbres y hortalizas' as nombre, 'nan' as descripcion, 910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '104' as codigo, 'Elaboración de aceites y grasas de origen vegetal y animal' as nombre, 'nan' as descripcion, 920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1040' as codigo, 'Elaboración de aceites y grasas de origen vegetal y animal' as nombre, 'nan' as descripcion, 930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '105' as codigo, 'Elaboración de productos lácteos' as nombre, 'nan' as descripcion, 940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1050' as codigo, 'Elaboración de productos lácteos' as nombre, 'nan' as descripcion, 950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '106' as codigo, 'Elaboración de productos de molinería, almidones y productos derivados del almidón' as nombre, 'nan' as descripcion, 960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1061' as codigo, 'Elaboración de productos de molinería' as nombre, 'nan' as descripcion, 970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1062' as codigo, 'Elaboración de almidones y productos derivados del almidón' as nombre, 'nan' as descripcion, 980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '107' as codigo, 'Elaboración de otros productos alimenticios' as nombre, 'nan' as descripcion, 990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1071' as codigo, 'Elaboración de productos de panadería' as nombre, 'nan' as descripcion, 1000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1072' as codigo, 'Elaboración de azúcar' as nombre, 'nan' as descripcion, 1010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1073' as codigo, 'Elaboración de cacao y chocolate y de productos de confitería' as nombre, 'nan' as descripcion, 1020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1074' as codigo, 'Elaboración de macarrones, fideos, alcuzcuz y productos farináceos similares' as nombre, 'nan' as descripcion, 1030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1075' as codigo, 'Elaboración de comidas y platos preparados' as nombre, 'nan' as descripcion, 1040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1079' as codigo, 'Elaboración de otros productos alimenticios n.c.p.' as nombre, 'nan' as descripcion, 1050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '108' as codigo, 'Elaboración de piensos preparados para animales' as nombre, 'nan' as descripcion, 1060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1080' as codigo, 'Elaboración de piensos preparados para animales' as nombre, 'nan' as descripcion, 1070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '11' as codigo, 'Elaboración de bebidas' as nombre, 'nan' as descripcion, 1080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '110' as codigo, 'Elaboración de bebidas' as nombre, 'nan' as descripcion, 1090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1101' as codigo, 'Destilación, rectificación y mezcla de bebidas alcohólicas' as nombre, 'nan' as descripcion, 1100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1102' as codigo, 'Elaboración de vinos' as nombre, 'nan' as descripcion, 1110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1103' as codigo, 'Elaboración de bebidas malteadas y de malta' as nombre, 'nan' as descripcion, 1120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1104' as codigo, 'Elaboración de bebidas no alcohólicas; producción de aguas minerales y otras aguas embotelladas' as nombre, 'nan' as descripcion, 1130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '12' as codigo, 'Elaboración de productos de tabaco' as nombre, 'nan' as descripcion, 1140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '120' as codigo, 'Elaboración de productos de tabaco' as nombre, 'nan' as descripcion, 1150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1200' as codigo, 'Elaboración de productos de tabaco' as nombre, 'nan' as descripcion, 1160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '13' as codigo, 'Fabricación de productos textiles' as nombre, 'nan' as descripcion, 1170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '131' as codigo, 'Hilatura, tejedura y acabado de productos textiles' as nombre, 'nan' as descripcion, 1180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1311' as codigo, 'Preparación e hilatura de fibras textiles' as nombre, 'nan' as descripcion, 1190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1312' as codigo, 'Tejedura de productos textiles' as nombre, 'nan' as descripcion, 1200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1313' as codigo, 'Acabado de productos textiles' as nombre, 'nan' as descripcion, 1210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '139' as codigo, 'Fabricación de otros productos textiles' as nombre, 'nan' as descripcion, 1220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1391' as codigo, 'Fabricación de tejidos de punto y ganchillo' as nombre, 'nan' as descripcion, 1230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1392' as codigo, 'Fabricación de artículos confeccionados de materiales textiles, excepto prendas de vestir' as nombre, 'nan' as descripcion, 1240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1393' as codigo, 'Fabricación de tapices y alfombras' as nombre, 'nan' as descripcion, 1250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1394' as codigo, 'Fabricación de cuerdas, cordeles, bramantes y redes' as nombre, 'nan' as descripcion, 1260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1399' as codigo, 'Fabricación de otros productos textiles n.c.p.' as nombre, 'nan' as descripcion, 1270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '14' as codigo, 'Fabricación de prendas de vestir' as nombre, 'nan' as descripcion, 1280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '141' as codigo, 'Fabricación de prendas de vestir, excepto prendas de piel' as nombre, 'nan' as descripcion, 1290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1410' as codigo, 'Fabricación de prendas de vestir, excepto prendas de piel' as nombre, 'nan' as descripcion, 1300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1420' as codigo, 'Fabricación de artículos de piel' as nombre, 'nan' as descripcion, 1320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2399' as codigo, 'Fabricación de otros productos minerales no metálicos n.c.p.' as nombre, 'nan' as descripcion, 1960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '143' as codigo, 'Fabricación de artículos de punto y ganchillo' as nombre, 'nan' as descripcion, 1330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1430' as codigo, 'Fabricación de artículos de punto y ganchillo' as nombre, 'nan' as descripcion, 1340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '15' as codigo, 'Fabricación de productos de cuero y productos conexos' as nombre, 'nan' as descripcion, 1350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '151' as codigo, 'Curtido y adobo de cueros; fabricación de maletas, bolsos de mano y artículos de talabartería y guarnicionería; adobo y teñido de pieles' as nombre, 'nan' as descripcion, 1360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1511' as codigo, 'Curtido y adobo de cueros; adobo y teñido de pieles' as nombre, 'nan' as descripcion, 1370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1512' as codigo, 'Fabricación de maletas, bolsos de mano y artículos similares, y de artículos de talabartería y guarnicionería' as nombre, 'nan' as descripcion, 1380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '152' as codigo, 'Fabricación de calzado' as nombre, 'nan' as descripcion, 1390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1520' as codigo, 'Fabricación de calzado' as nombre, 'nan' as descripcion, 1400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '16' as codigo, 'Producción de madera y fabricación de productos de madera y corcho, excepto muebles; fabricación de artículos de paja y de materiales trenzables' as nombre, 'nan' as descripcion, 1410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '161' as codigo, 'Aserrado y acepilladura de madera' as nombre, 'nan' as descripcion, 1420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1610' as codigo, 'Aserrado y acepilladura de madera' as nombre, 'nan' as descripcion, 1430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '162' as codigo, 'Fabricación de productos de madera, corcho, paja y materiales trenzables' as nombre, 'nan' as descripcion, 1440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1621' as codigo, 'Fabricación de hojas de madera para enchapado y tableros a base de madera' as nombre, 'nan' as descripcion, 1450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1622' as codigo, 'Fabricación de partes y piezas de carpintería para edificios y construcciones' as nombre, 'nan' as descripcion, 1460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1623' as codigo, 'Fabricación de recipientes de madera' as nombre, 'nan' as descripcion, 1470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1629' as codigo, 'Fabricación de otros productos de madera; fabricación de artículos de corcho, paja y materiales trenzables' as nombre, 'nan' as descripcion, 1480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '17' as codigo, 'Fabricación de papel y de productos de papel' as nombre, 'nan' as descripcion, 1490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '170' as codigo, 'Fabricación de papel y de productos de papel' as nombre, 'nan' as descripcion, 1500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1701' as codigo, 'Fabricación de pasta de madera, papel y cartón' as nombre, 'nan' as descripcion, 1510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1702' as codigo, 'Fabricación de papel y cartón ondulado y de envases de papel y cartón' as nombre, 'nan' as descripcion, 1520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1709' as codigo, 'Fabricación de otros artículos de papel y cartón' as nombre, 'nan' as descripcion, 1530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '18' as codigo, 'Impresión y reproducción de grabaciones' as nombre, 'nan' as descripcion, 1540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '181' as codigo, 'Impresión y actividades de servicios relacionadas con la impresión' as nombre, 'nan' as descripcion, 1550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1811' as codigo, 'Impresión' as nombre, 'nan' as descripcion, 1560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1812' as codigo, 'Actividades de servicios relacionadas con la impresión' as nombre, 'nan' as descripcion, 1570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '182' as codigo, 'Reproducción de grabaciones' as nombre, 'nan' as descripcion, 1580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1820' as codigo, 'Reproducción de grabaciones' as nombre, 'nan' as descripcion, 1590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '19' as codigo, 'Fabricación de coque y productos de la refinación del petróleo' as nombre, 'nan' as descripcion, 1600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '191' as codigo, 'Fabricación de productos de hornos de coque' as nombre, 'nan' as descripcion, 1610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1910' as codigo, 'Fabricación de productos de hornos de coque' as nombre, 'nan' as descripcion, 1620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '192' as codigo, 'Fabricación de productos de la refinación del petróleo' as nombre, 'nan' as descripcion, 1630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '1920' as codigo, 'Fabricación de productos de la refinación del petróleo' as nombre, 'nan' as descripcion, 1640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '20' as codigo, 'Fabricación de sustancias y productos químicos' as nombre, 'nan' as descripcion, 1650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '201' as codigo, 'Fabricación de sustancias químicas básicas, de abonos y compuestos de nitrógeno y de plásticos y caucho sintético en formas primarias' as nombre, 'nan' as descripcion, 1660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2011' as codigo, 'Fabricación de sustancias químicas básicas' as nombre, 'nan' as descripcion, 1670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2012' as codigo, 'Fabricación de abonos y compuestos de nitrógeno' as nombre, 'nan' as descripcion, 1680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2013' as codigo, 'Fabricación de plásticos y caucho sintético en formas primarias' as nombre, 'nan' as descripcion, 1690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '202' as codigo, 'Fabricación de otros productos químicos' as nombre, 'nan' as descripcion, 1700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2021' as codigo, 'Fabricación de plaguicidas y otros productos químicos de uso agropecuario' as nombre, 'nan' as descripcion, 1710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2022' as codigo, 'Fabricación de pinturas, barnices y productos de revestimiento similares, tintas de imprenta y masillas' as nombre, 'nan' as descripcion, 1720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2023' as codigo, 'Fabricación de jabones y detergentes, preparados para limpiar y pulir, perfumes y preparados de tocador' as nombre, 'nan' as descripcion, 1730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2029' as codigo, 'Fabricación de otros productos químicos n.c.p.' as nombre, 'nan' as descripcion, 1740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '203' as codigo, 'Fabricación de fibras artificiales' as nombre, 'nan' as descripcion, 1750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2030' as codigo, 'Fabricación de fibras artificiales' as nombre, 'nan' as descripcion, 1760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '21' as codigo, 'Fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico' as nombre, 'nan' as descripcion, 1770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '210' as codigo, 'Fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico' as nombre, 'nan' as descripcion, 1780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2100' as codigo, 'Fabricación de productos farmacéuticos, sustancias químicas medicinales y productos botánicos de uso farmacéutico' as nombre, 'nan' as descripcion, 1790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '22' as codigo, 'Fabricación de productos de caucho y de plástico' as nombre, 'nan' as descripcion, 1800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '221' as codigo, 'Fabricación de productos de caucho' as nombre, 'nan' as descripcion, 1810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2211' as codigo, 'Fabricación de cubiertas y cámaras de caucho; recauchutado y renovación de cubiertas de caucho' as nombre, 'nan' as descripcion, 1820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2219' as codigo, 'Fabricación de otros productos de caucho' as nombre, 'nan' as descripcion, 1830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '222' as codigo, 'Fabricación de productos de plástico' as nombre, 'nan' as descripcion, 1840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2220' as codigo, 'Fabricación de productos de plástico' as nombre, 'nan' as descripcion, 1850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '23' as codigo, 'Fabricación de otros productos minerales no metálicos' as nombre, 'nan' as descripcion, 1860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '231' as codigo, 'Fabricación de vidrio y productos de vidrio' as nombre, 'nan' as descripcion, 1870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2310' as codigo, 'Fabricación de vidrio y productos de vidrio' as nombre, 'nan' as descripcion, 1880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '239' as codigo, 'Fabricación de productos minerales no metálicos n.c.p.' as nombre, 'nan' as descripcion, 1890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2391' as codigo, 'Fabricación de productos refractarios' as nombre, 'nan' as descripcion, 1900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2392' as codigo, 'Fabricación de materiales de construcción de arcilla' as nombre, 'nan' as descripcion, 1910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2393' as codigo, 'Fabricación de otros productos de porcelana y de cerámica' as nombre, 'nan' as descripcion, 1920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2394' as codigo, 'Fabricación de cemento, cal y yeso' as nombre, 'nan' as descripcion, 1930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2395' as codigo, 'Fabricación de artículos de hormigón, cemento y yeso' as nombre, 'nan' as descripcion, 1940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2396' as codigo, 'Corte, talla y acabado de la piedra' as nombre, 'nan' as descripcion, 1950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '24' as codigo, 'Fabricación de metales comunes' as nombre, 'nan' as descripcion, 1970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '282' as codigo, 'Fabricación de maquinaria de uso especial' as nombre, 'nan' as descripcion, 2610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '241' as codigo, 'Industrias básicas de hierro y acero' as nombre, 'nan' as descripcion, 1980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2410' as codigo, 'Industrias básicas de hierro y acero' as nombre, 'nan' as descripcion, 1990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '242' as codigo, 'Fabricación de productos primarios de metales preciosos y otros metales no ferrosos' as nombre, 'nan' as descripcion, 2000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2420' as codigo, 'Fabricación de productos primarios de metales preciosos y otros metales no ferrosos' as nombre, 'nan' as descripcion, 2010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '243' as codigo, 'Fundición de metales' as nombre, 'nan' as descripcion, 2020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2431' as codigo, 'Fundición de hierro y acero' as nombre, 'nan' as descripcion, 2030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2432' as codigo, 'Fundición de metales no ferrosos' as nombre, 'nan' as descripcion, 2040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '25' as codigo, 'Fabricación de productos elaborados de metal, excepto maquinaria y equipo' as nombre, 'nan' as descripcion, 2050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '251' as codigo, 'Fabricación de productos metálicos para uso estructural, tanques, depósitos y recipientes de metal' as nombre, 'nan' as descripcion, 2060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2511' as codigo, 'Fabricación de productos metálicos para uso estructural' as nombre, 'nan' as descripcion, 2070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2512' as codigo, 'Fabricación de tanques, depósitos y recipientes de metal' as nombre, 'nan' as descripcion, 2080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2513' as codigo, 'Fabricación de generadores de vapor, excepto calderas de agua caliente para calefacción central' as nombre, 'nan' as descripcion, 2090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '252' as codigo, 'Fabricación de armas y municiones' as nombre, 'nan' as descripcion, 2100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2520' as codigo, 'Fabricación de armas y municiones' as nombre, 'nan' as descripcion, 2110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '259' as codigo, 'Fabricación de otros productos elaborados de metal; actividades de servicios de trabajo de metales' as nombre, 'nan' as descripcion, 2120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2591' as codigo, 'Forja, prensado, estampado y laminado de metales; pulvimetalurgia' as nombre, 'nan' as descripcion, 2130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2592' as codigo, 'Tratamiento y revestimiento de metales; maquinado' as nombre, 'nan' as descripcion, 2140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2593' as codigo, 'Fabricación de artículos de cuchillería, herramientas de mano y artículos de ferretería' as nombre, 'nan' as descripcion, 2150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2599' as codigo, 'Fabricación de otros productos elaborados de metal n.c.p.' as nombre, 'nan' as descripcion, 2160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '26' as codigo, 'Fabricación de productos de informática, de electrónica y de óptica' as nombre, 'nan' as descripcion, 2170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '261' as codigo, 'Fabricación de componentes y tableros electrónicos' as nombre, 'nan' as descripcion, 2180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2610' as codigo, 'Fabricación de componentes y tableros electrónicos' as nombre, 'nan' as descripcion, 2190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '262' as codigo, 'Fabricación de ordenadores y equipo periférico' as nombre, 'nan' as descripcion, 2200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2620' as codigo, 'Fabricación de ordenadores y equipo periférico' as nombre, 'nan' as descripcion, 2210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '263' as codigo, 'Fabricación de equipo de comunicaciones' as nombre, 'nan' as descripcion, 2220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2630' as codigo, 'Fabricación de equipo de comunicaciones' as nombre, 'nan' as descripcion, 2230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '264' as codigo, 'Fabricación de aparatos electrónicos de consumo' as nombre, 'nan' as descripcion, 2240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2640' as codigo, 'Fabricación de aparatos electrónicos de consumo' as nombre, 'nan' as descripcion, 2250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '265' as codigo, 'Fabricación de equipo de medición, prueba, navegación y control y de relojes' as nombre, 'nan' as descripcion, 2260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2651' as codigo, 'Fabricación de equipo de medición, prueba, navegación y control' as nombre, 'nan' as descripcion, 2270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2652' as codigo, 'Fabricación de relojes' as nombre, 'nan' as descripcion, 2280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '266' as codigo, 'Fabricación de equipo de irradiación y equipo electrónico de uso médico y terapéutico' as nombre, 'nan' as descripcion, 2290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2660' as codigo, 'Fabricación de equipo de irradiación y equipo electrónico de uso médico y terapéutico' as nombre, 'nan' as descripcion, 2300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '267' as codigo, 'Fabricación de instrumentos ópticos y equipo fotográfico' as nombre, 'nan' as descripcion, 2310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2670' as codigo, 'Fabricación de instrumentos ópticos y equipo fotográfico' as nombre, 'nan' as descripcion, 2320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '268' as codigo, 'Fabricación de soportes magnéticos y ópticos' as nombre, 'nan' as descripcion, 2330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2680' as codigo, 'Fabricación de soportes magnéticos y ópticos' as nombre, 'nan' as descripcion, 2340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '27' as codigo, 'Fabricación de equipo eléctrico' as nombre, 'nan' as descripcion, 2350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '271' as codigo, 'Fabricación de motores, generadores y transformadores eléctricos y aparatos de distribución y control de la energía eléctrica' as nombre, 'nan' as descripcion, 2360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2710' as codigo, 'Fabricación de motores, generadores y transformadores eléctricos y aparatos de distribución y control de la energía eléctrica' as nombre, 'nan' as descripcion, 2370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '272' as codigo, 'Fabricación de pilas, baterías y acumuladores' as nombre, 'nan' as descripcion, 2380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2720' as codigo, 'Fabricación de pilas, baterías y acumuladores' as nombre, 'nan' as descripcion, 2390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '273' as codigo, 'Fabricación de cables y dispositivos de cableado' as nombre, 'nan' as descripcion, 2400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2731' as codigo, 'Fabricación de cables de fibra óptica' as nombre, 'nan' as descripcion, 2410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2732' as codigo, 'Fabricación de otros hilos y cables eléctricos' as nombre, 'nan' as descripcion, 2420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2733' as codigo, 'Fabricación de dispositivos de cableado' as nombre, 'nan' as descripcion, 2430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '274' as codigo, 'Fabricación de equipo eléctrico de iluminación' as nombre, 'nan' as descripcion, 2440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2740' as codigo, 'Fabricación de equipo eléctrico de iluminación' as nombre, 'nan' as descripcion, 2450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '275' as codigo, 'Fabricación de aparatos de uso doméstico' as nombre, 'nan' as descripcion, 2460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2750' as codigo, 'Fabricación de aparatos de uso doméstico' as nombre, 'nan' as descripcion, 2470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '279' as codigo, 'Fabricación de otros tipos de equipo eléctrico' as nombre, 'nan' as descripcion, 2480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2790' as codigo, 'Fabricación de otros tipos de equipo eléctrico' as nombre, 'nan' as descripcion, 2490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '28' as codigo, 'Fabricación de maquinaria y equipo n.c.p.' as nombre, 'nan' as descripcion, 2500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '281' as codigo, 'Fabricación de maquinaria de uso general' as nombre, 'nan' as descripcion, 2510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2811' as codigo, 'Fabricación de motores y turbinas, excepto motores para aeronaves, vehículos automotores y motocicletas' as nombre, 'nan' as descripcion, 2520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2812' as codigo, 'Fabricación de equipo de propulsión de fluidos' as nombre, 'nan' as descripcion, 2530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2813' as codigo, 'Fabricación de otras bombas, compresores, grifos y válvulas' as nombre, 'nan' as descripcion, 2540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2814' as codigo, 'Fabricación de cojinetes, engranajes, trenes de engranajes y piezas de transmisión' as nombre, 'nan' as descripcion, 2550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2815' as codigo, 'Fabricación de hornos, hogares y quemadores' as nombre, 'nan' as descripcion, 2560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2816' as codigo, 'Fabricación de equipo de elevación y manipulación' as nombre, 'nan' as descripcion, 2570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2817' as codigo, 'Fabricación de maquinaria y equipo de oficina (excepto ordenadores y equipo periférico)' as nombre, 'nan' as descripcion, 2580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2818' as codigo, 'Fabricación de herramientas de mano motorizadas' as nombre, 'nan' as descripcion, 2590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '2819' as codigo, 'Fabricación de otros tipos de maquinaria de uso general' as nombre, 'nan' as descripcion, 2600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9512' as codigo, 'Reparación de equipo de comunicaciones' as nombre, 'nan' as descripcion, 7230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '952' as codigo, 'Reparación de efectos personales y enseres domésticos' as nombre, 'nan' as descripcion, 7240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9521' as codigo, 'Reparación de aparatos electrónicos de consumo' as nombre, 'nan' as descripcion, 7250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9522' as codigo, 'Reparación de aparatos de uso doméstico y equipo doméstico y de jardinería' as nombre, 'nan' as descripcion, 7260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9523' as codigo, 'Reparación de calzado y de artículos de cuero' as nombre, 'nan' as descripcion, 7270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9524' as codigo, 'Reparación de muebles y accesorios domésticos' as nombre, 'nan' as descripcion, 7280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9529' as codigo, 'Reparación de otros efectos personales y enseres domésticos' as nombre, 'nan' as descripcion, 7290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '96' as codigo, 'Otras actividades de servicios personales' as nombre, 'nan' as descripcion, 7300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '960' as codigo, 'Otras actividades de servicios personales' as nombre, 'nan' as descripcion, 7310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9601' as codigo, 'Lavado y limpieza, incluida la limpieza en seco, de productos textiles y de piel' as nombre, 'nan' as descripcion, 7320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9602' as codigo, 'Peluquería y otros tratamientos de belleza' as nombre, 'nan' as descripcion, 7330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9603' as codigo, 'Pompas fúnebres y actividades conexas' as nombre, 'nan' as descripcion, 7340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9609' as codigo, 'Otras actividades de servicios personales n.c.p.' as nombre, 'nan' as descripcion, 7350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '97' as codigo, 'Actividades de los hogares como empleadores de personal doméstico' as nombre, 'nan' as descripcion, 7360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '970' as codigo, 'Actividades de los hogares como empleadores de personal doméstico' as nombre, 'nan' as descripcion, 7370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9700' as codigo, 'Actividades de los hogares como empleadores de personal doméstico' as nombre, 'nan' as descripcion, 7380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '98' as codigo, 'Actividades no diferenciadas de los hogares como productores de bienes y servicios para uso propio' as nombre, 'nan' as descripcion, 7390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '981' as codigo, 'Actividades no diferenciadas de los hogares como productores de bienes para uso propio' as nombre, 'nan' as descripcion, 7400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9810' as codigo, 'Actividades no diferenciadas de los hogares como productores de bienes para uso propio' as nombre, 'nan' as descripcion, 7410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '982' as codigo, 'Actividades no diferenciadas de los hogares como productores de servicios para uso propio' as nombre, 'nan' as descripcion, 7420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9820' as codigo, 'Actividades no diferenciadas de los hogares como productores de servicios para uso propio' as nombre, 'nan' as descripcion, 7430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '99' as codigo, 'Actividades de organizaciones y órganos extraterritoriales' as nombre, 'nan' as descripcion, 7440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '990' as codigo, 'Actividades de organizaciones y órganos extraterritoriales' as nombre, 'nan' as descripcion, 7450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9900' as codigo, 'Actividades de organizaciones y órganos extraterritoriales' as nombre, 'nan' as descripcion, 7460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3290' as codigo, 'Otras industrias manufactureras n.c.p.' as nombre, 'nan' as descripcion, 3060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '33' as codigo, 'Reparación e instalación de maquinaria y equipo' as nombre, 'nan' as descripcion, 3070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '331' as codigo, 'Reparación de productos elaborados de metal, maquinaria y equipo' as nombre, 'nan' as descripcion, 3080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3311' as codigo, 'Reparación de productos elaborados de metal' as nombre, 'nan' as descripcion, 3090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3312' as codigo, 'Reparación de maquinaria' as nombre, 'nan' as descripcion, 3100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3313' as codigo, 'Reparación de equipo electrónico y óptico' as nombre, 'nan' as descripcion, 3110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3314' as codigo, 'Reparación de equipo eléctrico' as nombre, 'nan' as descripcion, 3120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3315' as codigo, 'Reparación de equipo de transporte, excepto vehículos automotores' as nombre, 'nan' as descripcion, 3130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3319' as codigo, 'Reparación de otros tipos de equipo' as nombre, 'nan' as descripcion, 3140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '332' as codigo, 'Instalación de maquinaria y equipo industriales' as nombre, 'nan' as descripcion, 3150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3320' as codigo, 'Instalación de maquinaria y equipo industriales' as nombre, 'nan' as descripcion, 3160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '35' as codigo, 'Suministro de electricidad, gas, vapor y aire acondicionado' as nombre, 'nan' as descripcion, 3170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '351' as codigo, 'Generación, transmisión y distribución de energía eléctrica' as nombre, 'nan' as descripcion, 3180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3510' as codigo, 'Generación, transmisión y distribución de energía eléctrica' as nombre, 'nan' as descripcion, 3190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '352' as codigo, 'Fabricación de gas; distribución de combustibles gaseosos por tuberías' as nombre, 'nan' as descripcion, 3200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3520' as codigo, 'Fabricación de gas; distribución de combustibles gaseosos por tuberías' as nombre, 'nan' as descripcion, 3210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '353' as codigo, 'Suministro de vapor y de aire acondicionado' as nombre, 'nan' as descripcion, 3220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3530' as codigo, 'Suministro de vapor y de aire acondicionado' as nombre, 'nan' as descripcion, 3230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '36' as codigo, 'Captación, tratamiento y distribución de agua' as nombre, 'nan' as descripcion, 3240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '360' as codigo, 'Captación, tratamiento y distribución de agua' as nombre, 'nan' as descripcion, 3250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3600' as codigo, 'Captación, tratamiento y distribución de agua' as nombre, 'nan' as descripcion, 3260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '37' as codigo, 'Evacuación de aguas residuales' as nombre, 'nan' as descripcion, 3270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '370' as codigo, 'Evacuación de aguas residuales' as nombre, 'nan' as descripcion, 3280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3700' as codigo, 'Evacuación de aguas residuales' as nombre, 'nan' as descripcion, 3290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '38' as codigo, 'Recogida, tratamiento y eliminación de desechos; recuperación de materiales' as nombre, 'nan' as descripcion, 3300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '381' as codigo, 'Recogida de desechos' as nombre, 'nan' as descripcion, 3310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3811' as codigo, 'Recogida de desechos no peligrosos' as nombre, 'nan' as descripcion, 3320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3812' as codigo, 'Recogida de desechos peligrosos' as nombre, 'nan' as descripcion, 3330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '382' as codigo, 'Tratamiento y eliminación de desechos' as nombre, 'nan' as descripcion, 3340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3821' as codigo, 'Tratamiento y eliminación de desechos no peligrosos' as nombre, 'nan' as descripcion, 3350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3822' as codigo, 'Tratamiento y eliminación de desechos peligrosos' as nombre, 'nan' as descripcion, 3360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '383' as codigo, 'Recuperación de materiales' as nombre, 'nan' as descripcion, 3370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3830' as codigo, 'Recuperación de materiales' as nombre, 'nan' as descripcion, 3380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '39' as codigo, 'Actividades de descontaminación y otros servicios de gestión de desechos' as nombre, 'nan' as descripcion, 3390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '390' as codigo, 'Actividades de descontaminación y otros servicios de gestión de desechos' as nombre, 'nan' as descripcion, 3400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '3900' as codigo, 'Actividades de descontaminación y otros servicios de gestión de desechos' as nombre, 'nan' as descripcion, 3410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '41' as codigo, 'Construcción de edificios' as nombre, 'nan' as descripcion, 3420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '410' as codigo, 'Construcción de edificios' as nombre, 'nan' as descripcion, 3430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4100' as codigo, 'Construcción de edificios' as nombre, 'nan' as descripcion, 3440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '42' as codigo, 'Obras de ingeniería civil' as nombre, 'nan' as descripcion, 3450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '421' as codigo, 'Construcción de carreteras y vías de ferrocarril' as nombre, 'nan' as descripcion, 3460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4210' as codigo, 'Construcción de carreteras y vías de ferrocarril' as nombre, 'nan' as descripcion, 3470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '422' as codigo, 'Construcción de proyectos de servicio público' as nombre, 'nan' as descripcion, 3480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4220' as codigo, 'Construcción de proyectos de servicio público' as nombre, 'nan' as descripcion, 3490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '429' as codigo, 'Construcción de otras obras de ingeniería civil' as nombre, 'nan' as descripcion, 3500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4290' as codigo, 'Construcción de otras obras de ingeniería civil' as nombre, 'nan' as descripcion, 3510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '43' as codigo, 'Actividades especializadas de construcción' as nombre, 'nan' as descripcion, 3520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '431' as codigo, 'Demolición y preparación del terreno' as nombre, 'nan' as descripcion, 3530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4311' as codigo, 'Demolición' as nombre, 'nan' as descripcion, 3540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4312' as codigo, 'Preparación del terreno' as nombre, 'nan' as descripcion, 3550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '432' as codigo, 'Instalaciones eléctricas y de fontanería y otras instalaciones para obras de construcción' as nombre, 'nan' as descripcion, 3560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4321' as codigo, 'Instalaciones eléctricas' as nombre, 'nan' as descripcion, 3570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4322' as codigo, 'Instalaciones de fontanería, calefacción y aire acondicionado' as nombre, 'nan' as descripcion, 3580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4329' as codigo, 'Otras instalaciones para obras de construcción' as nombre, 'nan' as descripcion, 3590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '433' as codigo, 'Terminación y acabado de edificios' as nombre, 'nan' as descripcion, 3600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4330' as codigo, 'Terminación y acabado de edificios' as nombre, 'nan' as descripcion, 3610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '439' as codigo, 'Otras actividades especializadas de construcción' as nombre, 'nan' as descripcion, 3620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4390' as codigo, 'Otras actividades especializadas de construcción' as nombre, 'nan' as descripcion, 3630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '45' as codigo, 'Comercio al por mayor y al por menor y reparación de vehículos automotores y motocicletas' as nombre, 'nan' as descripcion, 3640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '451' as codigo, 'Venta de vehículos automotores' as nombre, 'nan' as descripcion, 3650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4510' as codigo, 'Venta de vehículos automotores' as nombre, 'nan' as descripcion, 3660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '452' as codigo, 'Mantenimiento y reparación de vehículos automotores' as nombre, 'nan' as descripcion, 3670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4520' as codigo, 'Mantenimiento y reparación de vehículos automotores' as nombre, 'nan' as descripcion, 3680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '453' as codigo, 'Venta de partes, piezas y accesorios para vehículos automotores' as nombre, 'nan' as descripcion, 3690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4530' as codigo, 'Venta de partes, piezas y accesorios para vehículos automotores' as nombre, 'nan' as descripcion, 3700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '454' as codigo, 'Venta, mantenimiento y reparación de motocicletas y sus partes, piezas y accesorios' as nombre, 'nan' as descripcion, 3710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4540' as codigo, 'Venta, mantenimiento y reparación de motocicletas y sus partes, piezas y accesorios' as nombre, 'nan' as descripcion, 3720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '46' as codigo, 'Comercio al por mayor, excepto el de vehículos automotores y motocicletas' as nombre, 'nan' as descripcion, 3730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '461' as codigo, 'Venta al por mayor a cambio de una retribución o por contrata' as nombre, 'nan' as descripcion, 3740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4610' as codigo, 'Venta al por mayor a cambio de una retribución o por contrata' as nombre, 'nan' as descripcion, 3750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '462' as codigo, 'Venta al por mayor de materias primas agropecuarias y animales vivos' as nombre, 'nan' as descripcion, 3760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4620' as codigo, 'Venta al por mayor de materias primas agropecuarias y animales vivos' as nombre, 'nan' as descripcion, 3770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '463' as codigo, 'Venta al por mayor de alimentos, bebidas y tabaco' as nombre, 'nan' as descripcion, 3780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4630' as codigo, 'Venta al por mayor de alimentos, bebidas y tabaco' as nombre, 'nan' as descripcion, 3790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '464' as codigo, 'Venta al por mayor de enseres domésticos' as nombre, 'nan' as descripcion, 3800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4641' as codigo, 'Venta al por mayor de productos textiles, prendas de vestir y calzado' as nombre, 'nan' as descripcion, 3810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4649' as codigo, 'Venta al por mayor de otros enseres domésticos' as nombre, 'nan' as descripcion, 3820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '465' as codigo, 'Venta al por mayor de maquinaria, equipo y materiales' as nombre, 'nan' as descripcion, 3830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4651' as codigo, 'Venta al por mayor de ordenadores, equipo periférico y programas de informática' as nombre, 'nan' as descripcion, 3840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4652' as codigo, 'Venta al por mayor de equipo, partes y piezas electrónicos y de telecomunicaciones' as nombre, 'nan' as descripcion, 3850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4653' as codigo, 'Venta al por mayor de maquinaria, equipo y materiales agropecuarios' as nombre, 'nan' as descripcion, 3860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4659' as codigo, 'Venta al por mayor de otros tipos de maquinaria y equipo' as nombre, 'nan' as descripcion, 3870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '466' as codigo, 'Otras actividades de venta al por mayor especializada' as nombre, 'nan' as descripcion, 3880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4661' as codigo, 'Venta al por mayor de combustibles sólidos, líquidos y gaseosos y productos conexos' as nombre, 'nan' as descripcion, 3890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4662' as codigo, 'Venta al por mayor de metales y minerales metalíferos' as nombre, 'nan' as descripcion, 3900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4663' as codigo, 'Venta al por mayor de materiales de construcción, artículos de ferretería y equipo y materiales de fontanería y calefacción' as nombre, 'nan' as descripcion, 3910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4669' as codigo, 'Venta al por mayor de desperdicios, desechos y chatarra y otros productos n.c.p.' as nombre, 'nan' as descripcion, 3920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '469' as codigo, 'Venta al por mayor no especializada' as nombre, 'nan' as descripcion, 3930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4690' as codigo, 'Venta al por mayor no especializada' as nombre, 'nan' as descripcion, 3940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '47' as codigo, 'Comercio al por menor, excepto el de vehículos automotores y motocicletas' as nombre, 'nan' as descripcion, 3950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '471' as codigo, 'Venta al por menor en comercios no especializados' as nombre, 'nan' as descripcion, 3960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4711' as codigo, 'Venta al por menor en comercios no especializados con predominio de la venta de alimentos, bebidas o tabaco' as nombre, 'nan' as descripcion, 3970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4719' as codigo, 'Otras actividades de venta al por menor en comercios no especializados' as nombre, 'nan' as descripcion, 3980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '472' as codigo, 'Venta al por menor de alimentos, bebidas y tabaco en comercios especializados' as nombre, 'nan' as descripcion, 3990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4721' as codigo, 'Venta al por menor de alimentos en comercios especializados' as nombre, 'nan' as descripcion, 4000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4722' as codigo, 'Venta al por menor de bebidas en comercios especializados' as nombre, 'nan' as descripcion, 4010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4723' as codigo, 'Venta al por menor de productos de tabaco en comercios especializados' as nombre, 'nan' as descripcion, 4020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '473' as codigo, 'Venta al por menor de combustibles para vehículos automotores en comercios especializados' as nombre, 'nan' as descripcion, 4030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4730' as codigo, 'Venta al por menor de combustibles para vehículos automotores en comercios especializados' as nombre, 'nan' as descripcion, 4040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '474' as codigo, 'Venta al por menor de equipo de información y de comunicaciones en comercios especializados' as nombre, 'nan' as descripcion, 4050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4741' as codigo, 'Venta al por menor de ordenadores, equipo periférico, programas de informática y equipo de telecomunicaciones en comercios especializados' as nombre, 'nan' as descripcion, 4060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4742' as codigo, 'Venta al por menor de equipo de sonido y de video en comercios especializados' as nombre, 'nan' as descripcion, 4070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '475' as codigo, 'Venta al por menor de otros enseres domésticos en comercios especializados' as nombre, 'nan' as descripcion, 4080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4751' as codigo, 'Venta al por menor de productos textiles en comercios especializados' as nombre, 'nan' as descripcion, 4090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4752' as codigo, 'Venta al por menor de artículos de ferretería, pinturas y productos de vidrio en comercios especializados' as nombre, 'nan' as descripcion, 4100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4753' as codigo, 'Venta al por menor de tapices, alfombras y cubrimientos para paredes y pisos en comercios especializados' as nombre, 'nan' as descripcion, 4110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4759' as codigo, 'Venta al por menor de aparatos eléctricos de uso doméstico, muebles, equipo de iluminación y otros enseres domésticos en comercios especializados' as nombre, 'nan' as descripcion, 4120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '476' as codigo, 'Venta al por menor de productos culturales y recreativos en comercios especializados' as nombre, 'nan' as descripcion, 4130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4761' as codigo, 'Venta al por menor de libros, periódicos y artículos de papelería en comercios especializados' as nombre, 'nan' as descripcion, 4140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4762' as codigo, 'Venta al por menor de grabaciones de música y de vídeo en comercios especializados' as nombre, 'nan' as descripcion, 4150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4763' as codigo, 'Venta al por menor de equipo de deporte en comercios especializados' as nombre, 'nan' as descripcion, 4160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4764' as codigo, 'Venta al por menor de juegos y juguetes en comercios especializados' as nombre, 'nan' as descripcion, 4170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '477' as codigo, 'Venta al por menor de otros productos en comercios especializados' as nombre, 'nan' as descripcion, 4180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4771' as codigo, 'Venta al por menor de prendas de vestir, calzado y artículos de cuero en comercios especializados' as nombre, 'nan' as descripcion, 4190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4772' as codigo, 'Venta al por menor de productos farmacéuticos y médicos, cosméticos y artículos de tocador en comercios especializados' as nombre, 'nan' as descripcion, 4200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4773' as codigo, 'Venta al por menor de otros productos nuevos en comercios especializados' as nombre, 'nan' as descripcion, 4210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4774' as codigo, 'Venta al por menor de artículos de segunda mano' as nombre, 'nan' as descripcion, 4220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '478' as codigo, 'Venta al por menor en puestos de venta y mercados' as nombre, 'nan' as descripcion, 4230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4781' as codigo, 'Venta al por menor de alimentos, bebidas y tabaco en puestos de venta y mercados' as nombre, 'nan' as descripcion, 4240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4782' as codigo, 'Venta al por menor de productos textiles, prendas de vestir y calzado en puestos de venta y mercados' as nombre, 'nan' as descripcion, 4250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4789' as codigo, 'Venta al por menor de otros productos en puestos de venta y mercados' as nombre, 'nan' as descripcion, 4260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '479' as codigo, 'Venta al por menor no realizada en comercios, puestos de venta o mercados' as nombre, 'nan' as descripcion, 4270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4791' as codigo, 'Venta al por menor por correo y por Internet' as nombre, 'nan' as descripcion, 4280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4799' as codigo, 'Otras actividades de venta al por menor no realizadas en comercios, puestos de venta o mercados' as nombre, 'nan' as descripcion, 4290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '49' as codigo, 'Transporte por vía terrestre y transporte por tuberías' as nombre, 'nan' as descripcion, 4300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '491' as codigo, 'Transporte por ferrocarril' as nombre, 'nan' as descripcion, 4310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4911' as codigo, 'Transporte interurbano de pasajeros por ferrocarril' as nombre, 'nan' as descripcion, 4320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4912' as codigo, 'Transporte de carga por ferrocarril' as nombre, 'nan' as descripcion, 4330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '492' as codigo, 'Otras actividades de transporte por vía terrestre' as nombre, 'nan' as descripcion, 4340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4921' as codigo, 'Transporte urbano y suburbano de pasajeros por vía terrestre' as nombre, 'nan' as descripcion, 4350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4922' as codigo, 'Otras actividades de transporte por vía terrestre' as nombre, 'nan' as descripcion, 4360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4923' as codigo, 'Transporte de carga por carretera' as nombre, 'nan' as descripcion, 4370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '493' as codigo, 'Transporte por tuberías' as nombre, 'nan' as descripcion, 4380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '4930' as codigo, 'Transporte por tuberías' as nombre, 'nan' as descripcion, 4390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '50' as codigo, 'Transporte por vía acuática' as nombre, 'nan' as descripcion, 4400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '501' as codigo, 'Transporte marítimo y de cabotaje' as nombre, 'nan' as descripcion, 4410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5011' as codigo, 'Transporte de pasajeros marítimo y de cabotaje' as nombre, 'nan' as descripcion, 4420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5012' as codigo, 'Transporte de carga marítimo y de cabotaje' as nombre, 'nan' as descripcion, 4430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '502' as codigo, 'Transporte por vías de navegación interiores' as nombre, 'nan' as descripcion, 4440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5021' as codigo, 'Transporte de pasajeros por vías de navegación interiores' as nombre, 'nan' as descripcion, 4450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5022' as codigo, 'Transporte de carga por vías de navegación interiores' as nombre, 'nan' as descripcion, 4460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '51' as codigo, 'Transporte por vía aérea' as nombre, 'nan' as descripcion, 4470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '511' as codigo, 'Transporte de pasajeros por vía aérea' as nombre, 'nan' as descripcion, 4480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5110' as codigo, 'Transporte de pasajeros por vía aérea' as nombre, 'nan' as descripcion, 4490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '512' as codigo, 'Transporte de carga por vía aérea' as nombre, 'nan' as descripcion, 4500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5120' as codigo, 'Transporte de carga por vía aérea' as nombre, 'nan' as descripcion, 4510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '52' as codigo, 'Almacenamiento y actividades de apoyo al transporte' as nombre, 'nan' as descripcion, 4520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '521' as codigo, 'Almacenamiento y depósito' as nombre, 'nan' as descripcion, 4530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5210' as codigo, 'Almacenamiento y depósito' as nombre, 'nan' as descripcion, 4540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '522' as codigo, 'Actividades de apoyo al transporte' as nombre, 'nan' as descripcion, 4550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5221' as codigo, 'Actividades de servicios vinculadas al transporte terrestre' as nombre, 'nan' as descripcion, 4560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5222' as codigo, 'Actividades de servicios vinculadas al transporte acuático' as nombre, 'nan' as descripcion, 4570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5223' as codigo, 'Actividades de servicios vinculadas al transporte aéreo' as nombre, 'nan' as descripcion, 4580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5224' as codigo, 'Manipulación de la carga' as nombre, 'nan' as descripcion, 4590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5229' as codigo, 'Otras actividades de apoyo al transporte' as nombre, 'nan' as descripcion, 4600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '53' as codigo, 'Actividades postales y de mensajería' as nombre, 'nan' as descripcion, 4610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '531' as codigo, 'Actividades postales' as nombre, 'nan' as descripcion, 4620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5310' as codigo, 'Actividades postales' as nombre, 'nan' as descripcion, 4630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '532' as codigo, 'Actividades de mensajería' as nombre, 'nan' as descripcion, 4640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5320' as codigo, 'Actividades de mensajería' as nombre, 'nan' as descripcion, 4650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '55' as codigo, 'Actividades de alojamiento' as nombre, 'nan' as descripcion, 4660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '551' as codigo, 'Actividades de alojamiento para estancias cortas' as nombre, 'nan' as descripcion, 4670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5510' as codigo, 'Actividades de alojamiento para estancias cortas' as nombre, 'nan' as descripcion, 4680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '552' as codigo, 'Actividades de campamentos, parques de vehículos recreativos y parques de caravanas' as nombre, 'nan' as descripcion, 4690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5520' as codigo, 'Actividades de campamentos, parques de vehículos recreativos y parques de caravanas' as nombre, 'nan' as descripcion, 4700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '559' as codigo, 'Otras actividades de alojamiento' as nombre, 'nan' as descripcion, 4710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5590' as codigo, 'Otras actividades de alojamiento' as nombre, 'nan' as descripcion, 4720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '56' as codigo, 'Actividades de servicio de comidas y bebidas' as nombre, 'nan' as descripcion, 4730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '561' as codigo, 'Actividades de restaurantes y de servicio móvil de comidas' as nombre, 'nan' as descripcion, 4740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5610' as codigo, 'Actividades de restaurantes y de servicio móvil de comidas' as nombre, 'nan' as descripcion, 4750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '562' as codigo, 'Suministro de comidas por encargo y otras actividades de servicio de comidas' as nombre, 'nan' as descripcion, 4760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5621' as codigo, 'Suministro de comidas por encargo' as nombre, 'nan' as descripcion, 4770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5629' as codigo, 'Otras actividades de servicio de comidas' as nombre, 'nan' as descripcion, 4780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '563' as codigo, 'Actividades de servicio de bebidas' as nombre, 'nan' as descripcion, 4790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5630' as codigo, 'Actividades de servicio de bebidas' as nombre, 'nan' as descripcion, 4800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '58' as codigo, 'Actividades de edición' as nombre, 'nan' as descripcion, 4810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '581' as codigo, 'Edición de libros y publicaciones periódicas y otras actividades de edición' as nombre, 'nan' as descripcion, 4820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5811' as codigo, 'Edición de libros' as nombre, 'nan' as descripcion, 4830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5812' as codigo, 'Edición de directorios y listas de correo' as nombre, 'nan' as descripcion, 4840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5813' as codigo, 'Edición de periódicos, revistas y otras publicaciones periódicas' as nombre, 'nan' as descripcion, 4850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5819' as codigo, 'Otras actividades de edición' as nombre, 'nan' as descripcion, 4860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '582' as codigo, 'Edición de programas informáticos' as nombre, 'nan' as descripcion, 4870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5820' as codigo, 'Edición de programas informáticos' as nombre, 'nan' as descripcion, 4880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '59' as codigo, 'Actividades de producción de películas cinematográficas, vídeos y programas de televisión, grabación de sonido y edición de música' as nombre, 'nan' as descripcion, 4890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '591' as codigo, 'Actividades de producción de películas cinematográficas, vídeos y programas de televisión' as nombre, 'nan' as descripcion, 4900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5911' as codigo, 'Actividades de producción de películas cinematográficas, vídeos y programas de televisión' as nombre, 'nan' as descripcion, 4910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5912' as codigo, 'Actividades de postproducción de películas cinematográficas, vídeos y programas de televisión' as nombre, 'nan' as descripcion, 4920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5913' as codigo, 'Actividades de distribución de películas cinematográficas, vídeos y programas de televisión' as nombre, 'nan' as descripcion, 4930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5914' as codigo, 'Actividades de exhibición de películas cinematográficas y cintas de vídeo' as nombre, 'nan' as descripcion, 4940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '592' as codigo, 'Actividades de grabación de sonido y edición de música' as nombre, 'nan' as descripcion, 4950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '5920' as codigo, 'Actividades de grabación de sonido y edición de música' as nombre, 'nan' as descripcion, 4960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '60' as codigo, 'Actividades de programación y transmisión' as nombre, 'nan' as descripcion, 4970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '601' as codigo, 'Transmisiones de radio' as nombre, 'nan' as descripcion, 4980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6010' as codigo, 'Transmisiones de radio' as nombre, 'nan' as descripcion, 4990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '602' as codigo, 'Programación y transmisiones de televisión' as nombre, 'nan' as descripcion, 5000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6020' as codigo, 'Programación y transmisiones de televisión' as nombre, 'nan' as descripcion, 5010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '61' as codigo, 'Telecomunicaciones' as nombre, 'nan' as descripcion, 5020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '611' as codigo, 'Actividades de telecomunicaciones alámbricas' as nombre, 'nan' as descripcion, 5030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6110' as codigo, 'Actividades de telecomunicaciones alámbricas' as nombre, 'nan' as descripcion, 5040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '612' as codigo, 'Actividades de telecomunicaciones inalámbricas' as nombre, 'nan' as descripcion, 5050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6120' as codigo, 'Actividades de telecomunicaciones inalámbricas' as nombre, 'nan' as descripcion, 5060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '613' as codigo, 'Actividades de telecomunicaciones por satélite' as nombre, 'nan' as descripcion, 5070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6130' as codigo, 'Actividades de telecomunicaciones por satélite' as nombre, 'nan' as descripcion, 5080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '619' as codigo, 'Otras actividades de telecomunicaciones' as nombre, 'nan' as descripcion, 5090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6190' as codigo, 'Otras actividades de telecomunicaciones' as nombre, 'nan' as descripcion, 5100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '62' as codigo, 'Programación informática, consultoría de informática y actividades conexas' as nombre, 'nan' as descripcion, 5110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '620' as codigo, 'Programación informática, consultoría de informática y actividades conexas' as nombre, 'nan' as descripcion, 5120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6201' as codigo, 'Programación informática' as nombre, 'nan' as descripcion, 5130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6202' as codigo, 'Consultoría de informática y gestión de instalaciones informáticas' as nombre, 'nan' as descripcion, 5140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6209' as codigo, 'Otras actividades de tecnología de la información y de servicios informáticos' as nombre, 'nan' as descripcion, 5150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '63' as codigo, 'Actividades de servicios de información' as nombre, 'nan' as descripcion, 5160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '631' as codigo, 'Procesamiento de datos, hospedaje y actividades conexas; portales web' as nombre, 'nan' as descripcion, 5170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6311' as codigo, 'Procesamiento de datos, hospedaje y actividades conexas' as nombre, 'nan' as descripcion, 5180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6312' as codigo, 'Portales web' as nombre, 'nan' as descripcion, 5190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '639' as codigo, 'Otras actividades de servicios de información' as nombre, 'nan' as descripcion, 5200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6391' as codigo, 'Actividades de agencias de noticias' as nombre, 'nan' as descripcion, 5210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6399' as codigo, 'Otras actividades de servicios de información n.c.p.' as nombre, 'nan' as descripcion, 5220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '64' as codigo, 'Actividades de servicios financieros, excepto las de seguros y fondos de pensiones' as nombre, 'nan' as descripcion, 5230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '641' as codigo, 'Intermediación monetaria' as nombre, 'nan' as descripcion, 5240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6411' as codigo, 'Banca central' as nombre, 'nan' as descripcion, 5250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6419' as codigo, 'Otros tipos de intermediación monetaria' as nombre, 'nan' as descripcion, 5260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '642' as codigo, 'Actividades de sociedades de cartera' as nombre, 'nan' as descripcion, 5270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6420' as codigo, 'Actividades de sociedades de cartera' as nombre, 'nan' as descripcion, 5280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '643' as codigo, 'Fondos y sociedades de inversión y entidades financieras similares' as nombre, 'nan' as descripcion, 5290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6430' as codigo, 'Fondos y sociedades de inversión y entidades financieras similares' as nombre, 'nan' as descripcion, 5300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '649' as codigo, 'Otras actividades de servicios financieros, excepto las de seguros y fondos de pensiones' as nombre, 'nan' as descripcion, 5310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6491' as codigo, 'Arrendamiento financiero' as nombre, 'nan' as descripcion, 5320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6492' as codigo, 'Otras actividades de concesión de crédito' as nombre, 'nan' as descripcion, 5330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6499' as codigo, 'Otras actividades de servicios financieros, excepto las de seguros y fondos de pensiones, n.c.p.' as nombre, 'nan' as descripcion, 5340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '65' as codigo, 'Seguros, reaseguros y fondos de pensiones, excepto planes de seguridad social de afiliación obligatoria' as nombre, 'nan' as descripcion, 5350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '651' as codigo, 'Seguros' as nombre, 'nan' as descripcion, 5360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6511' as codigo, 'Seguros de vida' as nombre, 'nan' as descripcion, 5370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6512' as codigo, 'Seguros generales' as nombre, 'nan' as descripcion, 5380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '652' as codigo, 'Reaseguros' as nombre, 'nan' as descripcion, 5390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6520' as codigo, 'Reaseguros' as nombre, 'nan' as descripcion, 5400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '653' as codigo, 'Fondos de pensiones' as nombre, 'nan' as descripcion, 5410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6530' as codigo, 'Fondos de pensiones' as nombre, 'nan' as descripcion, 5420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '66' as codigo, 'Actividades auxiliares de las actividades de servicios financieros' as nombre, 'nan' as descripcion, 5430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '661' as codigo, 'Actividades auxiliares de las actividades de servicios financieros, excepto las de seguros y fondos de pensiones' as nombre, 'nan' as descripcion, 5440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6611' as codigo, 'Administración de mercados financieros' as nombre, 'nan' as descripcion, 5450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6612' as codigo, 'Corretaje de valores y de contratos de productos básicos' as nombre, 'nan' as descripcion, 5460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6619' as codigo, 'Otras actividades auxiliares de las actividades de servicios financieros' as nombre, 'nan' as descripcion, 5470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '662' as codigo, 'Actividades auxiliares de las actividades de seguros y fondos de pensiones' as nombre, 'nan' as descripcion, 5480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6621' as codigo, 'Evaluación de riesgos y daños' as nombre, 'nan' as descripcion, 5490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6622' as codigo, 'Actividades de agentes y corredores de seguros' as nombre, 'nan' as descripcion, 5500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6629' as codigo, 'Otras actividades auxiliares de las actividades de seguros y fondos de pensiones' as nombre, 'nan' as descripcion, 5510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '663' as codigo, 'Actividades de gestión de fondos' as nombre, 'nan' as descripcion, 5520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6630' as codigo, 'Actividades de gestión de fondos' as nombre, 'nan' as descripcion, 5530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '68' as codigo, 'Actividades inmobiliarias' as nombre, 'nan' as descripcion, 5540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '681' as codigo, 'Actividades inmobiliarias realizadas con bienes propios o arrendados' as nombre, 'nan' as descripcion, 5550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6810' as codigo, 'Actividades inmobiliarias realizadas con bienes propios o arrendados' as nombre, 'nan' as descripcion, 5560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '682' as codigo, 'Actividades inmobiliarias realizadas a cambio de una retribución o por contrata' as nombre, 'nan' as descripcion, 5570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6820' as codigo, 'Actividades inmobiliarias realizadas a cambio de una retribución o por contrata' as nombre, 'nan' as descripcion, 5580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '69' as codigo, 'Actividades jurídicas y de contabilidad' as nombre, 'nan' as descripcion, 5590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '691' as codigo, 'Actividades jurídicas' as nombre, 'nan' as descripcion, 5600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6910' as codigo, 'Actividades jurídicas' as nombre, 'nan' as descripcion, 5610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '692' as codigo, 'Actividades de contabilidad, teneduría de libros y auditoría; consultoría fiscal' as nombre, 'nan' as descripcion, 5620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '6920' as codigo, 'Actividades de contabilidad, teneduría de libros y auditoría; consultoría fiscal' as nombre, 'nan' as descripcion, 5630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '70' as codigo, 'Actividades de oficinas principales; actividades de consultoría de gestión' as nombre, 'nan' as descripcion, 5640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '701' as codigo, 'Actividades de oficinas principales' as nombre, 'nan' as descripcion, 5650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7010' as codigo, 'Actividades de oficinas principales' as nombre, 'nan' as descripcion, 5660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '702' as codigo, 'Actividades de consultoría de gestión' as nombre, 'nan' as descripcion, 5670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7020' as codigo, 'Actividades de consultoría de gestión' as nombre, 'nan' as descripcion, 5680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '71' as codigo, 'Actividades de arquitectura e ingeniería; ensayos y análisis técnicos' as nombre, 'nan' as descripcion, 5690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '711' as codigo, 'Actividades de arquitectura e ingeniería y actividades conexas de consultoría técnica' as nombre, 'nan' as descripcion, 5700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7110' as codigo, 'Actividades de arquitectura e ingeniería y actividades conexas de consultoría técnica' as nombre, 'nan' as descripcion, 5710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '712' as codigo, 'Ensayos y análisis técnicos' as nombre, 'nan' as descripcion, 5720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7120' as codigo, 'Ensayos y análisis técnicos' as nombre, 'nan' as descripcion, 5730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '72' as codigo, 'Investigación científica y desarrollo' as nombre, 'nan' as descripcion, 5740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '721' as codigo, 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería' as nombre, 'nan' as descripcion, 5750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7210' as codigo, 'Investigaciones y desarrollo experimental en el campo de las ciencias naturales y la ingeniería' as nombre, 'nan' as descripcion, 5760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '722' as codigo, 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades' as nombre, 'nan' as descripcion, 5770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7220' as codigo, 'Investigaciones y desarrollo experimental en el campo de las ciencias sociales y las humanidades' as nombre, 'nan' as descripcion, 5780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '73' as codigo, 'Publicidad y estudios de mercado' as nombre, 'nan' as descripcion, 5790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '731' as codigo, 'Publicidad' as nombre, 'nan' as descripcion, 5800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7310' as codigo, 'Publicidad' as nombre, 'nan' as descripcion, 5810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '732' as codigo, 'Estudios de mercado y encuestas de opinión pública' as nombre, 'nan' as descripcion, 5820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7320' as codigo, 'Estudios de mercado y encuestas de opinión pública' as nombre, 'nan' as descripcion, 5830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '74' as codigo, 'Otras actividades profesionales, científicas y técnicas' as nombre, 'nan' as descripcion, 5840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '741' as codigo, 'Actividades especializadas de diseño' as nombre, 'nan' as descripcion, 5850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7410' as codigo, 'Actividades especializadas de diseño' as nombre, 'nan' as descripcion, 5860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '742' as codigo, 'Actividades de fotografía' as nombre, 'nan' as descripcion, 5870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7420' as codigo, 'Actividades de fotografía' as nombre, 'nan' as descripcion, 5880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '749' as codigo, 'Otras actividades profesionales, científicas y técnicas n.c.p.' as nombre, 'nan' as descripcion, 5890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7490' as codigo, 'Otras actividades profesionales, científicas y técnicas n.c.p.' as nombre, 'nan' as descripcion, 5900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '75' as codigo, 'Actividades veterinarias' as nombre, 'nan' as descripcion, 5910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '750' as codigo, 'Actividades veterinarias' as nombre, 'nan' as descripcion, 5920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7500' as codigo, 'Actividades veterinarias' as nombre, 'nan' as descripcion, 5930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '77' as codigo, 'Actividades de alquiler y arrendamiento' as nombre, 'nan' as descripcion, 5940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '771' as codigo, 'Alquiler y arrendamiento de vehículos automotores' as nombre, 'nan' as descripcion, 5950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7710' as codigo, 'Alquiler y arrendamiento de vehículos automotores' as nombre, 'nan' as descripcion, 5960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '772' as codigo, 'Alquiler y arrendamiento de efectos personales y enseres domésticos' as nombre, 'nan' as descripcion, 5970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7721' as codigo, 'Alquiler y arrendamiento de equipo recreativo y deportivo' as nombre, 'nan' as descripcion, 5980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7722' as codigo, 'Alquiler de cintas de vídeo y discos' as nombre, 'nan' as descripcion, 5990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7729' as codigo, 'Alquiler y arrendamiento de otros efectos personales y enseres domésticos' as nombre, 'nan' as descripcion, 6000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '773' as codigo, 'Alquiler y arrendamiento de otros tipos de maquinaria, equipo y bienes tangibles' as nombre, 'nan' as descripcion, 6010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7730' as codigo, 'Alquiler y arrendamiento de otros tipos de maquinaria, equipo y bienes tangibles' as nombre, 'nan' as descripcion, 6020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '774' as codigo, 'Arrendamiento de propiedad intelectual y productos similares, excepto obras protegidas por derechos de autor' as nombre, 'nan' as descripcion, 6030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7740' as codigo, 'Arrendamiento de propiedad intelectual y productos similares, excepto obras protegidas por derechos de autor' as nombre, 'nan' as descripcion, 6040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '78' as codigo, 'Actividades de empleo' as nombre, 'nan' as descripcion, 6050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '781' as codigo, 'Actividades de agencias de empleo' as nombre, 'nan' as descripcion, 6060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7810' as codigo, 'Actividades de agencias de empleo' as nombre, 'nan' as descripcion, 6070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '782' as codigo, 'Actividades de agencias de empleo temporal' as nombre, 'nan' as descripcion, 6080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7820' as codigo, 'Actividades de agencias de empleo temporal' as nombre, 'nan' as descripcion, 6090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '783' as codigo, 'Otras actividades de dotación de recursos humanos' as nombre, 'nan' as descripcion, 6100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7830' as codigo, 'Otras actividades de dotación de recursos humanos' as nombre, 'nan' as descripcion, 6110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '79' as codigo, 'Actividades de agencias de viajes y operadores turísticos y servicios de reservas y actividades conexas' as nombre, 'nan' as descripcion, 6120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '791' as codigo, 'Actividades de agencias de viajes y operadores turísticos' as nombre, 'nan' as descripcion, 6130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7911' as codigo, 'Actividades de agencias de viajes' as nombre, 'nan' as descripcion, 6140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7912' as codigo, 'Actividades de operadores turísticos' as nombre, 'nan' as descripcion, 6150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '799' as codigo, 'Otros servicios de reservas y actividades conexas' as nombre, 'nan' as descripcion, 6160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '7990' as codigo, 'Otros servicios de reservas y actividades conexas' as nombre, 'nan' as descripcion, 6170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '80' as codigo, 'Actividades de seguridad e investigación' as nombre, 'nan' as descripcion, 6180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '801' as codigo, 'Actividades de seguridad privada' as nombre, 'nan' as descripcion, 6190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8010' as codigo, 'Actividades de seguridad privada' as nombre, 'nan' as descripcion, 6200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '802' as codigo, 'Actividades de servicios de sistemas de seguridad' as nombre, 'nan' as descripcion, 6210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8020' as codigo, 'Actividades de servicios de sistemas de seguridad' as nombre, 'nan' as descripcion, 6220 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '803' as codigo, 'Actividades de investigación' as nombre, 'nan' as descripcion, 6230 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8030' as codigo, 'Actividades de investigación' as nombre, 'nan' as descripcion, 6240 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '81' as codigo, 'Actividades de servicios a edificios y de paisajismo' as nombre, 'nan' as descripcion, 6250 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '811' as codigo, 'Actividades combinadas de apoyo a instalaciones' as nombre, 'nan' as descripcion, 6260 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8110' as codigo, 'Actividades combinadas de apoyo a instalaciones' as nombre, 'nan' as descripcion, 6270 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '812' as codigo, 'Actividades de limpieza' as nombre, 'nan' as descripcion, 6280 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8121' as codigo, 'Limpieza general de edificios' as nombre, 'nan' as descripcion, 6290 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8129' as codigo, 'Otras actividades de limpieza de edificios y de instalaciones industriales' as nombre, 'nan' as descripcion, 6300 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '813' as codigo, 'Actividades de paisajismo y servicios de mantenimiento conexos' as nombre, 'nan' as descripcion, 6310 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8130' as codigo, 'Actividades de paisajismo y servicios de mantenimiento conexos' as nombre, 'nan' as descripcion, 6320 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '82' as codigo, 'Actividades administrativas y de apoyo de oficina y otras actividades de apoyo a las empresas' as nombre, 'nan' as descripcion, 6330 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '821' as codigo, 'Actividades administrativas y de apoyo de oficina' as nombre, 'nan' as descripcion, 6340 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8211' as codigo, 'Actividades combinadas de servicios administrativos de oficina' as nombre, 'nan' as descripcion, 6350 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8219' as codigo, 'Fotocopiado, preparación de documentos y otras actividades especializadas de apoyo de oficina' as nombre, 'nan' as descripcion, 6360 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '822' as codigo, 'Actividades de centros de llamadas' as nombre, 'nan' as descripcion, 6370 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8220' as codigo, 'Actividades de centros de llamadas' as nombre, 'nan' as descripcion, 6380 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '823' as codigo, 'Organización de convenciones y exposiciones comerciales' as nombre, 'nan' as descripcion, 6390 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8230' as codigo, 'Organización de convenciones y exposiciones comerciales' as nombre, 'nan' as descripcion, 6400 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '829' as codigo, 'Actividades de servicios de apoyo a las empresas n.c.p.' as nombre, 'nan' as descripcion, 6410 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8291' as codigo, 'Actividades de agencias de cobro y agencias de calificación crediticia' as nombre, 'nan' as descripcion, 6420 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8292' as codigo, 'Actividades de envasado y empaquetado' as nombre, 'nan' as descripcion, 6430 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8299' as codigo, 'Otras actividades de servicios de apoyo a las empresas n.c.p.' as nombre, 'nan' as descripcion, 6440 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '84' as codigo, 'Administración pública y defensa; planes de seguridad social de afiliación obligatoria' as nombre, 'nan' as descripcion, 6450 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '841' as codigo, 'Administración del Estado y aplicación de la política económica y social de la comunidad' as nombre, 'nan' as descripcion, 6460 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8411' as codigo, 'Actividades de la administración pública en general' as nombre, 'nan' as descripcion, 6470 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8412' as codigo, 'Regulación de las actividades de organismos que prestan servicios sanitarios, educativos, culturales y otros servicios sociales, excepto servicios de seguridad social' as nombre, 'nan' as descripcion, 6480 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8413' as codigo, 'Regulación y facilitación de la actividad económica' as nombre, 'nan' as descripcion, 6490 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '842' as codigo, 'Prestación de servicios a la comunidad en general' as nombre, 'nan' as descripcion, 6500 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8421' as codigo, 'Relaciones exteriores' as nombre, 'nan' as descripcion, 6510 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8422' as codigo, 'Actividades de defensa' as nombre, 'nan' as descripcion, 6520 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8423' as codigo, 'Actividades de mantenimiento del orden público y de seguridad' as nombre, 'nan' as descripcion, 6530 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '843' as codigo, 'Actividades de planes de seguridad social de afiliación obligatoria' as nombre, 'nan' as descripcion, 6540 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8430' as codigo, 'Actividades de planes de seguridad social de afiliación obligatoria' as nombre, 'nan' as descripcion, 6550 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '85' as codigo, 'Enseñanza' as nombre, 'nan' as descripcion, 6560 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '851' as codigo, 'Enseñanza preescolar y primaria' as nombre, 'nan' as descripcion, 6570 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8510' as codigo, 'Enseñanza preescolar y primaria' as nombre, 'nan' as descripcion, 6580 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '852' as codigo, 'Enseñanza secundaria' as nombre, 'nan' as descripcion, 6590 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8521' as codigo, 'Enseñanza secundaria de formación general' as nombre, 'nan' as descripcion, 6600 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8522' as codigo, 'Enseñanza secundaria de formación técnica y profesional' as nombre, 'nan' as descripcion, 6610 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '853' as codigo, 'Enseñanza superior' as nombre, 'nan' as descripcion, 6620 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8530' as codigo, 'Enseñanza superior' as nombre, 'nan' as descripcion, 6630 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '854' as codigo, 'Otros tipos de enseñanza' as nombre, 'nan' as descripcion, 6640 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8541' as codigo, 'Enseñanza deportiva y recreativa' as nombre, 'nan' as descripcion, 6650 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8542' as codigo, 'Enseñanza cultural' as nombre, 'nan' as descripcion, 6660 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8549' as codigo, 'Otros tipos de enseñanza n.c.p.' as nombre, 'nan' as descripcion, 6670 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '855' as codigo, 'Actividades de apoyo a la enseñanza' as nombre, 'nan' as descripcion, 6680 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8550' as codigo, 'Actividades de apoyo a la enseñanza' as nombre, 'nan' as descripcion, 6690 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '86' as codigo, 'Actividades de atención de la salud humana' as nombre, 'nan' as descripcion, 6700 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '861' as codigo, 'Actividades de hospitales' as nombre, 'nan' as descripcion, 6710 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8610' as codigo, 'Actividades de hospitales' as nombre, 'nan' as descripcion, 6720 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '862' as codigo, 'Actividades de médicos y odontólogos' as nombre, 'nan' as descripcion, 6730 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8620' as codigo, 'Actividades de médicos y odontólogos' as nombre, 'nan' as descripcion, 6740 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '869' as codigo, 'Otras actividades de atención de la salud humana' as nombre, 'nan' as descripcion, 6750 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8690' as codigo, 'Otras actividades de atención de la salud humana' as nombre, 'nan' as descripcion, 6760 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '87' as codigo, 'Actividades de atención en instituciones' as nombre, 'nan' as descripcion, 6770 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '871' as codigo, 'Actividades de atención de enfermería en instituciones' as nombre, 'nan' as descripcion, 6780 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8710' as codigo, 'Actividades de atención de enfermería en instituciones' as nombre, 'nan' as descripcion, 6790 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '872' as codigo, 'Actividades de atención en instituciones para personas con retraso mental, enfermos mentales y toxicómanos' as nombre, 'nan' as descripcion, 6800 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8720' as codigo, 'Actividades de atención en instituciones para personas con retraso mental, enfermos mentales y toxicómanos' as nombre, 'nan' as descripcion, 6810 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '873' as codigo, 'Actividades de atención en instituciones para personas de edad y personas con discapacidad' as nombre, 'nan' as descripcion, 6820 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8730' as codigo, 'Actividades de atención en instituciones para personas de edad y personas con discapacidad' as nombre, 'nan' as descripcion, 6830 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '879' as codigo, 'Otras actividades de atención en instituciones' as nombre, 'nan' as descripcion, 6840 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8790' as codigo, 'Otras actividades de atención en instituciones' as nombre, 'nan' as descripcion, 6850 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '88' as codigo, 'Actividades de asistencia social sin alojamiento' as nombre, 'nan' as descripcion, 6860 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '881' as codigo, 'Actividades de asistencia social sin alojamiento para personas de edad y personas con discapacidad' as nombre, 'nan' as descripcion, 6870 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8810' as codigo, 'Actividades de asistencia social sin alojamiento para personas de edad y personas con discapacidad' as nombre, 'nan' as descripcion, 6880 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '889' as codigo, 'Otras actividades de asistencia social sin alojamiento' as nombre, 'nan' as descripcion, 6890 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '8890' as codigo, 'Otras actividades de asistencia social sin alojamiento' as nombre, 'nan' as descripcion, 6900 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '90' as codigo, 'Actividades creativas, artísticas y de entretenimiento' as nombre, 'nan' as descripcion, 6910 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '900' as codigo, 'Actividades creativas, artísticas y de entretenimiento' as nombre, 'nan' as descripcion, 6920 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9000' as codigo, 'Actividades creativas, artísticas y de entretenimiento' as nombre, 'nan' as descripcion, 6930 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '91' as codigo, 'Actividades de bibliotecas, archivos y museos y otras actividades culturales' as nombre, 'nan' as descripcion, 6940 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '910' as codigo, 'Actividades de bibliotecas, archivos y museos y otras actividades culturales' as nombre, 'nan' as descripcion, 6950 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9101' as codigo, 'Actividades de bibliotecas y archivos' as nombre, 'nan' as descripcion, 6960 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9102' as codigo, 'Actividades de museos y conservación de lugares y edificios históricos' as nombre, 'nan' as descripcion, 6970 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9103' as codigo, 'Actividades de jardines botánicos y zoológicos y de reservas naturales' as nombre, 'nan' as descripcion, 6980 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '92' as codigo, 'Actividades de juegos de azar y apuestas' as nombre, 'nan' as descripcion, 6990 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '920' as codigo, 'Actividades de juegos de azar y apuestas' as nombre, 'nan' as descripcion, 7000 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9200' as codigo, 'Actividades de juegos de azar y apuestas' as nombre, 'nan' as descripcion, 7010 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '93' as codigo, 'Actividades deportivas, de esparcimiento y recreativas' as nombre, 'nan' as descripcion, 7020 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '931' as codigo, 'Actividades deportivas' as nombre, 'nan' as descripcion, 7030 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9311' as codigo, 'Gestión de instalaciones deportivas' as nombre, 'nan' as descripcion, 7040 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9312' as codigo, 'Actividades de clubes deportivos' as nombre, 'nan' as descripcion, 7050 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9319' as codigo, 'Otras actividades deportivas' as nombre, 'nan' as descripcion, 7060 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '932' as codigo, 'Otras actividades de esparcimiento y recreativas' as nombre, 'nan' as descripcion, 7070 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9321' as codigo, 'Actividades de parques de atracciones y parques temáticos' as nombre, 'nan' as descripcion, 7080 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9329' as codigo, 'Otras actividades de esparcimiento y recreativas n.c.p.' as nombre, 'nan' as descripcion, 7090 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '94' as codigo, 'Actividades de asociaciones' as nombre, 'nan' as descripcion, 7100 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '941' as codigo, 'Actividades de asociaciones empresariales, profesionales y de empleadores' as nombre, 'nan' as descripcion, 7110 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9411' as codigo, 'Actividades de asociaciones empresariales y de empleadores' as nombre, 'nan' as descripcion, 7120 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9412' as codigo, 'Actividades de asociaciones profesionales' as nombre, 'nan' as descripcion, 7130 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '942' as codigo, 'Actividades de sindicatos' as nombre, 'nan' as descripcion, 7140 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9420' as codigo, 'Actividades de sindicatos' as nombre, 'nan' as descripcion, 7150 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '949' as codigo, 'Actividades de otras asociaciones' as nombre, 'nan' as descripcion, 7160 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9491' as codigo, 'Actividades de organizaciones religiosas' as nombre, 'nan' as descripcion, 7170 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9492' as codigo, 'Actividades de organizaciones políticas' as nombre, 'nan' as descripcion, 7180 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9499' as codigo, 'Actividades de otras asociaciones n.c.p.' as nombre, 'nan' as descripcion, 7190 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '95' as codigo, 'Reparación de ordenadores y de efectos personales y enseres domésticos' as nombre, 'nan' as descripcion, 7200 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '951' as codigo, 'Reparación de ordenadores y equipo de comunicaciones' as nombre, 'nan' as descripcion, 7210 as secuencia, 'S' as activo_sn from dual
    union all
    select 'CIIU' as codigo_ref_tipo, '9511' as codigo, 'Reparación de ordenadores y equipo periférico' as nombre, 'nan' as descripcion, 7220 as secuencia, 'S' as activo_sn from dual
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