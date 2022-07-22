class AgregaTipomunMunicipio < ActiveRecord::Migration[7.0]

  def up
    add_column :sip_municipio, :tipomun, :string, limit: 32
    execute <<-SQL
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=458; -- EL ZULIA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1384; -- VICTORIA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=904; -- PAZ DE RÍO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1339; -- TOTORÓ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=726; -- ARENAL / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=744; -- MÁLAGA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=409; -- DUITAMA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=660; -- LA PAZ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=734; -- MACHETÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=54; -- TUNJA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=738; -- LA VICTORIA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=370; -- COLÓN / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1127; -- SAN JOSÉ DE MIRANDA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=505; -- GACHETÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1250; -- PAPUNAHUA / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1032; -- RISARALDA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1306; -- TEORAMA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1060; -- SALAMINA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=195; -- CAPITANEJO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=823; -- OCAÑA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=439; -- EL LITORAL DEL SAN JUAN / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1103; -- SANTA CATALINA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=909; -- PENSILVANIA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=944; -- PUEBLO NUEVO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=623; -- JARDÍN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=549; -- GIRARDOTA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1091; -- ATACO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=278; -- CHINÚ / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=876; -- PAJARITO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=385; -- CUCUNUBÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1059; -- SAN FRANCISCO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1100; -- SAN BENITO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1277; -- TARSO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=368; -- COYAIMA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1138; -- SANTA ROSA DEL SUR / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=728; -- LA JAGUA DEL PILAR / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=382; -- CUCUTILLA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1023; -- RICAURTE / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1423; -- YONDÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=608; -- HISPANIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1210; -- BAHÍA SOLANO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=490; -- FUENTE DE ORO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1108; -- SANTA LUCÍA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=452; -- EL TABLÓN DE GÓMEZ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=596; -- HATO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1397; -- VILLA DEL ROSARIO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1399; -- VILLETA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=940; -- PUERTO ASÍS / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1264; -- TABIO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=818; -- NECHÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1104; -- SAN VICENTE FERRER / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=266; -- CHIRIGUANÁ / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=403; -- DABEIBA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=577; -- GUAPOTÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1090; -- SAN ANDRÉS / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=358; -- COPACABANA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=425; -- EL COLEGIO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=581; -- GUATAQUÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1260; -- TALAIGUA NUEVO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=280; -- CHOCONTÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=463; -- GUARANDA / SUCRE
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1406; -- SAN FELIPE / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1391; -- VILLAVIEJA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=357; -- CONTRATACIÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=625; -- JERICÓ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1404; -- BELLO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1195; -- SESQUILÉ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=646; -- LA ESTRELLA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1341; -- BELÉN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1049; -- SALGAR / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=588; -- GUAYABAL DE SÍQUIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1409; -- VILLAGARZÓN / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1069; -- SAN JUAN DE URABÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1187; -- SANTA HELENA DEL OPÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=979; -- QUETAME / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1076; -- SAN LUIS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1270; -- BARBACOAS / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1380; -- VERSALLES / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=963; -- PUERTO LIBERTADOR / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=750; -- MANTA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1422; -- YUMBO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=380; -- CUBARRAL / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1387; -- VILLAHERMOSA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1314; -- TIMANÁ / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=821; -- OBANDO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1012; -- RÍO QUITO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=733; -- MEDIO ATRATO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=254; -- CHIVOLO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=975; -- PUERTO RONDÓN / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1358; -- ULLOA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1017; -- REPELÓN / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1326; -- TUCHÍN / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=534; -- ALGARROBO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1281; -- TESALIA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=560; -- GUACHETÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=632; -- JUNÍN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=901; -- PÁRAMO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=886; -- PALMITO / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=454; -- ALVARADO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=402; -- EL ROBLE / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1372; -- BELMIRA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=136; -- CABUYARO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1375; -- VENADILLO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=948; -- PUENTE NACIONAL / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=177; -- MANÍ / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=406; -- CHIVOR / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=487; -- FRESNO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=449; -- EL TAMBO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1013; -- RÁQUIRA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1323; -- UNIÓN PANAMERICANA / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=497; -- FUSAGASUGÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=947; -- PUEBLO RICO / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=431; -- EL GUAMO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1362; -- URRAO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1139; -- SAN MARTÍN / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=52; -- SANTA MARTA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=57; -- VILLAVICENCIO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=950; -- PUERTO SALGAR / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=574; -- GUAITARILLA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=972; -- PURÍSIMA DE LA CONCEPCIÓN / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1148; -- SAN PEDRO DE CARTAGO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1065; -- SAN JERÓNIMO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=38; -- MEDELLÍN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1240; -- SUAITA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=80; -- BOLÍVAR / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=443; -- PAZ DE ARIPORO / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=902; -- PASCA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1038; -- ROLDANILLO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=747; -- MANZANARES / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=424; -- EL CARMEN / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=603; -- ANAPOIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1252; -- SUPÍA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=24; -- BOGOTÁ, D.C. / BOGOTÁ, D.C.
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=896; -- PUERTO ALEGRÍA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=143; -- CALIMA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=701; -- LA UVITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=602; -- ALBANIA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=935; -- POTOSÍ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1097; -- SAN ROQUE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1342; -- TUBARÁ / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=557; -- GUADALUPE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=377; -- CRAVO NORTE / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=810; -- NIMAIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=558; -- SÁCAMA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=654; -- LA MERCED / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=535; -- ALTOS DEL ROSARIO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=478; -- FLORIDA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1345; -- SAN ANDRÉS DE TUMACO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=855; -- ORTEGA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=614; -- ANCUYA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1014; -- RÍO VIEJO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=624; -- JENESANO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=53; -- SINCELEJO / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=216; -- CASTILLA LA NUEVA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=489; -- FUNZA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=106; -- BARRANCA DE UPÍA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=49; -- RIOHACHA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=761; -- SAN SEBASTIÁN DE MARIQUITA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1280; -- TENA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=420; -- ELÍAS / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=222; -- CAUCASIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1257; -- BARRANCAS / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=410; -- EL COPEY / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=959; -- PUEBLORRICO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=721; -- LOS SANTOS / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=796; -- MURINDÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1410; -- YACOPÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=480; -- FLORIDABLANCA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1336; -- SAN JOSÉ DE TOLUVIEJO / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=766; -- APARTADÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=476; -- FIRAVITOBA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1217; -- SAN FRANCISCO / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1086; -- SAN MARTÍN DE LOBA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1401; -- VIOTÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=175; -- CAMPO DE LA CRUZ / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1113; -- SAN CARLOS / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=359; -- COPER / BOYACÁ
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1282; -- TARAPACÁ / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=279; -- CHITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1312; -- TIBIRITA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=848; -- ATRATO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1066; -- SAN JUAN NEPOMUCENO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=547; -- GIRARDOT / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1415; -- PANA PANA / GUAINÍA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1089; -- PUERTO SANTANDER / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=877; -- PAMPLONA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=539; -- FORTUL / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=610; -- INZÁ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=746; -- MALAMBO / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=342; -- COLOMBIA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=717; -- LLORÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=465; -- ENVIGADO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=241; -- CHARALÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=568; -- GUÁTICA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1122; -- SAN JOSÉ DE URÉ / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=803; -- NARIÑO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=333; -- COELLO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=967; -- RÍO IRÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1356; -- ÚMBITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=873; -- PÁEZ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=482; -- FÓMEQUE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=851; -- OICATÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1118; -- SAN CARLOS DE GUAROA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=563; -- GUACARÍ / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=223; -- AIPE / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=952; -- PUERTO COLOMBIA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=408; -- DONMATÍAS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=635; -- LA BELLEZA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=491; -- FUNES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=132; -- CÁCERES / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1392; -- VIGÍA DEL FUERTE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=709; -- VILLA DE LEYVA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=716; -- LÍBANO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=85; -- BUCARASICA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=689; -- ANOLAIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1121; -- SAN JOAQUÍN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1053; -- SAN ESTANISLAO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=545; -- GINEBRA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=899; -- PAYA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=714; -- LIBORINA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=711; -- ANSERMANUEVO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=138; -- CAJAMARCA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=931; -- PLATO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1141; -- SALENTO / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1088; -- SAN AGUSTÍN / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=536; -- AMAGÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=537; -- AMBALEMA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=787; -- SANTA CRUZ DE MOMPOX / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1276; -- TARQUI / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=200; -- EL CARMEN DE VIBORAL / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=797; -- MOTAVITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1258; -- SURATÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=958; -- PUERTO WILCHES / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1370; -- VALPARAÍSO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1180; -- SAN MARCOS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1047; -- SABANALARGA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1247; -- SUCRE / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1369; -- VALLE DE SAN JOSÉ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=932; -- POLONUEVO / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=169; -- CAMPOALEGRE / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1402; -- VIRACACHÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1232; -- SOPETRÁN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1225; -- SOPÓ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=215; -- CARTAGENA DEL CHAIRÁ / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1042; -- SANTA ROSALÍA / VICHADA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1262; -- SOLITA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=341; -- CURILLO / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=802; -- NARIÑO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=774; -- MISTRATÓ / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1075; -- SAN JOSÉ DEL PALMAR / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=710; -- LÉRIDA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1455; -- BETÉITIVA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=404; -- EL CARMEN DE CHUCURÍ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=636; -- LA CALERA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1274; -- TARAZÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=752; -- ANZÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=32; -- SAN JOSÉ DE CÚCUTA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1418; -- YAVARATÉ / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1226; -- SOGAMOSO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=612; -- ÍQUIRA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=875; -- PAIME / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=961; -- PUERTO BERRÍO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=391; -- CURUMANÍ / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=620; -- IZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=960; -- PUERTO LLERAS / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1181; -- SAN ALBERTO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=389; -- CUÍTIVA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=703; -- LA CHORRERA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=977; -- PUERTO RICO / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1115; -- SAN GIL / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=820; -- NUQUÍ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1363; -- USIACURÍ / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=865; -- PACHAVITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=589; -- MESETAS / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=381; -- CUBARÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=986; -- ACACÍAS / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=604; -- LA APARTADA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=456; -- EL ROSAL / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=131; -- CABRERA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1015; -- REMEDIOS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1016; -- REMOLINO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=943; -- PUEBLO BELLO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=503; -- GALÁN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1203; -- SILVIA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1037; -- RONDÓN / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=928; -- PUERTO SANTANDER / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1044; -- SABANETA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=78; -- BOLÍVAR / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=238; -- CERINZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1215; -- SOATÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1245; -- SUESCA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=39; -- MITÚ / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=297; -- CIRCASIA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1413; -- YALÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=580; -- GUALMATÁN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1248; -- SUSACÓN / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=336; -- COLÓN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1332; -- TONA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=917; -- PIJAO / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=864; -- ARCABUCO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1255; -- BARANOA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=570; -- GUAMO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=573; -- GUADUAS / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=858; -- OTANCHE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1221; -- SONSÓN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1366; -- VALLE DE SAN JUAN / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1140; -- SAN VICENTE DE CHUCURÍ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1427; -- ZARZAL / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=936; -- PRADERA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=812; -- NOROSÍ / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1093; -- SAN ANDRÉS DE SOTAVENTO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=762; -- MARQUETALIA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=856; -- OSPINA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1230; -- SOTARÁ PAISPAMBA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=343; -- CONCEPCIÓN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1028; -- RIOSUCIO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1085; -- SAN LUIS DE GACENO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=626; -- JERICÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=732; -- MACEO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=903; -- PUERTO ARICA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=483; -- RECETOR / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=618; -- ISTMINA / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=694; -- LA UNIÓN / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1191; -- SATIVASUR / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=110; -- EL MOLINO / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=860; -- ARATOCA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=466; -- EL PEÑÓN / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1024; -- RIOSUCIO / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1213; -- SAN DIEGO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1062; -- SAN JACINTO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=194; -- CARAMANTA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=782; -- MONGUA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=650; -- LA ESPERANZA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=914; -- PIEDECUESTA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=630; -- URIBE / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1452; -- DIBULLA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=340; -- CONDOTO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=193; -- CARACOLÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=296; -- CIMITARRA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=506; -- GARZÓN / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1329; -- TOLEDO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1407; -- PUERTO COLOMBIA / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=51; -- SAN JOSÉ DEL GUAVIARE / GUAVIARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=949; -- PUERTO BOYACÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=587; -- GÜEPSA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1273; -- BUENAVISTA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=507; -- GÁMBITA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1102; -- SAN MATEO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=34; -- IBAGUÉ / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=984; -- RAGONVALIA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=338; -- CÓMBITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=772; -- MIRAFLORES / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=849; -- MOÑITOS / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=591; -- GUAYABETAL / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=819; -- NORCASIA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1229; -- SOPLAVIENTO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=492; -- FUNDACIÓN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=559; -- GUACAMAYAS / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=786; -- MOLAGAVITA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=751; -- MEDINA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=147; -- AGUADA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=801; -- MUZO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=436; -- EL BAGRE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=775; -- MONTECRISTO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1204; -- SIMITÍ / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=578; -- GUASCA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=955; -- PUERTO PARRA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1071; -- SAHAGÚN / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=800; -- MUTISCUA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1128; -- SAN BERNARDO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=951; -- PUERRES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1450; -- BERBEO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=934; -- PONEDERA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=964; -- PULÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=962; -- ARIGUANÍ / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1222; -- SAN MIGUEL / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1368; -- VALENCIA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1269; -- TÁMESIS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1116; -- SANTA BÁRBARA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1050; -- SAN ANTONIO DEL TEQUENDAMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=697; -- TÁMARA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1018; -- RESTREPO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1073; -- SALAZAR / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=731; -- MACARAVITA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1241; -- SUAN / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1308; -- TERUEL / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1124; -- SAN JUAN DE ARAMA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=369; -- COVARACHÍA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=783; -- MONGUÍ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=638; -- LABATECA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=642; -- LA CRUZ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1390; -- VILLANUEVA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1228; -- SANTIAGO / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=479; -- FLORESTA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=918; -- PITAL / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1054; -- SAN BERNARDO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=285; -- CIÉNAGA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=718; -- LORICA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=196; -- CAREPA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=286; -- CIÉNEGA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1426; -- ZARAGOZA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1351; -- TÚQUERRES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=453; -- ALTAMIRA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1330; -- TOLEDO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=541; -- HATILLO DE LOBA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=980; -- QUIMBAYA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=284; -- CIÉNAGA DE ORO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=611; -- IPIALES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=919; -- PINCHOTE / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=367; -- COROMORO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=356; -- CONTADERO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=664; -- LA UNIÓN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=561; -- GUACHUCAL / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1266; -- TADÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=749; -- MANATÍ / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1398; -- VILLANUEVA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1350; -- TURBANÁ / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=429; -- EL CERRITO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=113; -- BUGALAGRANDE / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=112; -- GUADALAJARA DE BUGA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1207; -- SIPÍ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=469; -- FACATATIVÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=739; -- MADRID / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=911; -- PESCA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1267; -- TAMALAMEQUE / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=450; -- EL PEÑÓN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=776; -- MILÁN / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=966; -- REGIDOR / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1123; -- SANTA ROSA DE CABAL / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=234; -- CÉRTEGUI / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=31; -- CARTAGENA DE INDIAS / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=754; -- MARINILLA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1395; -- VILLAPINZÓN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=583; -- GUAYATÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=496; -- FLORENCIA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=448; -- EL ROSARIO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1068; -- SAN JOSÉ DE LA MONTAÑA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=791; -- MORALES / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=939; -- PROVIDENCIA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=927; -- PIVIJAY / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=493; -- FÚQUENE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=737; -- ANZOÁTEGUI / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1364; -- ÚTICA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1184; -- SAN PEDRO / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1278; -- TAUSA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=953; -- PUERTO LEGUÍZAMO / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=653; -- LA MESA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1309; -- TIBANÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1428; -- ZETAQUIRA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1307; -- UNGUÍA / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=170; -- CAMPAMENTO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=430; -- EL ESPINO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1319; -- BARRANCABERMEJA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=857; -- VENECIA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=920; -- PINILLOS / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=264; -- CHIQUINQUIRÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=405; -- GALERAS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=892; -- ARACATACA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=426; -- EL GUACAMAYO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1367; -- URUMITA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=704; -- LEIVA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=720; -- LOS PALMITOS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1420; -- YOLOMBÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=910; -- PEÑOL / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1202; -- SILVANIA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=784; -- MONTELÍBANO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=621; -- JAMBALÓ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=462; -- ENTRERRÍOS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=600; -- HOBO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=202; -- CHÁMEZA / CASANARE
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=777; -- MIRITÍ - PARANÁ / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=400; -- CUMBITARA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=365; -- CORRALES / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=699; -- LA VICTORIA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1334; -- TORIBÍO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=881; -- PALMIRA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1046; -- SABANAGRANDE / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=769; -- MEDIO SAN JUAN / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1313; -- TIERRALTA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1223; -- SOCHA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=617; -- ITAGÜÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1125; -- SANDONÁ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1135; -- SANTANA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=576; -- GUATAPÉ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=661; -- LA VEGA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1083; -- SAN PEDRO DE URABÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1285; -- TELLO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=6; -- AGUA DE DIOS / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=243; -- CHAPARRAL / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=594; -- BARRANCOMINAS / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=804; -- NARIÑO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=213; -- CARMEN DEL DARIÉN / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=55; -- VALLEDUPAR / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=473; -- FLORIÁN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1193; -- SARAVENA / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=590; -- GÜICÁN DE LA SIERRA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=890; -- PALMAS DEL SOCORRO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=232; -- CANTAGALLO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=366; -- CÓRDOBA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1381; -- VALLE DEL GUAMUEZ / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=698; -- LA TEBAIDA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1457; -- BELÉN DE LOS ANDAQUÍES / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1143; -- SANTO DOMINGO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=893; -- ARBELÁEZ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=649; -- LA GLORIA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=880; -- PALMAR DE VARELA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1315; -- TIMBÍO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=488; -- FRONTINO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1403; -- BELALCÁZAR / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=852; -- OLAYA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1137; -- SANTUARIO / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=888; -- PALERMO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1238; -- BARBOSA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=585; -- SAN LUIS DE PALENQUE / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1333; -- TÓPAGA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=451; -- EL PIÑÓN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1327; -- TOGÜÍ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=335; -- MIRAFLORES / GUAVIARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=324; -- ALBANIA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=708; -- LENGUAZAQUE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1361; -- URIBIA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=36; -- LETICIA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1320; -- TIBÚ / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1051; -- SAMACÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=77; -- BOLÍVAR / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1074; -- SAN EDUARDO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=556; -- GRANADA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=645; -- LA DORADA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=263; -- CHIMA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1394; -- VILLANUEVA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1224; -- SOLEDAD / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=142; -- CAJICÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=743; -- TRINIDAD / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=361; -- CÓRDOBA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1117; -- AYAPEL / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=771; -- PUERTO CONCORDIA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=691; -- LA JAGUA DE IBIRICO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=641; -- LA ARGENTINA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=907; -- PUERTO NARIÑO / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1218; -- SOCORRO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=793; -- MORROA / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=565; -- GUAMAL / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=48; -- QUIBDÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1249; -- SUTAMARCHÁN / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1424; -- ZAMBRANO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1175; -- SANTA ROSA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1253; -- SUTATENZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=192; -- CALOTO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1321; -- TIPACOQUE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1087; -- SAN RAFAEL / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=724; -- LOS CÓRDOBAS / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1084; -- TARAIRA / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1147; -- SANTA ROSA DE VITERBO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=461; -- ENCINO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=86; -- BUENAVENTURA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=745; -- MAHATES / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1045; -- SABOYÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=735; -- MAGÜÍ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=981; -- QUINCHÍA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=475; -- FILANDIA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=702; -- LA VICTORIA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=755; -- MARSELLA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1206; -- SIMIJACA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1179; -- SANTA ANA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1057; -- SAN FERNANDO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=719; -- LOS ANDES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=422; -- EL CALVARIO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=871; -- PAIPA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=237; -- CERETÉ / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=41; -- MONTERÍA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=265; -- CHIPAQUE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1211; -- BALBOA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1031; -- RIOFRÍO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1461; -- DISTRACCIÓN / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1034; -- SAN CRISTÓBAL / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=115; -- BUSBANZÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1146; -- SAN SEBASTIÁN / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=417; -- EL ÁGUILA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=440; -- EL PASO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=349; -- ALEJANDRÍA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1205; -- SIMACOTA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=867; -- PACHO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=897; -- PAUNA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=437; -- EL CHARCO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=696; -- LEJANÍAS / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1092; -- SAMPUÉS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=700; -- LA VEGA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1244; -- SUCRE / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1136; -- SAN LORENZO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1056; -- ARAUQUITA / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=753; -- MARGARITA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=874; -- PAICOL / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=555; -- GRANADA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=139; -- CAICEDO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1064; -- SAN JACINTO DEL CAUCA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=500; -- GACHANCIPÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1234; -- SOTAQUIRÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=884; -- PALMAR / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=198; -- CAPARRAPÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=615; -- ANDALUCÍA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1243; -- SUÁREZ / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=508; -- GAMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=846; -- ARANZAZU / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=985; -- RAMIRIQUÍ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=593; -- ANDES / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=647; -- LA FLORIDA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=33; -- FLORENCIA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=970; -- PURACÉ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=282; -- CHIVATÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1346; -- TURMEQUÉ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=974; -- PUERTO RICO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=371; -- ALDANA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1344; -- TULUÁ / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=111; -- BUENAVISTA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=347; -- CONCORDIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=942; -- PUERTO CAICEDO / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=486; -- FREDONIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1239; -- SAN MARTÍN / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1036; -- ROBERTO PAYÁN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=37; -- MANIZALES / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=869; -- PÁCORA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=969; -- PUPIALES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=533; -- ÁBREGO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1412; -- YAGUARÁ / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=262; -- CHÍA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=757; -- MARIPÍ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=767; -- APÍA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1378; -- VÉLEZ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=778; -- NUEVA GRANADA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=809; -- NILO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1078; -- SAN JUAN DE RIOSECO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=794; -- MOSQUERA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=822; -- OCAMONTE / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=145; -- CALDAS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=219; -- CARCASÍ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1112; -- SAN BENITO ABAD / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=166; -- CANDELARIA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=566; -- GUAPI / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=199; -- CARMEN DE APICALÁ / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=765; -- MELGAR / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1055; -- SAN CARLOS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1178; -- SANTA BÁRBARA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1020; -- RETIRO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=706; -- LEBRIJA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1283; -- TENERIFE / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=474; -- FILADELFIA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=164; -- CAJIBÍO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=173; -- LA SALINA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=883; -- PAMPLONITA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=337; -- COLOSÓ / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=411; -- DURANIA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=499; -- GACHANTIVÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=396; -- CHALÁN / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=221; -- CARMEN DE CARUPA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=945; -- PUEBLOVIEJO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1150; -- SANTA SOFÍA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=149; -- AGUSTÍN CODAZZI / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=168; -- CALIFORNIA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=362; -- CÓRDOBA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=345; -- CONCEPCIÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1396; -- VILLARRICA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=59; -- AGUAZUL / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1355; -- URAMITA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1151; -- EL SANTUARIO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=595; -- HACARÍ / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=741; -- MAICAO / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1219; -- SOCOTÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1216; -- SOACHA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=433; -- EL RETORNO / GUAVIARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=244; -- CHIMÁ / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1256; -- BARAYA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=137; -- CAIMITO / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=134; -- CAICEDONIA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=191; -- CANDELARIA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=87; -- BUENAVISTA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=298; -- CISNEROS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1385; -- VIJES / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=326; -- ALGECIRAS / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1190; -- SATIVANORTE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=740; -- MAGANGUÉ / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=811; -- NECOCLÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=201; -- CALAMAR / GUAVIARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=598; -- HERRÁN / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1130; -- SAN JUANITO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1030; -- RIOBLANCO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=287; -- ALBÁN / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=988; -- ACEVEDO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=569; -- GUADALUPE / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1425; -- ZAPATOCA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=808; -- NEMOCÓN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1035; -- LA PAZ / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=442; -- EL TARRA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1063; -- SABANA DE TORRES / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1451; -- CANALETE / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1033; -- ARROYOHONDO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=922; -- ARGELIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=795; -- MOSQUERA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1198; -- SIACHOQUE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1349; -- TUTA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=887; -- LA PRIMAVERA / VICHADA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=788; -- MONIQUIRÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1052; -- SAN ANDRÉS DE CUERQUÍA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=133; -- CABRERA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=109; -- BUESACO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=692; -- LA UNIÓN / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=912; -- PEQUE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=79; -- CIUDAD BOLÍVAR / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=790; -- MONTENEGRO / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=363; -- COTA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=501; -- GAMARRA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=277; -- CHOACHÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=444; -- EL CASTILLO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=554; -- GRAMALOTE / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=18; -- ARAUCA / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=441; -- EL PEÑÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=141; -- HATO COROZAL / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=364; -- COROZAL / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=628; -- JESÚS MARÍA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1465; -- BOJAYÁ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=172; -- EL CANTÓN DEL SAN PABLO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1126; -- SANTA ROSA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=47; -- PUERTO CARREÑO / VICHADA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=693; -- LA UNIÓN / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1039; -- RONCESVALLES / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1463; -- BOCHALEMA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=725; -- ANSERMA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=742; -- MEDIO BAUDÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=242; -- CHAGUANÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=982; -- QUIPILE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=644; -- LA CAPILLA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=730; -- MACANAL / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=723; -- LÓPEZ DE MICAY / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=502; -- GALAPA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1416; -- YARUMAL / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=659; -- LA PLATA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1192; -- BAGADÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1311; -- TIBASOSA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=387; -- CUMARAL / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=562; -- GUACA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1454; -- BETULIA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=850; -- OIBA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=727; -- SANTA FÉ DE ANTIOQUIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1114; -- SAN LUIS / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=607; -- ILES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=22; -- BARRANQUILLA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1376; -- VENECIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=613; -- ISNOS / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=346; -- CONSACÁ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=416; -- EBÉJICO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=267; -- CHIPATÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=165; -- CALARCÁ / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=968; -- PUERTO NARE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=889; -- PALESTINA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=174; -- CALDONO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1099; -- SAN ANTERO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=325; -- ALCALÁ / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1197; -- BARRANCO DE LOBA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=107; -- BUENAVISTA / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1081; -- SAN PEDRO DE LOS MILAGROS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=905; -- ARGELIA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=373; -- ALMEIDA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1383; -- VIANÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1144; -- SAN SEBASTIÁN DE BUENAVISTA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1185; -- SASAIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1265; -- TAMINANGO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1459; -- ZAPAYÁN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=817; -- NUEVO COLÓN / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1268; -- TANGUA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=397; -- OROCUÉ / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1182; -- VISTAHERMOSA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=544; -- GIGANTE / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=606; -- ICONONZO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1324; -- TOCA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=42; -- NEIVA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=19; -- ARMENIA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1177; -- SAN ZENÓN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=419; -- EL COCUY / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=140; -- CÁCOTA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=28; -- CALI / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=631; -- JUAN DE ACOSTA / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1040; -- ROSAS / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=885; -- PANQUEBA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=459; -- EL ENCANTO / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=924; -- PELAYA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1072; -- SALADOBLANCO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=300; -- ABEJORRAL / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1194; -- SEGOVIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=498; -- GACHALÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=567; -- GUARNE / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1231; -- SOMONDOCO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1348; -- TURBO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1388; -- VILLA CARO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=135; -- CACHIPAY / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=81; -- BOYACÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1201; -- SILOS / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1254; -- SUSA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=900; -- PIAMONTE / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=648; -- LA CELIA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=779; -- MURILLO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1462; -- ZONA BANANERA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1318; -- TITIRIBÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1200; -- SAN LUIS DE SINCÉ / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=472; -- FALAN / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=58; -- YOPAL / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=379; -- CLEMENCIA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=44; -- PASTO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=639; -- LABRANZAGRANDE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=882; -- PALOCABILDO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1382; -- VETAS / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=923; -- ARMERO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=908; -- PEDRAZA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1096; -- SAN PEDRO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1354; -- UBAQUE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1153; -- SANTACRUZ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1453; -- BETANIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=261; -- CHIMICHAGUA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=579; -- GUATEQUE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1131; -- SAN MIGUEL / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=415; -- CHACHAGÜÍ / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1405; -- BELÉN DE UMBRÍA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1373; -- BELTRÁN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=146; -- AGRADO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=575; -- ORITO / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=616; -- ANGELÓPOLIS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=538; -- COTORRA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1310; -- TIBACUY / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1284; -- TENZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1134; -- SANTA ROSA DE OSOS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1379; -- VERGARA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=915; -- PIEDRAS / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=148; -- AGUADAS / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=45; -- PEREIRA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1246; -- CUMARIBO / VICHADA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1119; -- SANTIAGO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=543; -- GÉNOVA / QUINDÍO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=941; -- PUERTO GAITÁN / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1460; -- BOAVITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=217; -- CÁQUEZA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=712; -- LA MONTAÑITA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=552; -- GÓMEZ PLATA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=956; -- PUERTO TEJADA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=815; -- NOCAIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=233; -- CEPITÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=870; -- PÁEZ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1374; -- VALPARAÍSO / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=605; -- LA MACARENA / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=781; -- MOMIL / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1353; -- UBALÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=657; -- LA SIERRA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=548; -- GIRÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1337; -- TOPAIPÍ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=438; -- EL DOVIO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=906; -- POLICARPA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=88; -- AGUACHICA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=344; -- CONVENCIÓN / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=770; -- MERCADERES / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=891; -- PANDI / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=259; -- CHINCHINÁ / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=913; -- PIJIÑO DEL CARMEN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1328; -- TOCANCIPÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=551; -- GONZÁLEZ / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1186; -- SANTA BÁRBARA DE PINTO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1343; -- TUNUNGUÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1196; -- SEVILLA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=789; -- AQUITANIA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=916; -- PIENDAMÓ - TUNÍA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=759; -- MARÍA LA BAJA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=509; -- GARAGOA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=260; -- CHITAGÁ / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=640; -- HATONUEVO / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=144; -- CÁCHIRA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=658; -- LA PALMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1322; -- TIQUISIO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Isla' WHERE id=50; -- SAN ANDRÉS / ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=288; -- ALBÁN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=240; -- MONTERREY / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=114; -- BURITICÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1111; -- SAMANIEGO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1272; -- BARICHARA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=239; -- CERRITO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=954; -- PUERTO LÓPEZ / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=946; -- PUERTO GUZMÁN / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1389; -- VILLAGÓMEZ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=792; -- MORALES / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=582; -- GUAVATÁ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=348; -- CONFINES / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=627; -- JERUSALÉN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=868; -- PADILLA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1365; -- VALDIVIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=973; -- ARMENIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=987; -- ACANDÍ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=550; -- AMALFI / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=40; -- MOCOA / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=921; -- PIOJÓ / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=872; -- PAILITAS / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=427; -- EL CAIRO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1027; -- RIONEGRO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=925; -- PISBA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=655; -- LA PINTADA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=592; -- GUTIÉRREZ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1393; -- VILLAMARÍA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=82; -- BRICEÑO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1430; -- ZIPAQUIRÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=983; -- APULO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1386; -- BELÉN / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=477; -- FLANDES / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=190; -- CALAMAR / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=390; -- CUMBAL / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1317; -- TIMBIQUÍ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1098; -- SALDAÑA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1043; -- SABANALARGA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=807; -- NEIRA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=665; -- ABRIAQUÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1421; -- YOTOCO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1429; -- ZIPACÓN / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=937; -- PRADO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=383; -- CUASPUD CARLOSAMA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=758; -- MARMATO / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=467; -- EL RETÉN / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1279; -- TAME / ARAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=643; -- ANGOSTURA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1029; -- RIVERA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1316; -- TINJACÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1101; -- SAN CAYETANO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1133; -- SANTA ISABEL / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=629; -- JORDÁN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=609; -- IMUÉS / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=773; -- MIRANDA / CAUCA
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1414; -- CACAHUAL / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=235; -- CARURÚ / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=108; -- BUENOS AIRES / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=197; -- CARTAGO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=859; -- OVEJAS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1464; -- BOJACÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=805; -- NATAGAIMA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=299; -- COCORNÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=637; -- LA CUMBRE / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1456; -- BETULIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=929; -- PLANADAS / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1212; -- BALBOA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=799; -- MUTATÁ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=412; -- ALPUJARRA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1132; -- SAN PELAYO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1067; -- SAN FRANCISCO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=756; -- VILLANUEVA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1109; -- SAN MIGUEL DE SEMA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1022; -- RICAURTE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1019; -- RESTREPO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=504; -- GÁMEZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=814; -- NOBSA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=634; -- LA CEJA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1209; -- SIBUNDOY / PUTUMAYO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1377; -- VENTAQUEMADA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=485; -- FOSCA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=460; -- PORE / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1263; -- SUCRE / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=255; -- DOSQUEBRADAS / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=542; -- SABANALARGA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=276; -- CHISCAS / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=388; -- CUNDAY / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=847; -- ARGELIA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=898; -- PATÍA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1286; -- TENJO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=378; -- COVEÑAS / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=447; -- EL PAUJÍL / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=816; -- NÓVITA / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=27; -- BUCARAMANGA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=930; -- PLANETA RICA / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=633; -- JURADÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=428; -- EL DONCELLO / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1106; -- SAN ANTONIO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1340; -- TRUJILLO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=257; -- CHINAVITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=601; -- HONDA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1235; -- SORACÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=853; -- ONZAGA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1347; -- TURBACO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1107; -- SAN BERNARDO DEL VIENTO / CÓRDOBA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=372; -- ALMAGUER / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1145; -- SAN PABLO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=748; -- MALLAMA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1236; -- SUBACHOQUE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=978; -- QUEBRADANEGRA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=863; -- ARBOLETES / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1011; -- BOSCONIA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=690; -- ANORÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1152; -- SANTANDER DE QUILICHAO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=564; -- GUAMAL / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=407; -- DOLORES / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=651; -- LA LLANADA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=83; -- BRICEÑO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=597; -- HELICONIA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=798; -- MORELIA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=256; -- CHIGORODÓ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1120; -- SAN PABLO DE BORBUR / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1271; -- BARBOSA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=220; -- CASABIANCA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1048; -- SÁCHICA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=715; -- LINARES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=236; -- CERRO DE SAN ANTONIO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=926; -- PITALITO / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=879; -- FRANCISCO PIZARRO / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1188; -- SAPUYES / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=938; -- PROVIDENCIA / ARCHIPIÉLAGO DE SAN ANDRÉS, PROVIDENCIA Y SANTA CATALINA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=553; -- GRANADA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=258; -- CHINÁCOTA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=584; -- MAPIRIPÁN / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=281; -- CHITARAQUE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1360; -- VILLA RICA / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=878; -- ARJONA / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1077; -- SAMANÁ / CALDAS
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=707; -- LA PEDRERA / AMAZONAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=398; -- CHÍQUIZA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=619; -- ITUANGO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=760; -- MANAURE BALCÓN DEL CESAR / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1259; -- SUÁREZ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1338; -- TORO / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1237; -- BAJO BAUDÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1359; -- UNE / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=418; -- EL CARMEN DE BOLÍVAR / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=965; -- QUÍPAMA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=432; -- ALTO BAUDÓ / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1208; -- SITIONUEVO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=933; -- MANAURE / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1233; -- SORA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1275; -- TASCO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1176; -- SAN JUAN DE BETULIA / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=663; -- LA PLAYA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1025; -- RÍO DE ORO / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1261; -- SUTATAUSA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=546; -- GIRALDO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=763; -- MATANZA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=652; -- LANDÁZURI / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1331; -- SANTIAGO DE TOLÚ / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1183; -- SAN ONOFRE / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1242; -- SUAZA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=785; -- MONTEBELLO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=540; -- GUACHENÉ / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1149; -- SANTA BÁRBARA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1021; -- SAN JOSÉ DEL FRAGUA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1189; -- SARDINATA / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1142; -- SANTA MARÍA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1408; -- LA GUADALUPE / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=894; -- PALESTINA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=662; -- LA PEÑA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1357; -- VILLA DE SAN DIEGO DE UBATÉ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1129; -- SANTO TOMÁS / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1105; -- SALAMINA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1214; -- SAN VICENTE DEL CAGUÁN / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1094; -- SAN CALIXTO / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1070; -- SABANAS DE SAN ÁNGEL / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=339; -- CONCORDIA / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=780; -- MOGOTES / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=334; -- COGUA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1220; -- SOLANO / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=392; -- CURITÍ / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=468; -- ESPINAL / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=445; -- EL PEÑOL / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1325; -- TOCAIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1352; -- TUTAZÁ / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=214; -- CAROLINA / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=695; -- LA VIRGINIA / RISARALDA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1458; -- BITUIMA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1058; -- SAN JUAN DEL CESAR / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=446; -- EL PLAYÓN / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=971; -- PURIFICACIÓN / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=976; -- PUERTO TRIUNFO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=176; -- CAÑASGORDAS / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=572; -- GUADALUPE / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1400; -- VITERBO / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1041; -- ROVIRA / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=622; -- JAMUNDÍ / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=989; -- ACHÍ / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1411; -- YACUANQUER / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=494; -- ALBANIA / CAQUETÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1061; -- SAN CAYETANO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1110; -- SANTA MARÍA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=656; -- LA TOLA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=806; -- NÁTAGA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=571; -- ASTREA / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=360; -- CORINTO / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=386; -- NUNCHÍA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1371; -- VEGACHÍ / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=854; -- OPORAPA / HUILA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=599; -- HERVEO / TOLIMA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1082; -- SAN JOSÉ / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=464; -- ENCISO / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=384; -- CUCAITA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=471; -- EL DORADO / META
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1095; -- SAN PABLO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1080; -- SAN JOSÉ DE PARE / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=283; -- CICUCO / BOLÍVAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1026; -- RIONEGRO / ANTIOQUIA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=729; -- LURUACO / ATLÁNTICO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=861; -- ARBOLEDA / NARIÑO
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=866; -- PACOA / VAUPÉS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=764; -- MARULANDA / CALDAS
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1199; -- SIBATÉ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=457; -- EL TAMBO / NARIÑO
      UPDATE sip_municipio SET tipomun='Área no municipalizada' WHERE id=1417; -- MORICHAL / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=713; -- TAURAMENA / CASANARE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=423; -- EL CARMEN DE ATRATO / CHOCÓ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1335; -- TOTA / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=895; -- PARATEBUENO / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=586; -- GUATAVITA / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=768; -- BECERRIL / CESAR
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=245; -- CHARTA / SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=1251; -- SUPATÁ / CUNDINAMARCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=167; -- CALDAS / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=813; -- OLAYA HERRERA / NARIÑO
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=705; -- LOS PATIOS / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=421; -- EL BANCO / MAGDALENA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=481; -- FONSECA / LA GUAJIRA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=46; -- POPAYÁN / CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=401; -- DAGUA / VALLE DEL CAUCA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=862; -- ARBOLEDAS / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=35; -- INÍRIDA / GUAINÍA
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=736; -- MAJAGUAL / SUCRE
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=171; -- CAMPOHERMOSO / BOYACÁ
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=722; -- LOURDES / NORTE DE SANTANDER
      UPDATE sip_municipio SET tipomun='Municipio' WHERE id=957; -- PUERTO ESCONDIDO / CÓRDOBA
    SQL
  end

  def down
    remove_column :sip_municipio, :tipomun, :string, limit: 32
  end

end
