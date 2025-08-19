declare
    l_id_pais number;
    l_departamento_id number;
    l_provincia_id number;
    l_contador number;

    -- Distritos
    l_distritos varchar2(4000);

l_bagua varchar2(4000) := 'Amazonas,Bagua,Bagua,Aramango,Copallín,El Parco,Imaza,La Peca';
l_bongara varchar2(4000) := 'Amazonas,Bongará,Jumbilla,Chisquilla,Churuja,Corosha,Cuispes,Florida,Jazán,Recta ,San Carlos,Shipasbamba,Valera,Yambrasbamba';
l_chachapoyas varchar2(4000) := 'Amazonas,Chachapoyas,Chachapoyas,Asunción,Balsas,Cheto,Chiliquín,Chuquibamba,Granada,Huancas,La Jalca,Leimebamba,Levanto,Magdalena,Mariscal Castilla,Molinopampa,Montevideo,Olleros,Quinjalca,San Francisco de Daguas,San Isidro de Maino,Soloco,Sonche';
l_condorcanqui varchar2(4000) := 'Amazonas,Condorcanqui,Nieva,El Cenepa,Río Santiago';
l_luya varchar2(4000) := 'Amazonas,Luya,Lámud,Camporredondo,Cocabamba,Colcamar,Conila,Inguilpata,Longuita,Lonya Chico,Luya,Luya Viejo,María,Ocalli,Ocumal,Pisuquia,Providencia,San Cristóbal,San Francisco del Yeso,San Jerónimo,San Juan de Lopecancha,Santa Catalina,Santo Tomás,Tingo,Trita';
l_rodriguez_de_mendoza varchar2(4000) := 'Amazonas,Rodríguez de Mendoza,San Nicolás,Chirimoto,Cochamal,Huambo,Limabamba,Longar,Mariscal Benavides,Milpuc,Omia,Santa Rosa,Totora,Vista Alegre';
l_utcubamba varchar2(4000) := 'Amazonas,Utcubamba,Bagua Grande,Cajaruro,Cumba,El Milagro,Jamalca,Lonya Grande,Yamón';
l_chincheros varchar2(4000) := 'ApurÍmac,Chincheros,Ahuayro';
l_abancay varchar2(4000) := 'Apurímac,Abancay,Abancay,Chacoche,Circa,Curahuasi,Huanipaca,Lambrama,Pichirhua,San Pedro de Cachora,Tamburco';
l_andahuaylas varchar2(4000) := 'Apurímac,Andahuaylas,Andahuaylas,Andarapa,Chiara,Huancarama,Huancaray,Huayana,Kishuara,Pacobamba,Pacucha,Pampachiri,Pomacocha,San Antonio de Cachi,San Jerónimo,San Miguel de Chaccrampa,Santa María de Chicmo,Talavera,Tumay Huaraca,Turpo,Kaquiabamba,José María Arguedas';
l_antabamba varchar2(4000) := 'Apurímac,Antabamba,Antabamba,El Oro,Huaquirca,Juan Espinoza Medrano,Oropesa,Pachaconas,Sabaino';
l_aymaraes varchar2(4000) := 'Apurímac,Aymaraes,Chalhuanca,Capaya,Caraybamba,Chapimarca,Colcabamba,Cotaruse,Ihuayllo,Justo Apu Sahuaraura,Lucre,Pocohuanca,San Juan de Chacña,Sañayca,Soraya,Tapairihua,Tintay,Toraya,Yanaca';
l_chincheros varchar2(4000) := 'Apurímac,Chincheros,Chincheros,Anco-Huallo,Cocharcas,Huaccana,Ocobamba,Ongoy,Uranmarca,Ranracancha,Rocchacc,El Porvenir,Los Chankas';
l_cotabambas varchar2(4000) := 'Apurímac,Cotabambas,Tambobamba,Cotabambas,Coyllurqui,Haquira,Mara,Challhuahuacho';
l_grau varchar2(4000) := 'Apurímac,Grau,Chuquibambilla,Curpahuasi,Gamarra,Huayllati,Mamara,Micaela Bastidas,Pataypampa,Progreso,San Antonio,Santa Rosa,Turpay,Vilcabamba,Virundo,Curasco';
l_arequipa varchar2(4000) := 'Arequipa,Arequipa,Arequipa,Alto Selva Alegre,Cayma,Cerro Colorado,Characato,Chiguata,Jacobo Hunter,La Joya,Mariano Melgar,Miraflores,Mollebaya,Paucarpata,Pocsi,Polobaya,Quequeña,Sabandia,Sachaca,San Juan de Siguas,San Juan de Tarucani,Santa Isabel de Siguas,Santa Rita de Siguas,Socabaya,Tiabaya,Uchumayo,Vitor,Yanahuara,Yarabamba,Yura,José Luis Bustamante y Rivero';
l_camana varchar2(4000) := 'Arequipa,Camaná,Camaná,José María Quimper,Mariano Nicolás Valcárcel,Mariscal Cáceres,Nicolás de Piérola,Ocoña,Quilca,Samuel Pastor';
l_caraveli varchar2(4000) := 'Arequipa,Caravelí,Caravelí,Acari,Atico,Atiquipa,Bella Unión,Cahuacho,Chala,Chaparra,Huanuhuanu,Jaqui,Lomas,Quicacha,Yauca';
l_castilla varchar2(4000) := 'Arequipa,Castilla,Aplao,Andagua,Ayo,Chachas,Chilcaymarca,Choco,Huancarqui,Machaguay,Orcopampa,Pampacolca,Tipán,Uñón,Uraca,Viraco';
l_caylloma varchar2(4000) := 'Arequipa,Caylloma,Chivay,Achoma,Cabanaconde,Callalli,Caylloma,Coporaque,Huambo,Huanca,Ichupampa,Lari ,Lluta,Maca,Madrigal,San Antonio de Chuca,Sibayo,Tapay,Tisco,Tuti,Yanque,Majes';
l_condesuyos varchar2(4000) := 'Arequipa,Condesuyos,Chuquibamba,Andaray,Cayarani,Chichas,Iray,Río Grande,Salamanca,Yanaquihua';
l_islay varchar2(4000) := 'Arequipa,Islay,Mollendo,Cocachacra,Dean Valdivia,Islay,Mejía,Punta de Bombón';
l_la_union varchar2(4000) := 'Arequipa,La Unión,Cotahuasi,Alca,Charcana,Huaynacotas,Pampamarca,Puyca,Quechualla,Sayla,Tauria,Tomepampa,Toro';
l_cangallo varchar2(4000) := 'Ayacucho,Cangallo,Cangallo,Chuschi,Los Morochucos,María Parado de Bellido,Paras,Totos';
l_huamanga varchar2(4000) := 'Ayacucho,Huamanga,Ayacucho,Acocro,Acos Vinchos,Carmen Alto,Chiara,Ocros,Pacaycasa,Quinua,San José de Ticllas,San Juan Bautista,Santiago de Pischa,Socos,Tambillo,Vinchos,Jesús Nazareno,Andrés Avelino Cáceres Dorregaray';
l_huanca_sancos varchar2(4000) := 'Ayacucho,Huanca Sancos,Sancos,Carapo,Sacsamarca,Santiago de Lucanamarca';
l_huanta varchar2(4000) := 'Ayacucho,Huanta,Huanta,Ayahuanco,Huamanguilla,Iguain,Luricocha,Santillana,Sivia,Llochegua,Canayre,Uchuraccay,Pucacolpa,Chaca,Putis';
l_la_mar varchar2(4000) := 'Ayacucho,La Mar,San Miguel,Anco,Ayna,Chilcas,Chungui,Luis Carranza,Santa Rosa,Tambo,Samugari,Anchihuay,Oronccoy,Union Progreso,Rio Magdalena,Ninabamba,Patibamba';
l_lucanas varchar2(4000) := 'Ayacucho,Lucanas,Puquio,Aucara,Cabana,Carmen Salcedo,Chaviña,Chipao,Huac-Huas,Laramate,Leoncio Prado,Llauta,Lucanas,Ocaña,Otoca,Saisa,San Cristóbal,San Juan,San Pedro,San Pedro de Palco,Sancos,Santa Ana de Huaycahuacho,Santa Lucia';
l_parinacochas varchar2(4000) := 'Ayacucho,Parinacochas,Coracora,Chumpi,Coronel Castañeda,Pacapausa,Pullo,Puyusca,San Francisco de Rivacayco,Upahuacho';
l_paucar_del_sara_sara varchar2(4000) := 'Ayacucho,Paucar del Sara Sara,Pausa,Colta,Corculla,Lampa,Marcabamba,Oyolo,Pararca,San Javier de Alpabamba,San José de Ushua,Sara Sara';
l_sucre varchar2(4000) := 'Ayacucho,Sucre,Querobamba,Belén,Chalcos,Chilcayoc,Huacaña,Morcolla,Paico,San Pedro de Larcay,San Salvador de Quije,Santiago de Paucaray,Soras';
l_victor_fajardo varchar2(4000) := 'Ayacucho,Victor Fajardo,Huancapi,Alcamenca,Apongo,Asquipata,Canaria,Cayara,Colca,Huamanquiquia,Huancaraylla,Hualla,Sarhua,Vilcanchos';
l_vilcas_huaman varchar2(4000) := 'Ayacucho,Vilcas Huamán,Vilcas Huamán,Accomarca,Carhuanca,Concepción,Huambalpa,Independencia,Saurama,Vischongo';
l_cajabamba varchar2(4000) := 'Cajamarca,Cajabamba,Cajabamba,Cachachi,Condebamba,Sitacocha';
l_cajamarca varchar2(4000) := 'Cajamarca,Cajamarca,Cajamarca,Asunción,Chetilla,Cospán,Encañada,Jesús,Llacanora,Los Baños del Inca,Magdalena,Matara,Namora,San Juan';
l_celendin varchar2(4000) := 'Cajamarca,Celendín,Celendín,Chumuch,Cortegana,Huasmín,Jorge Chávez,José Gálvez,Miguel Iglesias,Oxamarca,Sorochuco,Sucre,Utco,La Libertad de Pallán';
l_chota varchar2(4000) := 'Cajamarca,Chota,Chota,Anguia,Chadin,Chiguirip,Chimbán ,Choropampa,Cochabamba,Conchán,Huambos,Lajas,Llama,Miracosta,Paccha,Pion 2/,Querocoto,San Juan de Licupis,Tacabamba,Tocmoche,Chalamarca';
l_contumaza varchar2(4000) := 'Cajamarca,Contumazá,Contumazá,Chilete,Cupisnique,Guzmango,San Benito,Santa Cruz de Toled,Tantarica,Yonán';
l_cutervo varchar2(4000) := 'Cajamarca,Cutervo,Cutervo,Callayuc,Choros,Cujillo,La Ramada,Pimpingos,Querocotillo,San Andrés de Cutervo,San Juan de Cutervo,San Luis de Lucma,Santa Cruz,Santo Domingo de La Capilla,Santo Tomás,Socota,Toribio Casanova';
l_hualgayoc varchar2(4000) := 'Cajamarca,Hualgayoc,Bambamarca,Chugur,Hualgayoc';
l_jaen varchar2(4000) := 'Cajamarca,Jaén,Jaén,Bellavista,Chontali,Colasay,Huabal,Las Pirias,Pomahuaca,Pucará,Sallique,San Felipe,San José del Alto,Santa Rosa';
l_san_ignacio varchar2(4000) := 'Cajamarca,San Ignacio,San Ignacio,Chirinos,Huarango,La Coipa,Namballe,San José de Lourdes,Tabaconas';
l_san_marcos varchar2(4000) := 'Cajamarca,San Marcos,Pedro Gálvez,Chancay,Eduardo Villanueva,Gregorio Pita,Ichocán,José Manuel Quiroz,José Sabogal';
l_san_miguel varchar2(4000) := 'Cajamarca,San Miguel,San Miguel,Bolívar,Calquis,Catilluc,El Prado,La Florida,Llapa,Nanchoc,Niepos,San Gregorio,San Silvestre de Cochán,Tongod,Unión Agua Blanca';
l_san_pablo varchar2(4000) := 'Cajamarca,San Pablo,San Pablo,San Bernardino,San Luis,Tumbadén';
l_santa_cruz varchar2(4000) := 'Cajamarca,Santa Cruz,Santa Cruz,Andabamba,Catache,Chancaybaños,La Esperanza,Ninabamba 2/,Pulán,Saucepampa,Sexi,Uticyacu,Yauyucán';
l_callao varchar2(4000) := 'Callao,Callao,Callao,Bellavista,Carmen de La Legua Reynoso,La Perla,La Punta,Ventanilla,Mi Perú';
l_acomayo varchar2(4000) := 'Cusco,Acomayo,Acomayo,Acopia,Acos,Mosoc Llacta,Pomacanchi,Rondocán,Sangarara';
l_anta varchar2(4000) := 'Cusco,Anta,Anta,Ancahuasi,Cachimayo,Chinchaypujio,Huarocondo,Limatambo,Mollepata,Pucyura,Zurite';
l_calca varchar2(4000) := 'Cusco,Calca,Calca,Coya,Lamay,Lares,Pisac,San Salvador,Taray,Yanatile';
l_canas varchar2(4000) := 'Cusco,Canas,Yanaoca,Checca,Kunturkanki,Langui,Layo,Pampamarca,Quehue,Túpac Amaru';
l_canchis varchar2(4000) := 'Cusco,Canchis,Sicuani,Checacupe,Combapata,Marangani,Pitumarca,San Pablo,San Pedro,Tinta';
l_chumbivilcas varchar2(4000) := 'Cusco,Chumbivilcas,Santo Tomás,Capacmarca,Chamaca,Colquemarca,Livitaca,Llusco,Quiñota,Velille';
l_cusco varchar2(4000) := 'Cusco,Cusco,Cusco,Ccorca,Poroy,San Jerónimo,San Sebastián,Santiago,Saylla,Wanchaq';
l_espinar varchar2(4000) := 'Cusco,Espinar,Espinar,Condoroma,Coporaque,Ocoruro,Pallpata,Pichigua,Suyckutambo,Alto Pichigua';
l_la_convencion varchar2(4000) := 'Cusco,La Convención,Santa Ana,Echarate,Huayopata,Maranura,Ocobamba,Quellouno,Kimbiri,Santa Teresa,Vilcabamba,Pichari,Inkawasi,Villa Virgen,Villa Kintiarina,Megantoni,Kumpirushiato,Cielo Punco,Manitea,Unión Ashaninka';
l_paruro varchar2(4000) := 'Cusco,Paruro,Paruro,Accha,Ccapi,Colcha,Huanoquite,Omacha,Paccaritambo,Pillpinto,Yaurisque';
l_paucartambo varchar2(4000) := 'Cusco,Paucartambo,Paucartambo,Caicay,Challabamba,Colquepata,Huancarani,Kosñipata';
l_quispicanchi varchar2(4000) := 'Cusco,Quispicanchi,Urcos,Andahuaylillas,Camanti,Ccarhuayo,Ccatca,Cusipata,Huaro,Lucre,Marcapata,Ocongate,Oropesa,Quiquijana';
l_urubamba varchar2(4000) := 'Cusco,Urubamba,Urubamba,Chinchero,Huayllabamba,Machupicchu,Maras,Ollantaytambo,Yucay';
l_acobamba varchar2(4000) := 'Huancavelica,Acobamba,Acobamba,Andabamba,Anta,Caja,Marcas,Paucara,Pomacocha,Rosario';
l_angaraes varchar2(4000) := 'Huancavelica,Angaraes,Lircay,Anchonga,Callanmarca,Ccochaccasa,Chincho,Congalla,Huanca-Huanca,Huayllay Grande,Julcamarca,San Antonio de Antaparco,Santo Tomás de Pata,Secclla';
l_castrovirreyna varchar2(4000) := 'Huancavelica,Castrovirreyna,Castrovirreyna,Arma,Aurahua,Capillas,Chupamarca,Cocas,Huachos,Huamatambo,Mollepampa,San Juan,Santa Ana,Tantara,Ticrapo';
l_churcampa varchar2(4000) := 'Huancavelica,Churcampa,Churcampa,Anco,Chinchihuasi ,El Carmen,La Merced,Locroja,Paucarbamba,San Miguel de Mayocc,San Pedro de Coris,Pachamarca,Cosme';
l_huancavelica varchar2(4000) := 'Huancavelica,Huancavelica,Huancavelica,Acobambilla,Acoria,Conayca,Cuenca,Huachocolpa,Huayllahuara,Izcuchaca,Laria,Manta,Mariscal Cáceres,Moya,Nuevo Occoro,Palca,Pilchaca,Vilca,Yauli,Ascensión,Huando';
l_huaytara varchar2(4000) := 'Huancavelica,Huaytará,Huaytará,Ayavi,Córdova,Huayacundo Arma,Laramarca,Ocoyo,Pilpichaca,Querco,Quito-Arma,San Antonio de Cusicancha,San Francisco de Sangayaico,San Isidro,Santiago de Chocorvos,Santiago de Quirahuara,Santo Domingo de Capillas,Tambo';
l_tayacaja varchar2(4000) := 'Huancavelica,Tayacaja,Pampas,Acostambo,Acraquia,Ahuaycha,Colcabamba,Daniel Hernández,Huachocolpa,Huaribamba,Ñahuimpuquio,Pazos,Quishuar,Salcabamba ,Salcahuasi,San Marcos de Rocchac,Surcubamba,Tintay Puncu,Quichuas,Andaymarca,Roble,Pichos,Santiago de Tucuma,Lambras,Cochabamba';
l_ambo varchar2(4000) := 'Huánuco,Ambo,Ambo,Cayna,Colpas,Conchamarca,Huacar,San Francisco,San Rafael,Tomay Kichwa';
l_dos_de_mayo varchar2(4000) := 'Huánuco,Dos de Mayo,La Unión,Chuquis,Marías,Pachas,Quivilla,Ripan,Shunqui,Sillapata,Yanas';
l_huacaybamba varchar2(4000) := 'Huánuco,Huacaybamba,Huacaybamba,Canchabamba,Cochabamba,Pinra';
l_huamalies varchar2(4000) := 'Huánuco,Huamalíes,Llata,Arancay,Chavín de Pariarca,Jacas Grande,Jircan,Miraflores,Monzón,Punchao,Puños,Singa,Tantamayo';
l_huanuco varchar2(4000) := 'Huánuco,Huánuco,Huánuco,Amarilis,Chinchao,Churubamba,Margos,Quisqui,San Francisco de Cayrán,San Pedro de Chaulan,Santa María del Valle,Yarumayo,Pillco Marca,Yacus,San Pablo de Pillao';
l_lauricocha varchar2(4000) := 'Huánuco,Lauricocha,Jesús,Baños,Jivia,Queropalca,Rondos,San Francisco de Asis,San Miguel de Cauri';
l_leoncio_prado varchar2(4000) := 'Huánuco,Leoncio Prado,Rupa-Rupa,Daniel Alomia Robles,Hermilio Valdizán,José Crespo y Castillo,Luyando,Mariano Damaso Beraún,Pucayacu,Castillo Grande,Pueblo Nuevo,Santo Domingo de Anda';
l_maranon varchar2(4000) := 'Huánuco,Marañon,Huacrachuco,Cholón,San Buenaventura,La Morada,Santa Rosa de Alto Yanajanca';
l_pachitea varchar2(4000) := 'Huánuco,Pachitea,Panao,Chaglla,Molino,Umari';
l_puerto_inca varchar2(4000) := 'Huánuco,Puerto Inca,Puerto Inca,Codo del Pozuzo,Honoria,Tournavista,Yuyapichis';
l_yarowilca varchar2(4000) := 'Huánuco,Yarowilca,Chavinillo,Cahuac,Chacabamba,Aparicio Pomares ,Jacas Chico,Obas,Pampamarca,Choras';
l_chincha varchar2(4000) := 'Ica,Chincha,Chincha Alta,Alto Laran,Chavín,Chincha Baja,El Carmen,Grocio Prado,Pueblo Nuevo,San Juan de Yánac,San Pedro de Huacarpana,Sunampe,Tambo de Mora';
l_ica varchar2(4000) := 'Ica,Ica,Ica,La Tinguiña,Los Aquijes,Ocucaje,Pachacútec,Parcona,Pueblo Nuevo,Salas,San José de Los Molinos,San Juan Bautista,Santiago,Subtanjalla,Tate,Yauca Del Rosario';
l_nasca varchar2(4000) := 'Ica,Nasca,Nasca,Changuillo,El Ingenio,Marcona,Vista Alegre';
l_palpa varchar2(4000) := 'Ica,Palpa,Palpa,Llipata,Río Grande,Santa Cruz,Tibillo';
l_pisco varchar2(4000) := 'Ica,Pisco,Pisco,Huancano,Humay,Independencia,Paracas,San Andrés,San Clemente,Túpac Amaru Inca';
l_chanchamayo varchar2(4000) := 'Junín,Chanchamayo,Chanchamayo,Perené,Pichanaqui,San Luis de Shuaro,San Ramón,Vitoc';
l_chupaca varchar2(4000) := 'Junín,Chupaca,Chupaca,Ahuac,Chongos Bajo,Huáchac,Huamancaca Chico,San Juan de Iscos,San Juan de Jarpa,Tres de Diciembre,Yanacancha';
l_concepcion varchar2(4000) := 'Junín,Concepción,Concepción,Aco,Andamarca,Chambará,Cochas,Comas,Heroínas Toledo,Manzanares,Mariscal Castilla,Matahuasi,Mito,Nueve de Julio,Orcotuna,San José de Quero,Santa Rosa de Ocopa';
l_huancayo varchar2(4000) := 'Junín,Huancayo,Huancayo,Carhuacallanga,Chacapampa,Chicche,Chilca,Chongos Alto,Chupuro,Colca,Cullhuas,El Tambo,Huacrapuquio,Hualhuas,Huancán,Huasicancha,Huayucachi,Ingenio,Pariahuanca,Pilcomayo,Pucará,Quichuay,Quilcas,San Agustín,San Jerónimo de Tunán,Saño,Sapallanga,Sicaya,Santo Domingo de Acobamba,Viques';
l_jauja varchar2(4000) := 'Junín,Jauja,Jauja,Acolla,Apata,Ataura,Canchayllo,Curicaca,El Mantaro,Huamalí,Huaripampa,Huertas,Janjaillo,Julcán,Leonor Ordóñez,Llocllapampa,Marco,Masma,Masma Chicche,Molinos,Monobamba,Muqui,Muquiyauyo,Paca,Paccha,Pancán,Parco,Pomacancha,Ricrán,San Lorenzo,San Pedro de Chunán,Sausa,Sincos,Tunan Marca,Yauli,Yauyos';
l_junin varchar2(4000) := 'Junín,Junín,Junín,Carhuamayo,Ondores,Ulcumayo';
l_satipo varchar2(4000) := 'Junín,Satipo,Satipo,Coviriali,Llaylla,Mazamari,Pampa Hermosa,Pangoa,Río Negro,Río Tambo,Vizcatán del Ene';
l_tarma varchar2(4000) := 'Junín,Tarma,Tarma,Acobamba,Huaricolca,Huasahuasi,La Unión,Palca,Palcamayo,San Pedro de Cajas,Tapo';
l_yauli varchar2(4000) := 'Junín,Yauli,La Oroya,Chacapalpa,Huay-Huay,Marcapomacocha,Morococha,Paccha,Santa Bárbara de Carhuacayán,Santa Rosa de Sacco,Suitucancha,Yauli';
l_ascope varchar2(4000) := 'La Libertad,Ascope,Ascope,Chicama,Chocope,Magdalena de Cao,Paiján,Rázuri,Santiago de Cao,Casa Grande';
l_bolivar varchar2(4000) := 'La Libertad,Bolívar,Bolívar,Bambamarca,Condormarca,Longotea,Uchumarca,Ucuncha';
l_chepen varchar2(4000) := 'La Libertad,Chepén,Chepén,Pacanga,Pueblo Nuevo';
l_gran_chimu varchar2(4000) := 'La Libertad,Gran Chimú,Cascas,Lucma,Marmot,Sayapullo';
l_julcan varchar2(4000) := 'La Libertad,Julcán,Julcán,Calamarca,Carabamba,Huaso';
l_otuzco varchar2(4000) := 'La Libertad,Otuzco,Otuzco,Agallpampa,Charat,Huaranchal,La Cuesta,Mache,Paranday,Salpo,Sinsicap,Usquil';
l_pacasmayo varchar2(4000) := 'La Libertad,Pacasmayo,San Pedro de Lloc,Guadalupe,Jequetepeque,Pacasmayo,San José';
l_pataz varchar2(4000) := 'La Libertad,Pataz,Tayabamba,Buldibuyo,Chillia,Huancaspata,Huaylillas,Huayo,Ongon,Parcoy,Pataz,Pias,Santiago de Challas,Taurija,Urpay';
l_santiago_de_chuco varchar2(4000) := 'La Libertad,Santiago De Chuco,Santiago De Chuco,Angasmarca,Cachicadan,Mollebamba,Mollepata,Quiruvilca,Santa Cruz de Chuca,Sitabamba';
l_sanchez_carrion varchar2(4000) := 'La Libertad,Sánchez Carrión,Huamachuco,Chugay,Cochorco,Curgos,Marcabal,Sanagoran,Sarín,Sartimbamba';
l_trujillo varchar2(4000) := 'La Libertad,Trujillo,Trujillo,El Porvenir,Florencia de Mora,Huanchaco,La Esperanza,Laredo,Moche,Poroto,Salaverry,Simbal,Victor Larco Herrera,Alto Trujillo 1/';
l_viru varchar2(4000) := 'La Libertad,Virú,Virú,Chao,Guadalupito';
l_chiclayo varchar2(4000) := 'Lambayeque,Chiclayo,Chiclayo,Chongoyape,Etén,Etén Puerto,José Leonardo Ortiz,La Victoria,Lagunas,Monsefú,Nueva Arica,Oyotun,Picsi,Pimentel,Reque,Santa Rosa,Saña,Cayaltí,Patapo,Pomalca,Pucala,Tumán';
l_ferrenafe varchar2(4000) := 'Lambayeque,Ferreñafe,Ferreñafe,Cañaris,Incahuasi,Manuel Antonio Mesones Muro,Pitipo,Pueblo Nuevo';
l_lambayeque varchar2(4000) := 'Lambayeque,Lambayeque,Lambayeque,Chochope,Illimo,Jayanca,Mochumi,Mórrope,Motupe,Olmos,Pacora,Salas,San José,Tucume';
l_barranca varchar2(4000) := 'Lima,Barranca,Barranca,Paramonga,Pativilca,Supe,Supe Puerto';
l_cajatambo varchar2(4000) := 'Lima,Cajatambo,Cajatambo,Copa,Gorgor,Huancapón,Manas';
l_canta varchar2(4000) := 'Lima,Canta,Canta,Arahuay,Huamantanga ,Huaros,Lachaqui,San Buenaventura,Santa Rosa de Quives';
l_canete varchar2(4000) := 'Lima,Cañete,San Vicente de Cañete,Asia,Calango,Cerro Azul,Chilca,Coayllo,Imperial,Lunahuana,Mala,Nuevo Imperial,Pacarán,Quilmana,San Antonio,San Luis,Santa Cruz de Flores,Zuñiga';
l_huaral varchar2(4000) := 'Lima,Huaral,Huaral,Atavillos Alto,Atavillos Bajo,Aucallama,Chancay,Ihuari,Lampián,Pacaraos,San Miguel de Acos,Santa Cruz de Andamarca,Sumbilca,Veintisiete de Noviembre';
l_huarochiri varchar2(4000) := 'Lima,Huarochirí,Matucana,Antioquía,Callahuanca,Carampoma,Chicla,Cuenca,Huachupampa,Huanza,Huarochirí,Lahuaytambo,Langa,San Pedro de Laraos,Mariatana,Ricardo Palma,San Andrés de Tupicocha,San Antonio,San Bartolomé,San Damian,San Juan de Iris,San Juan de Tantaranche,San Lorenzo de Quinti,San Mateo,San Mateo de Otao,San Pedro de Casta,San Pedro de Huancayre,Sangallaya,Santa Cruz de Cocachacra,Santa Eulalia,Santiago de Anchucaya,Santiago de Tuna,Santo Domingo de Los Olleros,Surco';
l_huaura varchar2(4000) := 'Lima,Huaura,Huacho,Ambar,Caleta de Carquín,Checras,Hualmay,Huaura,Leoncio Prado,Paccho,Santa Leonor,Santa María,Sayán,Vegueta';
l_lima varchar2(4000) := 'Lima,Lima,Lima,Ancón,Ate,Barranco,Breña,Carabayllo,Chaclacayo,Chorrillos,Cieneguilla,Comas,El Agustino,Independencia,Jesús María,La Molina,La Victoria,Lince,Los Olivos,Lurigancho,Lurín,Magdalena Del Mar,Pueblo Libre,Miraflores,Pachacámac,Pucusana,Puente Piedra,Punta Hermosa,Punta Negra,Rímac,San Bartolo,San Borja,San Isidro,San Juan de Lurigancho,San Juan de Miraflores,San Luis,San Martin de Porres,San Miguel,Santa Anita,Santa María del Mar,Santa Rosa,Santiago de Surco,Surquillo,Villa El Salvador,Villa María Del Triunfo';
l_oyon varchar2(4000) := 'Lima,Oyón,Oyón,Andajes,Caujul,Cochamarca,Naván,Pachangara';
l_yauyos varchar2(4000) := 'Lima,Yauyos,Yauyos,Alis,Allauca,Ayaviri,Azángaro,Cacra,Carania,Catahuasi,Chocos,Cochas,Colonia,Hongos,Huampara,Huancaya,Huangascar,Huantan,Huañec,Laraos,Lincha,Madean,Miraflores,Omas,Putinza,Quinches,Quinocay,San Joaquín,San Pedro de Pilas,Tanta,Tauripampa,Tomás,Tupe,Viñac,Vitis';
l_alto_amazonas varchar2(4000) := 'Loreto,Alto Amazonas,Yurimaguas,Balsapuerto,Jeberos,Lagunas,Santa Cruz,Teniente César López Rojas';
l_datem_del_maranon varchar2(4000) := 'Loreto,Datem del Marañon,Barranca,Cahuapanas,Manseriche,Morona,Pastaza,Andoas';
l_loreto varchar2(4000) := 'Loreto,Loreto,Nauta,Parinari,Tigre,Trompeteros,Urarinas';
l_mariscal_ramon_castilla varchar2(4000) := 'Loreto,Mariscal Ramón Castilla,Ramón Castilla,Pebas,Yavari,San Pablo';
l_maynas varchar2(4000) := 'Loreto,Maynas,Iquitos,Alto Nanay,Fernando Lores,Indiana,Las Amazonas,Mazan,Napo,Punchana,Torres Causana,Belén,San Juan Bautista';
l_putumayo varchar2(4000) := 'Loreto,Putumayo,Putumayo,Rosa Panduro,Teniente Manuel Clavero,Yaguas';
l_requena varchar2(4000) := 'Loreto,Requena,Requena,Alto Tapiche,Capelo,Emilio San Martín,Maquia,Puinahua,Saquena,Soplin,Tapiche,Jenaro Herrera,Yaquerana';
l_ucayali varchar2(4000) := 'Loreto,Ucayali,Contamana,Inahuaya,Padre Márquez,Pampa Hermosa,Sarayacu,Vargas Guerra';
l_manu varchar2(4000) := 'Madre de Dios,Manu,Manu,Fitzcarrald,Madre de Dios,Huepetuhe';
l_tahuamanu varchar2(4000) := 'Madre de Dios,Tahuamanu,Iñapari,Iberia,Tahuamanu';
l_tambopata varchar2(4000) := 'Madre de Dios,Tambopata,Tambopata,Inambari,Las Piedras,Laberinto';
l_general_sanchez_cerro varchar2(4000) := 'Moquegua,General Sánchez Cerro,Omate,Chojata,Coalaque,Ichuña,La Capilla,Lloque,Matalaque,Puquina,Quinistaquillas,Ubinas,Yunga';
l_ilo varchar2(4000) := 'Moquegua,Ilo,Ilo,El Algarrobal,Pacocha';
l_mariscal_nieto varchar2(4000) := 'Moquegua,Mariscal Nieto,Moquegua,Carumas,Cuchumbaya,Samegua,San Cristóbal,Torata,San Antonio';
l_daniel_alcides_carrion varchar2(4000) := 'Pasco,Daniel Alcides Carrión,Yanahuanca,Chacayan,Goyllarisquizga,Paucar,San Pedro de Pillao,Santa Ana de Tusi,Tapuc,Vilcabamba';
l_oxapampa varchar2(4000) := 'Pasco,Oxapampa,Oxapampa,Chontabamba,Huancabamba,Palcazu,Pozuzo,Puerto Bermúdez,Villa Rica,Constitución';
l_pasco varchar2(4000) := 'Pasco,Pasco,Chaupimarca,Huachón,Huariaca,Huayllay,Ninacaca,Pallanchacra,Paucartambo,San Francisco de Asís de Yarusyacán,Simón Bolívar,Ticlacayan,Tinyahuarco,Vicco,Yanacancha';
l_ayabaca varchar2(4000) := 'Piura,Ayabaca,Ayabaca,Frías,Jilili,Lagunas,Montero,Pacaipampa,Paimas,Sapillica,Sicchez,Suyo';
l_huancabamba varchar2(4000) := 'Piura,Huancabamba,Huancabamba,Canchaque,El Carmen de La Frontera,Huarmaca,Lalaquiz,San Miguel de El Faique,Sondor,Sondorillo';
l_morropon varchar2(4000) := 'Piura,Morropón,Chulucanas,Buenos Aires,Chalaco,La Matanza,Morropón,Salitral,San Juan de Bigote,Santa Catalina de Mossa,Santo Domingo,Yamango';
l_paita varchar2(4000) := 'Piura,Paita,Paita,Amotape,Arenal,Colan,La Huaca,Tamarindo,Vichayal';
l_piura varchar2(4000) := 'Piura,Piura,Piura,Castilla,Catacaos,Cura Mori,El Tallán,La Arena,La Unión,Las Lomas,Tambo Grande,Veintiséis de Octubre';
l_sechura varchar2(4000) := 'Piura,Sechura,Sechura,Bellavista de La Unión,Bernal,Cristo Nos Valga,Vice,Rinconada Llicuar';
l_sullana varchar2(4000) := 'Piura,Sullana,Sullana,Bellavista,Ignacio Escudero,Lancones,Marcavelica,Miguel Checa,Querecotillo,Salitral';
l_talara varchar2(4000) := 'Piura,Talara,Pariñas,El Alto,La Brea,Lobitos,Los Órganos,Máncora';
l_azangaro varchar2(4000) := 'Puno,Azángaro,Azángaro,Achaya,Arapa,Asillo,Caminaca,Chupa,José Domingo Choquehuanca,Muñani,Potoni,Saman,San Antón,San José,San Juan de Salinas,Santiago de Pupuja,Tirapata';
l_carabaya varchar2(4000) := 'Puno,Carabaya,Macusani,Ajoyani,Ayapata,Coasa,Corani,Crucero,Ituata,Ollachea,San Gabán,Usicayos';
l_chucuito varchar2(4000) := 'Puno,Chucuito,Juli,Desaguadero,Huacullani,Kelluyo,Pisacoma,Pomata,Zepita';
l_el_collao varchar2(4000) := 'Puno,El Collao,Ilave,Capazo,Pilcuyo,Santa Rosa,Conduriri';
l_huancane varchar2(4000) := 'Puno,Huancané,Huancané,Cojata,Huatasani,Inchupalla,Pusi,Rosaspata,Taraco,Vilque Chico';
l_lampa varchar2(4000) := 'Puno,Lampa,Lampa,Cabanilla,Calapuja,Nicasio,Ocuviri,Palca,Paratia,Pucará,Santa Lucía,Vilavila';
l_melgar varchar2(4000) := 'Puno,Melgar,Ayaviri,Antauta,Cupi,Llalli,Macari,Nuñoa,Orurillo,Santa Rosa,Umachiri';
l_moho varchar2(4000) := 'Puno,Moho,Moho,Conima,Huayrapata,Tilali';
l_puno varchar2(4000) := 'Puno,Puno,Puno,Acora,Amantani,Atuncolla,Capachica,Chucuito,Coata,Huata,Mañazo,Paucarcolla,Pichacani,Platería,San Antonio,Tiquillaca,Vilque';
l_san_antonio_de_putina varchar2(4000) := 'Puno,San Antonio De Putina,Putina,Ananea,Pedro Vilca Apaza,Quilcapuncu,Sina';
l_san_roman varchar2(4000) := 'Puno,San Román,Juliaca,Cabana,Cabanillas,Caracoto,San Miguel';
l_sandia varchar2(4000) := 'Puno,Sandia,Sandia,Cuyocuyo,Limbani,Patambuco,Phara,Quiaca,San Juan del Oro,Yanahuaya,Alto Inambari,San Pedro de Putina Punco';
l_yunguyo varchar2(4000) := 'Puno,Yunguyo,Yunguyo,Anapia,Copani,Cuturapi,Ollaraya,Tinicachi,Unicachi';
l_tocache varchar2(4000) := 'San MartÍn,Tocache,Santa Lucia';
l_bellavista varchar2(4000) := 'San Martín,Bellavista,Bellavista,Alto Biavo,Bajo Biavo,Huallaga,San Pablo,San Rafael';
l_el_dorado varchar2(4000) := 'San Martín,El Dorado,San José de Sisa,Agua Blanca,San Martín,Santa Rosa,Shatoja';
l_huallaga varchar2(4000) := 'San Martín,Huallaga,Saposoa,Alto Saposoa,El Eslabón,Piscoyacu,Sacanche,Tingo de Saposoa';
l_lamas varchar2(4000) := 'San Martín,Lamas,Lamas,Alonso de Alvarado,Barranquita,Caynarachi,Cuñumbuqui,Pinto Recodo,Rumisapa,San Roque de Cumbaza,Shanao,Tabalosos,Zapatero';
l_mariscal_caceres varchar2(4000) := 'San Martín,Mariscal Cáceres,Juanjuí,Campanilla,Huicungo,Pachiza,Pajarillo';
l_moyobamba varchar2(4000) := 'San Martín,Moyobamba,Moyobamba,Calzada,Habana,Jepelacio,Soritor,Yantalo';
l_picota varchar2(4000) := 'San Martín,Picota,Picota,Buenos Aires,Caspisapa,Pilluana,Pucacaca,San Cristóbal,San Hilarión,Shamboyacu,Tingo de Ponasa,Tres Unidos';
l_rioja varchar2(4000) := 'San Martín,Rioja,Rioja,Awajun,Elias Soplín Vargas,Nueva Cajamarca,Pardo Miguel,Posic,San Fernando,Yorongos,Yuracyacu';
l_san_martin varchar2(4000) := 'San Martín,San Martín,Tarapoto,Alberto Leveau,Cacatachi,Chazuta,Chipurana,El Porvenir,Huimbayoc,Juan Guerra,La Banda de Shilcayo,Morales,Papaplaya,San Antonio,Sauce,Shapaja';
l_tocache varchar2(4000) := 'San Martín,Tocache,Tocache,Nuevo Progreso,Pólvora,Shunte,Uchiza';
l_candarave varchar2(4000) := 'Tacna,Candarave,Candarave,Cairani,Camilaca,Curibaya,Huanuara,Quilahuani';
l_jorge_basadre varchar2(4000) := 'Tacna,Jorge Basadre,Locumba,Ilabaya,Ite';
l_tacna varchar2(4000) := 'Tacna,Tacna,Tacna,Alto de La Alianza,Calana,Ciudad Nueva,Inclán,Pachia,Palca,Pocollay,Sama,Coronel Gregorio Albarracin Lanchipa,La Yarada los Palos';
l_tarata varchar2(4000) := 'Tacna,Tarata,Tarata,Héroes Albarracín,Estique,Estique-Pampa,Sitajara,Susapaya,Tarucachi,Ticaco';
l_contralmirante_villar varchar2(4000) := 'Tumbes,Contralmirante Villar,Zorritos,Casitas,Canoas de Punta Sal';
l_tumbes varchar2(4000) := 'Tumbes,Tumbes,Tumbes,Corrales,La Cruz,Pampas de Hospital,San Jacinto,San Juan de La Virgen';
l_zarumilla varchar2(4000) := 'Tumbes,Zarumilla,Zarumilla,Aguas Verdes,Matapalo,Papayal';
l_atalaya varchar2(4000) := 'Ucayali,Atalaya,Raimondi,Sepahua,Tahuania,Yurua';
l_coronel_portillo varchar2(4000) := 'Ucayali,Coronel Portillo,Calleria,Campoverde,Iparia,Masisea,Yarinacocha,Nueva Requena,Manantay';
l_padre_abad varchar2(4000) := 'Ucayali,Padre Abad,Padre Abad,Irazola,Curimaná,Neshuya,Alexander Von Humboldt,Huipoca,Boqueron';
l_purus varchar2(4000) := 'Ucayali,Purús,Purús';
l_aija varchar2(4000) := 'Áncash,Aija,Aija,Coris,Huacllán,La Merced,Succha';
l_antonio_raymondi varchar2(4000) := 'Áncash,Antonio Raymondi,Llamellín,Aczo,Chaccho,Chingas,Mirgas,San Juan de Rontoy';
l_asuncion varchar2(4000) := 'Áncash,Asunción,Chacas,Acochaca';
l_bolognesi varchar2(4000) := 'Áncash,Bolognesi,Chiquián,Abelardo Pardo Lezameta,Antonio Raymondi,Aquia,Cajacay,Canis ,Colquioc,Huallanca,Huasta,Huayllacayán,La Primavera,Mangas,Pacllón,San Miguel de Corpanqui,Ticllos';
l_carhuaz varchar2(4000) := 'Áncash,Carhuaz,Carhuaz,Acopampa,Amashca,Anta,Ataquero,Marcará,Pariahuanca,San Miguel de Aco,Shilla,Tinco,Yungar';
l_carlos_fermin_fitzcarrald varchar2(4000) := 'Áncash,Carlos Fermin Fitzcarrald,San Luis,San Nicolás,Yauya';
l_casma varchar2(4000) := 'Áncash,Casma,Casma,Buena Vista Alta,Comandante Noél,Yaután';
l_corongo varchar2(4000) := 'Áncash,Corongo,Corongo,Aco ,Bambas,Cusca,La Pampa,Yánac,Yupán';
l_huaraz varchar2(4000) := 'Áncash,Huaraz,Huaraz,Cochabamba,Colcabamba,Huanchay,Independencia,Jangas,La Libertad,Olleros,Pampas Grande,Pariacoto,Pira,Tarica';
l_huari varchar2(4000) := 'Áncash,Huari,Huari,Anra,Cajay,Chavín de Huántar,Huacachi,Huacchis,Huachis,Huántar,Masín,Paucas,Ponto,Rahuapampa,Rapayan,San Marcos,San Pedro de Chana,Uco';
l_huarmey varchar2(4000) := 'Áncash,Huarmey,Huarmey,Cochapeti,Culebras,Huayán,Malvas';
l_huaylas varchar2(4000) := 'Áncash,Huaylas,Caraz,Huallanca,Huata,Huaylas,Mato,Pamparomás,Pueblo Libre,Santa Cruz,Santo Toribio,Yuracmarca';
l_mariscal_luzuriaga varchar2(4000) := 'Áncash,Mariscal Luzuriaga,Piscobamba,Casca,Eleazar Guzmán Barrón,Fidel Olivas Escudero,Llama,Llumpa,Lucma,Musga';
l_ocros varchar2(4000) := 'Áncash,Ocros,Ocros,Acas,Cajamarquilla,Carhuapampa,Cochas,Congas,Llipa,San Cristóbal de Raján,San Pedro,Santiago de Chilcas';
l_pallasca varchar2(4000) := 'Áncash,Pallasca,Cabana,Bolognesi,Conchucos,Huacaschuque,Huandoval,Lacabamba,Llapo,Pallasca,Pampas,Santa Rosa,Tauca';
l_pomabamba varchar2(4000) := 'Áncash,Pomabamba,Pomabamba,Huayllán,Parobamba,Quinuabamba';
l_recuay varchar2(4000) := 'Áncash,Recuay,Recuay,Cátac,Cotaparaco,Huayllapampa,Llacllin,Marca,Pampas Chico,Pararín,Tapacocha,Ticapampa';
l_santa varchar2(4000) := 'Áncash,Santa,Chimbote,Cáceres del Perú,Coishco,Macate,Moro,Nepeña,Samanco,Santa,Nuevo Chimbote';
l_sihuas varchar2(4000) := 'Áncash,Sihuas,Sihuas,Acobamba,Alfonso Ugarte,Cashapampa,Chingalpo,Huayllabamba,Quiches,Ragash,San Juan,Sicsibamba';
l_yungay varchar2(4000) := 'Áncash,Yungay,Yungay,Cascapara,Mancos,Matacoto,Quillo,Ranrahirca,Shupluy,Yanama';

    l_tipo_rc varchar2(4000) := 'DIST';
    l_nivel number := 3;
    l_activo_sn varchar2(1) := 'S';

begin
    select id_pais
      into l_id_pais
      from bko_pais
     where nombre = 'Perú';

    l_distritos := l_chachapoyas || ':' || l_bagua || ':' || l_bongara || ':' || l_condorcanqui || ':' || l_luya || ':' || l_rodriguez_de_mendoza || ':' || l_utcubamba || ':' || l_huaraz || ':' || l_aija || ':' || l_antonio_raymondi || ':' || l_asuncion || ':' || l_bolognesi || ':' || l_carhuaz || ':' || l_carlos_fermin_fitzcarrald || ':' || l_casma || ':' || l_corongo || ':' || l_huari || ':' || l_huarmey || ':' || l_huaylas || ':' || l_mariscal_luzuriaga || ':' || l_ocros || ':' || l_pallasca || ':' || l_pomabamba || ':' || l_recuay || ':' || l_santa || ':' || l_sihuas || ':' || l_yungay || ':' || l_abancay || ':' || l_andahuaylas || ':' || l_antabamba || ':' || l_aymaraes || ':' || l_cotabambas || ':' || l_chincheros || ':' || l_grau || ':' || l_arequipa || ':' || l_camana || ':' || l_caraveli || ':' || l_castilla || ':' || l_caylloma || ':' || l_condesuyos || ':' || l_islay || ':' || l_la_union || ':' || l_huamanga || ':' || l_cangallo || ':' || l_huanca_sancos || ':' || l_huanta || ':' || l_la_mar || ':' || l_lucanas || ':' || l_parinacochas || ':' || l_paucar_del_sara_sara || ':' || l_sucre || ':' || l_victor_fajardo || ':' || l_vilcas_huaman || ':' || l_cajamarca || ':' || l_cajabamba || ':' || l_celendin || ':' || l_chota || ':' || l_contumaza || ':' || l_cutervo || ':' || l_hualgayoc || ':' || l_jaen || ':' || l_san_ignacio || ':' || l_san_marcos || ':' || l_san_miguel || ':' || l_san_pablo || ':' || l_santa_cruz || ':' || l_callao || ':' || l_cusco || ':' || l_acomayo || ':' || l_anta || ':' || l_calca || ':' || l_canas || ':' || l_canchis || ':' || l_chumbivilcas || ':' || l_espinar || ':' || l_la_convencion || ':' || l_paruro || ':' || l_paucartambo || ':' || l_quispicanchi || ':' || l_urubamba || ':' || l_huancavelica || ':' || l_acobamba || ':' || l_angaraes || ':' || l_castrovirreyna || ':' || l_churcampa || ':' || l_huaytara || ':' || l_tayacaja || ':' || l_huanuco || ':' || l_ambo || ':' || l_dos_de_mayo || ':' || l_huacaybamba || ':' || l_huamalies || ':' || l_leoncio_prado || ':' || l_maranon || ':' || l_pachitea || ':' || l_puerto_inca || ':' || l_lauricocha || ':' || l_yarowilca || ':' || l_ica || ':' || l_chincha || ':' || l_nasca || ':' || l_palpa || ':' || l_pisco || ':' || l_huancayo || ':' || l_concepcion || ':' || l_chanchamayo || ':' || l_jauja || ':' || l_junin || ':' || l_satipo || ':' || l_tarma || ':' || l_yauli || ':' || l_chupaca || ':' || l_trujillo || ':' || l_ascope || ':' || l_bolivar || ':' || l_chepen || ':' || l_julcan || ':' || l_otuzco || ':' || l_pacasmayo || ':' || l_pataz || ':' || l_sanchez_carrion || ':' || l_santiago_de_chuco || ':' || l_gran_chimu || ':' || l_viru || ':' || l_chiclayo || ':' || l_ferrenafe || ':' || l_lambayeque || ':' || l_lima || ':' || l_barranca || ':' || l_cajatambo || ':' || l_canta || ':' || l_canete || ':' || l_huaral || ':' || l_huarochiri || ':' || l_huaura || ':' || l_oyon || ':' || l_yauyos || ':' || l_maynas || ':' || l_alto_amazonas || ':' || l_loreto || ':' || l_mariscal_ramon_castilla || ':' || l_requena || ':' || l_ucayali || ':' || l_datem_del_maranon || ':' || l_putumayo || ':' || l_tambopata || ':' || l_manu || ':' || l_tahuamanu || ':' || l_mariscal_nieto || ':' || l_general_sanchez_cerro || ':' || l_ilo || ':' || l_pasco || ':' || l_daniel_alcides_carrion || ':' || l_oxapampa || ':' || l_piura || ':' || l_ayabaca || ':' || l_huancabamba || ':' || l_morropon || ':' || l_paita || ':' || l_sullana || ':' || l_talara || ':' || l_sechura || ':' || l_puno || ':' || l_azangaro || ':' || l_carabaya || ':' || l_chucuito || ':' || l_el_collao || ':' || l_huancane || ':' || l_lampa || ':' || l_melgar || ':' || l_moho || ':' || l_san_antonio_de_putina || ':' || l_san_roman || ':' || l_sandia || ':' || l_yunguyo || ':' || l_moyobamba || ':' || l_bellavista || ':' || l_el_dorado || ':' || l_huallaga || ':' || l_lamas || ':' || l_mariscal_caceres || ':' || l_picota || ':' || l_rioja || ':' || l_san_martin || ':' || l_tocache || ':' || l_tacna || ':' || l_candarave || ':' || l_jorge_basadre || ':' || l_tarata || ':' || l_tumbes || ':' || l_contralmirante_villar || ':' || l_zarumilla || ':' || l_coronel_portillo || ':' || l_atalaya || ':' || l_padre_abad || ':' || l_purus;

    for provincia in (select column_value as distrito_list from table(apex_string.split(l_distritos, ':'))) loop
        l_contador := 0;
        declare
            v_departamento varchar2(200);
            v_provincia varchar2(200);
        begin
            for distrito in (select column_value as nombre from table(apex_string.split(provincia.distrito_list, ','))) loop
                l_contador := l_contador + 1;
                if l_contador = 1 then
                    v_departamento := distrito.nombre;
                    select id_subdivision
                      into l_departamento_id
                      from bko_subdivision_geografica
                     where upper(nombre) = upper(distrito.nombre)
                       and nivel = 1;
                elsif l_contador = 2 then
                    v_provincia := distrito.nombre;
                    select id_subdivision
                      into l_provincia_id
                      from bko_subdivision_geografica
                     where upper(nombre) = upper(distrito.nombre)
                       and id_subdivision_padre = l_departamento_id
                       and nivel = 2;
                else
                    merge into bko_subdivision_geografica x
                    using (select l_id_pais as id_pais
                                , l_provincia_id as id_subdivision_padre
                                , distrito.nombre as nombre
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
        end;
    end loop;

    commit;
end;