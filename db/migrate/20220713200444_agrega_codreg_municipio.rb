class AgregaCodregMunicipio < ActiveRecord::Migration[7.0]
  def up
    if !column_exists?(:sip_municipio, :codreg)
      add_column :sip_municipio, :codreg, :integer
      execute <<-SQL
        -- Amazonas
        UPDATE sip_municipio SET codreg=7  WHERE id=907; -- Puerto Nariño
        UPDATE sip_municipio SET codreg=10 WHERE id=459; -- El Encanto
        UPDATE sip_municipio SET codreg=13 WHERE id=703; -- La Chorrera
        UPDATE sip_municipio SET codreg=16 WHERE id=707; -- La Pedrera
        UPDATE sip_municipio SET codreg=17 WHERE id=738; -- La Victoria
        UPDATE sip_municipio SET codreg=1  WHERE id=36; -- Leticia
        UPDATE sip_municipio SET codreg=21 WHERE id=1089; -- Puerto Santander
        UPDATE sip_municipio SET codreg=22 WHERE id=1282; -- Tarapacá
        UPDATE sip_municipio SET codreg=30 WHERE id=896; -- Puerto Alegría
        UPDATE sip_municipio SET codreg=40 WHERE id=903; -- Puerto Arica
  
        UPDATE sip_municipio SET codreg=19 WHERE id_departamento=55 and id_munlocal=460; -- Mirití - Parana
  
        -- Antioquia 35
       UPDATE sip_municipio SET codreg=1 WHERE id=38; -- Medellín
       UPDATE sip_municipio SET codreg=4 WHERE id=300; -- Abejorral
       UPDATE sip_municipio SET codreg=7 WHERE id=665; -- Abriaquí
       UPDATE sip_municipio SET codreg=10 WHERE id=349; -- Alejandría
       UPDATE sip_municipio SET codreg=13 WHERE id=536; -- Amagá
       UPDATE sip_municipio SET codreg=16 WHERE id=550; -- Amalfi
       UPDATE sip_municipio SET codreg=19 WHERE id=593; -- Andes
       UPDATE sip_municipio SET codreg=22 WHERE id=616; -- Angelópolis
       UPDATE sip_municipio SET codreg=25 WHERE id=643; -- Angostura
       UPDATE sip_municipio SET codreg=28 WHERE id=690; -- Anorí
       UPDATE sip_municipio SET codreg=34 WHERE id=752; -- Anzá
       UPDATE sip_municipio SET codreg=35 WHERE id=766; -- Apartadó
       UPDATE sip_municipio SET codreg=37 WHERE id=863; -- Arboletes
       UPDATE sip_municipio SET codreg=39 WHERE id=922; -- Argelia
       UPDATE sip_municipio SET codreg=40 WHERE id=973; -- Armenia
       UPDATE sip_municipio SET codreg=43 WHERE id=1271; -- Barbosa
       UPDATE sip_municipio SET codreg=46 WHERE id=1372; -- Belmira
       UPDATE sip_municipio SET codreg=49 WHERE id=1404; -- Bello
       UPDATE sip_municipio SET codreg=52 WHERE id=1453; -- Betania
       UPDATE sip_municipio SET codreg=55 WHERE id=1456; -- Betulia
       UPDATE sip_municipio SET codreg=61 WHERE id=114; -- Buriticá
       UPDATE sip_municipio SET codreg=62 WHERE id=83; -- Briceño
       UPDATE sip_municipio SET codreg=64 WHERE id=132; -- Cáceres
       UPDATE sip_municipio SET codreg=67 WHERE id=139; -- Caicedo
       UPDATE sip_municipio SET codreg=70 WHERE id=145; -- Caldas
       UPDATE sip_municipio SET codreg=73 WHERE id=170; -- Campamento
       UPDATE sip_municipio SET codreg=76 WHERE id=176; -- Cañasgordas
       UPDATE sip_municipio SET codreg=78 WHERE id=193; -- Caracolí
       UPDATE sip_municipio SET codreg=79 WHERE id=194; -- Caramanta
       UPDATE sip_municipio SET codreg=80 WHERE id=196; -- Carepa
       UPDATE sip_municipio SET codreg=85 WHERE id=214; -- Carolina
       UPDATE sip_municipio SET codreg=88 WHERE id=222; -- Caucasia
       UPDATE sip_municipio SET codreg=91 WHERE id=298; -- Cisneros
       UPDATE sip_municipio SET codreg=94 WHERE id=299; -- Cocorná
       UPDATE sip_municipio SET codreg=97 WHERE id=343; -- Concepción
       UPDATE sip_municipio SET codreg=100 WHERE id=347; -- Concordia
       UPDATE sip_municipio SET codreg=103 WHERE id=358; -- Copacabana
       UPDATE sip_municipio SET codreg=106 WHERE id=256; -- Chigorodó
       UPDATE sip_municipio SET codreg=109 WHERE id=403; -- Dabeiba
       UPDATE sip_municipio SET codreg=115 WHERE id=416; -- Ebéjico
       UPDATE sip_municipio SET codreg=117 WHERE id=436; -- El Bagre
       UPDATE sip_municipio SET codreg=118 WHERE id=462; -- Entrerríos
       UPDATE sip_municipio SET codreg=121 WHERE id=465; -- Envigado
       UPDATE sip_municipio SET codreg=124 WHERE id=486; -- Fredonia
       UPDATE sip_municipio SET codreg=127 WHERE id=488; -- Frontino
       UPDATE sip_municipio SET codreg=130 WHERE id=546; -- Giraldo
       UPDATE sip_municipio SET codreg=133 WHERE id=549; -- Girardota
       UPDATE sip_municipio SET codreg=136 WHERE id=552; -- Gómez Plata
       UPDATE sip_municipio SET codreg=139 WHERE id=555; -- Granada
       UPDATE sip_municipio SET codreg=140 WHERE id=557; -- Guadalupe
       UPDATE sip_municipio SET codreg=142 WHERE id=567; -- Guarne
       UPDATE sip_municipio SET codreg=145 WHERE id=576; -- Guatapé
       UPDATE sip_municipio SET codreg=148 WHERE id=597; -- Heliconia
       UPDATE sip_municipio SET codreg=150 WHERE id=608; -- Hispania
       UPDATE sip_municipio SET codreg=151 WHERE id=617; -- Itagüí
       UPDATE sip_municipio SET codreg=154 WHERE id=619; -- Ituango
       UPDATE sip_municipio SET codreg=157 WHERE id=623; -- Jardín
       UPDATE sip_municipio SET codreg=160 WHERE id=626; -- Jericó
       UPDATE sip_municipio SET codreg=163 WHERE id=634; -- La Ceja
       UPDATE sip_municipio SET codreg=166 WHERE id=646; -- La Estrella
       UPDATE sip_municipio SET codreg=169 WHERE id=692; -- La Unión
       UPDATE sip_municipio SET codreg=170 WHERE id=655; -- La Pintada
       UPDATE sip_municipio SET codreg=172 WHERE id=714; -- Liborina
       UPDATE sip_municipio SET codreg=175 WHERE id=732; -- Maceo
       UPDATE sip_municipio SET codreg=178 WHERE id=754; -- Marinilla
       UPDATE sip_municipio SET codreg=181 WHERE id=785; -- Montebello
       UPDATE sip_municipio SET codreg=184 WHERE id=796; -- Murindó
       UPDATE sip_municipio SET codreg=187 WHERE id=799; -- Mutatá
       UPDATE sip_municipio SET codreg=190 WHERE id=804; -- Nariño
       UPDATE sip_municipio SET codreg=191 WHERE id=818; -- Nechí
       UPDATE sip_municipio SET codreg=192 WHERE id=811; -- Necoclí
       UPDATE sip_municipio SET codreg=193 WHERE id=852; -- Olaya
       UPDATE sip_municipio SET codreg=196 WHERE id=910; -- Peñol
       UPDATE sip_municipio SET codreg=199 WHERE id=912; -- Peque
       UPDATE sip_municipio SET codreg=202 WHERE id=959; -- Pueblorrico
       UPDATE sip_municipio SET codreg=205 WHERE id=961; -- Puerto Berrío
       UPDATE sip_municipio SET codreg=206 WHERE id=976; -- Puerto Triunfo
       UPDATE sip_municipio SET codreg=208 WHERE id=1015; -- Remedios
       UPDATE sip_municipio SET codreg=211 WHERE id=1020; -- Retiro
       UPDATE sip_municipio SET codreg=214 WHERE id=1026; -- Rionegro
       UPDATE sip_municipio SET codreg=217 WHERE id=1043; -- Sabanalarga
       UPDATE sip_municipio SET codreg=218 WHERE id=1044; -- Sabaneta
       UPDATE sip_municipio SET codreg=220 WHERE id=1049; -- Salgar
       UPDATE sip_municipio SET codreg=226 WHERE id=1055; -- San Carlos
       UPDATE sip_municipio SET codreg=227 WHERE id=1059; -- San Francisco
       UPDATE sip_municipio SET codreg=229 WHERE id=1065; -- San Jerónimo
       UPDATE sip_municipio SET codreg=230 WHERE id=1068; -- San José De La Montaña
       UPDATE sip_municipio SET codreg=231 WHERE id=1069; -- San Juan De Urabá
       UPDATE sip_municipio SET codreg=232 WHERE id=1076; -- San Luis
       UPDATE sip_municipio SET codreg=237 WHERE id=1083; -- San Pedro De Urabá
       UPDATE sip_municipio SET codreg=238 WHERE id=1087; -- San Rafael
       UPDATE sip_municipio SET codreg=241 WHERE id=1097; -- San Roque
       UPDATE sip_municipio SET codreg=247 WHERE id=1116; -- Santa Bárbara
       UPDATE sip_municipio SET codreg=250 WHERE id=1134; -- Santa Rosa De Osos
       UPDATE sip_municipio SET codreg=253 WHERE id=1143; -- Santo Domingo
       UPDATE sip_municipio SET codreg=259 WHERE id=1194; -- Segovia
       UPDATE sip_municipio SET codreg=262 WHERE id=1221; -- Sonsón
       UPDATE sip_municipio SET codreg=265 WHERE id=1232; -- Sopetrán
       UPDATE sip_municipio SET codreg=268 WHERE id=1269; -- Támesis
       UPDATE sip_municipio SET codreg=270 WHERE id=1274; -- Tarazá
       UPDATE sip_municipio SET codreg=271 WHERE id=1277; -- Tarso
       UPDATE sip_municipio SET codreg=274 WHERE id=1318; -- Titiribí
       UPDATE sip_municipio SET codreg=277 WHERE id=1329; -- Toledo
       UPDATE sip_municipio SET codreg=280 WHERE id=1348; -- Turbo
       UPDATE sip_municipio SET codreg=282 WHERE id=1355; -- Uramita
       UPDATE sip_municipio SET codreg=283 WHERE id=1362; -- Urrao
       UPDATE sip_municipio SET codreg=286 WHERE id=1365; -- Valdivia
       UPDATE sip_municipio SET codreg=289 WHERE id=1370; -- Valparaíso
       UPDATE sip_municipio SET codreg=290 WHERE id=1371; -- Vegachí
       UPDATE sip_municipio SET codreg=291 WHERE id=1392; -- Vigía Del Fuerte
       UPDATE sip_municipio SET codreg=292 WHERE id=1376; -- Venecia
       UPDATE sip_municipio SET codreg=293 WHERE id=1413; -- Yalí
       UPDATE sip_municipio SET codreg=295 WHERE id=1416; -- Yarumal
       UPDATE sip_municipio SET codreg=298 WHERE id=1420; -- Yolombó
       UPDATE sip_municipio SET codreg=301 WHERE id=1426; -- Zaragoza
       
       UPDATE sip_municipio SET codreg=31 WHERE id_departamento=35 and id_munlocal=42; -- Santa Fé de Antioquía
       UPDATE sip_municipio SET codreg=58 WHERE id_departamento=35 and id_munlocal=101; -- Ciudad Bolívar
       UPDATE sip_municipio SET codreg=82 WHERE id_departamento=35 and id_munlocal=148; -- El Carmen de Viboral
       UPDATE sip_municipio SET codreg=112 WHERE id_departamento=35 and id_munlocal=237; -- Donmatías
       UPDATE sip_municipio SET codreg=168 WHERE id_departamento=35 and id_munlocal=585; -- Puerto Nare
       UPDATE sip_municipio SET codreg=223 WHERE id_departamento=35 and id_munlocal=647; -- San Andrés de Cuerquía
       UPDATE sip_municipio SET codreg=235 WHERE id_departamento=35 and id_munlocal=664; -- San Pedro de los Milagros
       UPDATE sip_municipio SET codreg=244 WHERE id_departamento=35 and id_munlocal=674; -- San Vicente de Ferrer
       UPDATE sip_municipio SET codreg=256 WHERE id_departamento=35 and id_munlocal=697; -- El Santuario
       UPDATE sip_municipio SET codreg=300 WHERE id_departamento=35 and id_munlocal=893; -- Yondó
  
        -- Arauca 50
        UPDATE sip_municipio SET codreg=1 WHERE id=18; -- Arauca
        UPDATE sip_municipio SET codreg=5 WHERE id=1279; -- Tame
        UPDATE sip_municipio SET codreg=10 WHERE id=1056; -- Arauquita
        UPDATE sip_municipio SET codreg=15 WHERE id=377; -- Cravo Norte
        UPDATE sip_municipio SET codreg=17 WHERE id=539; -- Fortul
        UPDATE sip_municipio SET codreg=20 WHERE id=975; -- Puerto Rondón
        UPDATE sip_municipio SET codreg=25 WHERE id=1193; -- Saravena
  
        -- Archipiélago de San Andrés, Providencia y Santa Catalina (53)
        UPDATE sip_municipio SET codreg=1 WHERE id=50; -- San Andrés
        UPDATE sip_municipio SET codreg=4 WHERE id=938; -- Providencia
  
       -- Atlántico (48)
       UPDATE sip_municipio SET codreg=1 WHERE id=22; -- Barranquilla
       UPDATE sip_municipio SET codreg=4 WHERE id=1255; -- Baranoa
       UPDATE sip_municipio SET codreg=7 WHERE id=175; -- Campo De La Cruz
       UPDATE sip_municipio SET codreg=10 WHERE id=191; -- Candelaria
       UPDATE sip_municipio SET codreg=13 WHERE id=502; -- Galapa
       UPDATE sip_municipio SET codreg=16 WHERE id=631; -- Juan De Acosta
       UPDATE sip_municipio SET codreg=19 WHERE id=729; -- Luruaco
       UPDATE sip_municipio SET codreg=22 WHERE id=746; -- Malambo
       UPDATE sip_municipio SET codreg=25 WHERE id=749; -- Manatí
       UPDATE sip_municipio SET codreg=28 WHERE id=880; -- Palmar De Varela
       UPDATE sip_municipio SET codreg=31 WHERE id=921; -- Piojó
       UPDATE sip_municipio SET codreg=34 WHERE id=932; -- Polonuevo
       UPDATE sip_municipio SET codreg=35 WHERE id=934; -- Ponedera
       UPDATE sip_municipio SET codreg=37 WHERE id=952; -- Puerto Colombia
       UPDATE sip_municipio SET codreg=40 WHERE id=1017; -- Repelón
       UPDATE sip_municipio SET codreg=43 WHERE id=1046; -- Sabanagrande
       UPDATE sip_municipio SET codreg=46 WHERE id=1047; -- Sabanalarga
       UPDATE sip_municipio SET codreg=47 WHERE id=1108; -- Santa Lucía
       UPDATE sip_municipio SET codreg=49 WHERE id=1129; -- Santo Tomás
       UPDATE sip_municipio SET codreg=52 WHERE id=1224; -- Soledad
       UPDATE sip_municipio SET codreg=55 WHERE id=1241; -- Suan
       UPDATE sip_municipio SET codreg=58 WHERE id=1342; -- Tubará
       UPDATE sip_municipio SET codreg=61 WHERE id=1363; -- Usiacurí
       -- Bogotá, D.C. (4)
       UPDATE sip_municipio SET codreg=1 WHERE id=24; -- Bogotá, D.C.
  
       -- Bolívar (7)
  
       UPDATE sip_municipio SET codreg=4 WHERE id=989; -- Achí
       UPDATE sip_municipio SET codreg=5 WHERE id=726; -- Arenal
       UPDATE sip_municipio SET codreg=6 WHERE id=535; -- Altos Del Rosario
       UPDATE sip_municipio SET codreg=7 WHERE id=878; -- Arjona
       UPDATE sip_municipio SET codreg=10 WHERE id=1197; -- Barranco De Loba
       UPDATE sip_municipio SET codreg=13 WHERE id=190; -- Calamar
       UPDATE sip_municipio SET codreg=14 WHERE id=232; -- Cantagallo
       UPDATE sip_municipio SET codreg=15 WHERE id=283; -- Cicuco
       UPDATE sip_municipio SET codreg=16 WHERE id=361; -- Córdoba
       UPDATE sip_municipio SET codreg=18 WHERE id=379; -- Clemencia
       UPDATE sip_municipio SET codreg=22 WHERE id=418; -- El Carmen De Bolívar
       UPDATE sip_municipio SET codreg=25 WHERE id=431; -- El Guamo
       UPDATE sip_municipio SET codreg=26 WHERE id=541; -- Hatillo De Loba
       UPDATE sip_municipio SET codreg=27 WHERE id=466; -- El Peñón
       UPDATE sip_municipio SET codreg=28 WHERE id=740; -- Magangué
       UPDATE sip_municipio SET codreg=31 WHERE id=745; -- Mahates
       UPDATE sip_municipio SET codreg=37 WHERE id=753; -- Margarita
       UPDATE sip_municipio SET codreg=40 WHERE id=759; -- María La Baja
       UPDATE sip_municipio SET codreg=41 WHERE id=775; -- Montecristo
       UPDATE sip_municipio SET codreg=44 WHERE id=791; -- Morales
       UPDATE sip_municipio SET codreg=50 WHERE id=812; -- Norosí
       UPDATE sip_municipio SET codreg=59 WHERE id=920; -- Pinillos
       UPDATE sip_municipio SET codreg=63 WHERE id=966; -- Regidor
       UPDATE sip_municipio SET codreg=70 WHERE id=1053; -- San Estanislao
       UPDATE sip_municipio SET codreg=72 WHERE id=1034; -- San Cristóbal
       UPDATE sip_municipio SET codreg=73 WHERE id=1057; -- San Fernando
       UPDATE sip_municipio SET codreg=76 WHERE id=1062; -- San Jacinto
       UPDATE sip_municipio SET codreg=78 WHERE id=1064; -- San Jacinto Del Cauca
       UPDATE sip_municipio SET codreg=79 WHERE id=1066; -- San Juan Nepomuceno
       UPDATE sip_municipio SET codreg=82 WHERE id=1086; -- San Martín De Loba
       UPDATE sip_municipio SET codreg=84 WHERE id=1095; -- San Pablo
       UPDATE sip_municipio SET codreg=91 WHERE id=1103; -- Santa Catalina
       UPDATE sip_municipio SET codreg=94 WHERE id=1126; -- Santa Rosa
       UPDATE sip_municipio SET codreg=95 WHERE id=1138; -- Santa Rosa Del Sur
       UPDATE sip_municipio SET codreg=97 WHERE id=1204; -- Simití
       UPDATE sip_municipio SET codreg=106 WHERE id=1229; -- Soplaviento
       UPDATE sip_municipio SET codreg=110 WHERE id=1260; -- Talaigua Nuevo
       UPDATE sip_municipio SET codreg=118 WHERE id=1347; -- Turbaco
       UPDATE sip_municipio SET codreg=121 WHERE id=1350; -- Turbaná
       UPDATE sip_municipio SET codreg=124 WHERE id=1394; -- Villanueva
       UPDATE sip_municipio SET codreg=127 WHERE id=1424; -- Zambrano
  
       UPDATE sip_municipio SET codreg=1 WHERE id=31; -- Cartagena de Indias
       UPDATE sip_municipio SET codreg=9 WHERE id=1033; -- Arroyohondo
       UPDATE sip_municipio SET codreg=43 WHERE id=787; -- Santa Cruz de Mompox
       UPDATE sip_municipio SET codreg=65 WHERE id=1014; -- Río Viejo
       UPDATE sip_municipio SET codreg=113 WHERE id=1322; -- Tisquiso
  
  
      
       -- Boyacá (11)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=54; -- Tunja
       UPDATE sip_municipio SET codreg=7 WHERE id=373; -- Almeida
       UPDATE sip_municipio SET codreg=10 WHERE id=864; -- Arcabuco
       UPDATE sip_municipio SET codreg=13 WHERE id=1386; -- Belén
       UPDATE sip_municipio SET codreg=16 WHERE id=1450; -- Berbeo
       UPDATE sip_municipio SET codreg=19 WHERE id=1455; -- Betéitiva
       UPDATE sip_municipio SET codreg=22 WHERE id=1460; -- Boavita
       UPDATE sip_municipio SET codreg=25 WHERE id=81; -- Boyacá
       UPDATE sip_municipio SET codreg=28 WHERE id=82; -- Briceño
       UPDATE sip_municipio SET codreg=31 WHERE id=87; -- Buenavista
       UPDATE sip_municipio SET codreg=34 WHERE id=115; -- Busbanzá
       UPDATE sip_municipio SET codreg=37 WHERE id=167; -- Caldas
       UPDATE sip_municipio SET codreg=40 WHERE id=171; -- Campohermoso
       UPDATE sip_municipio SET codreg=43 WHERE id=238; -- Cerinza
       UPDATE sip_municipio SET codreg=46 WHERE id=286; -- Ciénega
       UPDATE sip_municipio SET codreg=49 WHERE id=338; -- Cómbita
       UPDATE sip_municipio SET codreg=52 WHERE id=359; -- Coper
       UPDATE sip_municipio SET codreg=55 WHERE id=365; -- Corrales
       UPDATE sip_municipio SET codreg=58 WHERE id=369; -- Covarachía
       UPDATE sip_municipio SET codreg=59 WHERE id=381; -- Cubará
       UPDATE sip_municipio SET codreg=60 WHERE id=384; -- Cucaita
       UPDATE sip_municipio SET codreg=61 WHERE id=389; -- Cuítiva
       UPDATE sip_municipio SET codreg=64 WHERE id=257; -- Chinavita
       UPDATE sip_municipio SET codreg=67 WHERE id=264; -- Chiquinquirá
       UPDATE sip_municipio SET codreg=68 WHERE id=398; -- Chíquiza
       UPDATE sip_municipio SET codreg=70 WHERE id=276; -- Chiscas
       UPDATE sip_municipio SET codreg=73 WHERE id=279; -- Chita
       UPDATE sip_municipio SET codreg=76 WHERE id=281; -- Chitaraque
       UPDATE sip_municipio SET codreg=77 WHERE id=282; -- Chivatá
       UPDATE sip_municipio SET codreg=78 WHERE id=406; -- Chivor
       UPDATE sip_municipio SET codreg=79 WHERE id=409; -- Duitama
       UPDATE sip_municipio SET codreg=82 WHERE id=419; -- El Cocuy
       UPDATE sip_municipio SET codreg=85 WHERE id=430; -- El Espino
       UPDATE sip_municipio SET codreg=88 WHERE id=476; -- Firavitoba
       UPDATE sip_municipio SET codreg=91 WHERE id=479; -- Floresta
       UPDATE sip_municipio SET codreg=94 WHERE id=499; -- Gachantivá
       UPDATE sip_municipio SET codreg=97 WHERE id=504; -- Gámeza
       UPDATE sip_municipio SET codreg=100 WHERE id=509; -- Garagoa
       UPDATE sip_municipio SET codreg=103 WHERE id=559; -- Guacamayas
       UPDATE sip_municipio SET codreg=106 WHERE id=579; -- Guateque
       UPDATE sip_municipio SET codreg=109 WHERE id=583; -- Guayatá
       UPDATE sip_municipio SET codreg=118 WHERE id=620; -- Iza
       UPDATE sip_municipio SET codreg=121 WHERE id=624; -- Jenesano
       UPDATE sip_municipio SET codreg=124 WHERE id=625; -- Jericó
       UPDATE sip_municipio SET codreg=127 WHERE id=639; -- Labranzagrande
       UPDATE sip_municipio SET codreg=130 WHERE id=644; -- La Capilla
       UPDATE sip_municipio SET codreg=136 WHERE id=701; -- La Uvita
       UPDATE sip_municipio SET codreg=137 WHERE id=699; -- La Victoria
       UPDATE sip_municipio SET codreg=142 WHERE id=730; -- Macanal
       UPDATE sip_municipio SET codreg=148 WHERE id=757; -- Maripí
       UPDATE sip_municipio SET codreg=151 WHERE id=772; -- Miraflores
       UPDATE sip_municipio SET codreg=154 WHERE id=782; -- Mongua
       UPDATE sip_municipio SET codreg=157 WHERE id=783; -- Monguí
       UPDATE sip_municipio SET codreg=160 WHERE id=788; -- Moniquirá
       UPDATE sip_municipio SET codreg=161 WHERE id=797; -- Motavita
       UPDATE sip_municipio SET codreg=163 WHERE id=801; -- Muzo
       UPDATE sip_municipio SET codreg=166 WHERE id=814; -- Nobsa
       UPDATE sip_municipio SET codreg=169 WHERE id=817; -- Nuevo Colón
       UPDATE sip_municipio SET codreg=173 WHERE id=851; -- Oicatá
       UPDATE sip_municipio SET codreg=176 WHERE id=858; -- Otanche
       UPDATE sip_municipio SET codreg=178 WHERE id=865; -- Pachavita
       UPDATE sip_municipio SET codreg=179 WHERE id=870; -- Páez
       UPDATE sip_municipio SET codreg=181 WHERE id=871; -- Paipa
       UPDATE sip_municipio SET codreg=184 WHERE id=876; -- Pajarito
       UPDATE sip_municipio SET codreg=187 WHERE id=885; -- Panqueba
       UPDATE sip_municipio SET codreg=190 WHERE id=897; -- Pauna
       UPDATE sip_municipio SET codreg=193 WHERE id=899; -- Paya
       UPDATE sip_municipio SET codreg=199 WHERE id=904; -- Paz De Río
       UPDATE sip_municipio SET codreg=202 WHERE id=911; -- Pesca
       UPDATE sip_municipio SET codreg=205 WHERE id=925; -- Pisba
       UPDATE sip_municipio SET codreg=214 WHERE id=949; -- Puerto Boyacá
       UPDATE sip_municipio SET codreg=215 WHERE id=965; -- Quípama
       UPDATE sip_municipio SET codreg=217 WHERE id=985; -- Ramiriquí
       UPDATE sip_municipio SET codreg=220 WHERE id=1013; -- Ráquira
       UPDATE sip_municipio SET codreg=223 WHERE id=1037; -- Rondón
       UPDATE sip_municipio SET codreg=226 WHERE id=1045; -- Saboyá
       UPDATE sip_municipio SET codreg=232 WHERE id=1048; -- Sáchica
       UPDATE sip_municipio SET codreg=235 WHERE id=1051; -- Samacá
       UPDATE sip_municipio SET codreg=237 WHERE id=1074; -- San Eduardo
       UPDATE sip_municipio SET codreg=238 WHERE id=1080; -- San José De Pare
       UPDATE sip_municipio SET codreg=241 WHERE id=1085; -- San Luis De Gaceno
       UPDATE sip_municipio SET codreg=247 WHERE id=1102; -- San Mateo
       UPDATE sip_municipio SET codreg=248 WHERE id=1109; -- San Miguel De Sema
       UPDATE sip_municipio SET codreg=249 WHERE id=1120; -- San Pablo De Borbur
       UPDATE sip_municipio SET codreg=250 WHERE id=1135; -- Santana
       UPDATE sip_municipio SET codreg=251 WHERE id=1142; -- Santa María
       UPDATE sip_municipio SET codreg=253 WHERE id=1147; -- Santa Rosa De Viterbo
       UPDATE sip_municipio SET codreg=256 WHERE id=1150; -- Santa Sofía
       UPDATE sip_municipio SET codreg=259 WHERE id=1190; -- Sativanorte
       UPDATE sip_municipio SET codreg=262 WHERE id=1191; -- Sativasur
       UPDATE sip_municipio SET codreg=265 WHERE id=1198; -- Siachoque
       UPDATE sip_municipio SET codreg=268 WHERE id=1215; -- Soatá
       UPDATE sip_municipio SET codreg=271 WHERE id=1219; -- Socotá
       UPDATE sip_municipio SET codreg=274 WHERE id=1223; -- Socha
       UPDATE sip_municipio SET codreg=277 WHERE id=1226; -- Sogamoso
       UPDATE sip_municipio SET codreg=280 WHERE id=1231; -- Somondoco
       UPDATE sip_municipio SET codreg=281 WHERE id=1233; -- Sora
       UPDATE sip_municipio SET codreg=282 WHERE id=1235; -- Soracá
       UPDATE sip_municipio SET codreg=283 WHERE id=1234; -- Sotaquirá
       UPDATE sip_municipio SET codreg=286 WHERE id=1248; -- Susacón
       UPDATE sip_municipio SET codreg=289 WHERE id=1249; -- Sutamarchán
       UPDATE sip_municipio SET codreg=292 WHERE id=1253; -- Sutatenza
       UPDATE sip_municipio SET codreg=298 WHERE id=1275; -- Tasco
       UPDATE sip_municipio SET codreg=301 WHERE id=1284; -- Tenza
       UPDATE sip_municipio SET codreg=304 WHERE id=1309; -- Tibaná
       UPDATE sip_municipio SET codreg=307 WHERE id=1311; -- Tibasosa
       UPDATE sip_municipio SET codreg=310 WHERE id=1316; -- Tinjacá
       UPDATE sip_municipio SET codreg=311 WHERE id=1321; -- Tipacoque
       UPDATE sip_municipio SET codreg=313 WHERE id=1324; -- Toca
       UPDATE sip_municipio SET codreg=316 WHERE id=1327; -- Togüí
       UPDATE sip_municipio SET codreg=319 WHERE id=1333; -- Tópaga
       UPDATE sip_municipio SET codreg=322 WHERE id=1335; -- Tota
       UPDATE sip_municipio SET codreg=324 WHERE id=1343; -- Tununguá
       UPDATE sip_municipio SET codreg=325 WHERE id=1346; -- Turmequé
       UPDATE sip_municipio SET codreg=328 WHERE id=1349; -- Tuta
       UPDATE sip_municipio SET codreg=331 WHERE id=1352; -- Tutazá
       UPDATE sip_municipio SET codreg=334 WHERE id=1356; -- Úmbita
       UPDATE sip_municipio SET codreg=337 WHERE id=1377; -- Ventaquemada
       UPDATE sip_municipio SET codreg=340 WHERE id=1402; -- Viracachá
       UPDATE sip_municipio SET codreg=346 WHERE id=1428; -- Zetaquira
  
       UPDATE sip_municipio SET codreg=8 WHERE id=789; -- AQUITANIA | 15047
       UPDATE sip_municipio SET codreg=112 WHERE id=590; -- GÜICÁN DE LA SIERRA | 15332
       UPDATE sip_municipio SET codreg=139 WHERE id=709; -- VILLA DE LEYVA | 15407
  
       -- Caldas (13)
      
       UPDATE sip_municipio SET codreg=1 WHERE id=37; -- Manizales
       UPDATE sip_municipio SET codreg=4 WHERE id=148; -- Aguadas
       UPDATE sip_municipio SET codreg=7 WHERE id=725; -- Anserma
       UPDATE sip_municipio SET codreg=13 WHERE id=846; -- Aranzazu
       UPDATE sip_municipio SET codreg=22 WHERE id=1403; -- Belalcázar
       UPDATE sip_municipio SET codreg=34 WHERE id=259; -- Chinchiná
       UPDATE sip_municipio SET codreg=37 WHERE id=474; -- Filadelfia
       UPDATE sip_municipio SET codreg=49 WHERE id=645; -- La Dorada
       UPDATE sip_municipio SET codreg=52 WHERE id=654; -- La Merced
       UPDATE sip_municipio SET codreg=55 WHERE id=747; -- Manzanares
       UPDATE sip_municipio SET codreg=58 WHERE id=758; -- Marmato
       UPDATE sip_municipio SET codreg=61 WHERE id=762; -- Marquetalia
       UPDATE sip_municipio SET codreg=67 WHERE id=764; -- Marulanda
       UPDATE sip_municipio SET codreg=76 WHERE id=807; -- Neira
       UPDATE sip_municipio SET codreg=78 WHERE id=819; -- Norcasia
       UPDATE sip_municipio SET codreg=79 WHERE id=869; -- Pácora
       UPDATE sip_municipio SET codreg=82 WHERE id=889; -- Palestina
       UPDATE sip_municipio SET codreg=85 WHERE id=909; -- Pensilvania
       UPDATE sip_municipio SET codreg=103 WHERE id=1024; -- Riosucio
       UPDATE sip_municipio SET codreg=106 WHERE id=1032; -- Risaralda
       UPDATE sip_municipio SET codreg=109 WHERE id=1060; -- Salamina
       UPDATE sip_municipio SET codreg=115 WHERE id=1077; -- Samaná
       UPDATE sip_municipio SET codreg=120 WHERE id=1082; -- San José
       UPDATE sip_municipio SET codreg=124 WHERE id=1252; -- Supía
       UPDATE sip_municipio SET codreg=127 WHERE id=1384; -- Victoria
       UPDATE sip_municipio SET codreg=130 WHERE id=1393; -- Villamaría
       UPDATE sip_municipio SET codreg=133 WHERE id=1400; -- Viterbo
  
  
       -- Caquetá (15)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=33; -- Florencia
       UPDATE sip_municipio SET codreg=2 WHERE id=494; -- Albania
       UPDATE sip_municipio SET codreg=3 WHERE id=215; -- Cartagena Del Chairá
       UPDATE sip_municipio SET codreg=4 WHERE id=1457; -- Belén De Los Andaquíes
       UPDATE sip_municipio SET codreg=5 WHERE id=428; -- El Doncello
       UPDATE sip_municipio SET codreg=6 WHERE id=447; -- El Paujíl
       UPDATE sip_municipio SET codreg=7 WHERE id=712; -- La Montañita
       UPDATE sip_municipio SET codreg=9 WHERE id=977; -- Puerto Rico
       UPDATE sip_municipio SET codreg=10 WHERE id=1214; -- San Vicente Del Caguán
       UPDATE sip_municipio SET codreg=12 WHERE id=341; -- Curillo
       UPDATE sip_municipio SET codreg=16 WHERE id=776; -- Milán
       UPDATE sip_municipio SET codreg=17 WHERE id=798; -- Morelia
       UPDATE sip_municipio SET codreg=20 WHERE id=1021; -- San José Del Fragua
       UPDATE sip_municipio SET codreg=22 WHERE id=1220; -- Solano
       UPDATE sip_municipio SET codreg=24 WHERE id=1262; -- Solita
       UPDATE sip_municipio SET codreg=40 WHERE id=1374; -- Valparaíso
  
  
  
       -- Casanare (51)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=58; -- Yopal
       UPDATE sip_municipio SET codreg=40 WHERE id=59; -- Aguazul
       UPDATE sip_municipio SET codreg=120 WHERE id=202; -- Chámeza
       UPDATE sip_municipio SET codreg=320 WHERE id=141; -- Hato Corozal
       UPDATE sip_municipio SET codreg=480 WHERE id=173; -- La Salina
       UPDATE sip_municipio SET codreg=520 WHERE id=177; -- Maní
       UPDATE sip_municipio SET codreg=540 WHERE id=240; -- Monterrey
       UPDATE sip_municipio SET codreg=560 WHERE id=386; -- Nunchía
       UPDATE sip_municipio SET codreg=640 WHERE id=397; -- Orocué
       UPDATE sip_municipio SET codreg=700 WHERE id=460; -- Pore
       UPDATE sip_municipio SET codreg=760 WHERE id=483; -- Recetor
       UPDATE sip_municipio SET codreg=800 WHERE id=542; -- Sabanalarga
       UPDATE sip_municipio SET codreg=815 WHERE id=558; -- Sácama
       UPDATE sip_municipio SET codreg=830 WHERE id=585; -- San Luis De Palenque
       UPDATE sip_municipio SET codreg=840 WHERE id=697; -- Támara
       UPDATE sip_municipio SET codreg=850 WHERE id=713; -- Tauramena
       UPDATE sip_municipio SET codreg=865 WHERE id=743; -- Trinidad
       UPDATE sip_municipio SET codreg=880 WHERE id=756; -- Villanueva
  
       UPDATE sip_municipio SET codreg=680 WHERE id=443; -- Villanueva
  
       -- Cauca (17)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=46; -- Popayán
       UPDATE sip_municipio SET codreg=4 WHERE id=372; -- Almaguer
       UPDATE sip_municipio SET codreg=5 WHERE id=847; -- Argelia
       UPDATE sip_municipio SET codreg=6 WHERE id=1211; -- Balboa
       UPDATE sip_municipio SET codreg=7 WHERE id=77; -- Bolívar
       UPDATE sip_municipio SET codreg=10 WHERE id=108; -- Buenos Aires
       UPDATE sip_municipio SET codreg=13 WHERE id=164; -- Cajibío
       UPDATE sip_municipio SET codreg=16 WHERE id=174; -- Caldono
       UPDATE sip_municipio SET codreg=19 WHERE id=192; -- Caloto
       UPDATE sip_municipio SET codreg=22 WHERE id=360; -- Corinto
       UPDATE sip_municipio SET codreg=25 WHERE id=449; -- El Tambo
       UPDATE sip_municipio SET codreg=27 WHERE id=496; -- Florencia
       UPDATE sip_municipio SET codreg=28 WHERE id=566; -- Guapi
       UPDATE sip_municipio SET codreg=29 WHERE id=540; -- Guachené
       UPDATE sip_municipio SET codreg=31 WHERE id=610; -- Inzá
       UPDATE sip_municipio SET codreg=34 WHERE id=621; -- Jambaló
       UPDATE sip_municipio SET codreg=37 WHERE id=657; -- La Sierra
       UPDATE sip_municipio SET codreg=40 WHERE id=661; -- La Vega
       UPDATE sip_municipio SET codreg=46 WHERE id=770; -- Mercaderes
       UPDATE sip_municipio SET codreg=49 WHERE id=773; -- Miranda
       UPDATE sip_municipio SET codreg=52 WHERE id=792; -- Morales
       UPDATE sip_municipio SET codreg=53 WHERE id=868; -- Padilla
       UPDATE sip_municipio SET codreg=60 WHERE id=900; -- Piamonte
       UPDATE sip_municipio SET codreg=64 WHERE id=956; -- Puerto Tejada
       UPDATE sip_municipio SET codreg=70 WHERE id=1040; -- Rosas
       UPDATE sip_municipio SET codreg=73 WHERE id=1146; -- San Sebastián
       UPDATE sip_municipio SET codreg=76 WHERE id=1152; -- Santander De Quilichao
       UPDATE sip_municipio SET codreg=79 WHERE id=1175; -- Santa Rosa
       UPDATE sip_municipio SET codreg=82 WHERE id=1203; -- Silvia
       UPDATE sip_municipio SET codreg=86 WHERE id=1263; -- Sucre
       UPDATE sip_municipio SET codreg=87 WHERE id=1259; -- Suárez
       UPDATE sip_municipio SET codreg=88 WHERE id=1315; -- Timbío
       UPDATE sip_municipio SET codreg=91 WHERE id=1317; -- Timbiquí
       UPDATE sip_municipio SET codreg=94 WHERE id=1334; -- Toribío
       UPDATE sip_municipio SET codreg=97 WHERE id=1339; -- Totoró
       UPDATE sip_municipio SET codreg=98 WHERE id=1360; -- Villa Rica
  
  
       UPDATE sip_municipio SET codreg=43 WHERE id=723; -- López de Micay
       UPDATE sip_municipio SET codreg=55 WHERE id=873; -- Páez
       UPDATE sip_municipio SET codreg=58 WHERE id=898; -- Patía
       UPDATE sip_municipio SET codreg=61 WHERE id=916 ; -- Piendamó - Tunía
       UPDATE sip_municipio SET codreg=67 WHERE id=970; --  Puracé
       UPDATE sip_municipio SET codreg=85 WHERE id=1230; -- 
  
       -- Cesar (20)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=55; -- Valledupar
       UPDATE sip_municipio SET codreg=75 WHERE id=88; -- Aguachica
       UPDATE sip_municipio SET codreg=150 WHERE id=149; -- Agustín Codazzi
       UPDATE sip_municipio SET codreg=170 WHERE id=571; -- Astrea
       UPDATE sip_municipio SET codreg=180 WHERE id=768; -- Becerril
       UPDATE sip_municipio SET codreg=200 WHERE id=1011; -- Bosconia
       UPDATE sip_municipio SET codreg=225 WHERE id=391; -- Curumaní
       UPDATE sip_municipio SET codreg=300 WHERE id=261; -- Chimichagua
       UPDATE sip_municipio SET codreg=375 WHERE id=266; -- Chiriguaná
       UPDATE sip_municipio SET codreg=410 WHERE id=410; -- El Copey
       UPDATE sip_municipio SET codreg=415 WHERE id=440; -- El Paso
       UPDATE sip_municipio SET codreg=450 WHERE id=501; -- Gamarra
       UPDATE sip_municipio SET codreg=525 WHERE id=551; -- González
       UPDATE sip_municipio SET codreg=600 WHERE id=649; -- La Gloria
       UPDATE sip_municipio SET codreg=608 WHERE id=691; -- La Jagua De Ibirico
       UPDATE sip_municipio SET codreg=650 WHERE id=872; -- Pailitas
       UPDATE sip_municipio SET codreg=700 WHERE id=924; -- Pelaya
       UPDATE sip_municipio SET codreg=720 WHERE id=943; -- Pueblo Bello
       UPDATE sip_municipio SET codreg=750 WHERE id=1025; -- Río De Oro
       UPDATE sip_municipio SET codreg=800 WHERE id=1181; -- San Alberto
       UPDATE sip_municipio SET codreg=825 WHERE id=1035; -- La Paz
       UPDATE sip_municipio SET codreg=850 WHERE id=1213; -- San Diego
       UPDATE sip_municipio SET codreg=875 WHERE id=1239; -- San Martín
       UPDATE sip_municipio SET codreg=900 WHERE id=1267; -- Tamalameque
       
       UPDATE sip_municipio SET codreg=625 WHERE id=760; -- MANAURE BALCÓN DEL CESAR
  
  
       -- Chocó (29)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=48; -- Quibdó
       UPDATE sip_municipio SET codreg=4 WHERE id=987; -- Acandí
       UPDATE sip_municipio SET codreg=7 WHERE id=1192; -- Bagadó
       UPDATE sip_municipio SET codreg=13 WHERE id=340; -- Condoto
       UPDATE sip_municipio SET codreg=14 WHERE id=234; -- Cértegui
       UPDATE sip_municipio SET codreg=15 WHERE id=213; -- Carmen Del Darién
       UPDATE sip_municipio SET codreg=19 WHERE id=618; -- Istmina
       UPDATE sip_municipio SET codreg=22 WHERE id=633; -- Juradó
       UPDATE sip_municipio SET codreg=25 WHERE id=717; -- Lloró
       UPDATE sip_municipio SET codreg=27 WHERE id=769; -- Medio San Juan
       UPDATE sip_municipio SET codreg=28 WHERE id=816; -- Nóvita
       UPDATE sip_municipio SET codreg=31 WHERE id=820; -- Nuquí
       UPDATE sip_municipio SET codreg=32 WHERE id=967; -- Río Iró
       UPDATE sip_municipio SET codreg=34 WHERE id=1028; -- Riosucio
       UPDATE sip_municipio SET codreg=37 WHERE id=1075; -- San José Del Palmar
       UPDATE sip_municipio SET codreg=38 WHERE id=439; -- El Litoral Del San Juan
       UPDATE sip_municipio SET codreg=40 WHERE id=1207; -- Sipí
       UPDATE sip_municipio SET codreg=43 WHERE id=1266; -- Tadó
       UPDATE sip_municipio SET codreg=48 WHERE id=1307; -- Unguía
       
       UPDATE sip_municipio SET codreg=8 WHERE id=1210; -- BAHÍA SOLANO
  
       UPDATE sip_municipio SET codreg=6 WHERE id=432; -- Alto Baudó
       UPDATE sip_municipio SET codreg=2 WHERE id=848; -- Atrato
       UPDATE sip_municipio SET codreg=8 WHERE id=1210; -- Bahía Solano
       UPDATE sip_municipio SET codreg=10 WHERE id=1237; -- Bajo Baudó
       UPDATE sip_municipio SET codreg=11 WHERE id=1465; -- Bojayá
       UPDATE sip_municipio SET codreg=17 WHERE id=172; -- El Cantón Del San Pablo
       UPDATE sip_municipio SET codreg=16 WHERE id=423; -- El Carmen De Atrato
       UPDATE sip_municipio SET codreg=12 WHERE id=733; -- Medio Atrato
       UPDATE sip_municipio SET codreg=26 WHERE id=742; -- Medio Baudó
       UPDATE sip_municipio SET codreg=35 WHERE id=1012; -- Río Quito
       UPDATE sip_municipio SET codreg=60 WHERE id=1323; -- Unión Panamericana
  
  
  
       -- Córdoba (24)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=41; -- Montería
       UPDATE sip_municipio SET codreg=4 WHERE id=1117; -- Ayapel
       UPDATE sip_municipio SET codreg=7 WHERE id=1273; -- Buenavista
       UPDATE sip_municipio SET codreg=9 WHERE id=1451; -- Canalete
       UPDATE sip_municipio SET codreg=10 WHERE id=237; -- Cereté
       UPDATE sip_municipio SET codreg=13 WHERE id=284; -- Ciénaga De Oro
       UPDATE sip_municipio SET codreg=16 WHERE id=244; -- Chimá
       UPDATE sip_municipio SET codreg=19 WHERE id=278; -- Chinú
       UPDATE sip_municipio SET codreg=22 WHERE id=718; -- Lorica
       UPDATE sip_municipio SET codreg=23 WHERE id=724; -- Los Córdobas
       UPDATE sip_municipio SET codreg=24 WHERE id=781; -- Momil
       UPDATE sip_municipio SET codreg=25 WHERE id=784; -- Montelíbano
       UPDATE sip_municipio SET codreg=27 WHERE id=849; -- Moñitos
       UPDATE sip_municipio SET codreg=28 WHERE id=930; -- Planeta Rica
       UPDATE sip_municipio SET codreg=31 WHERE id=944; -- Pueblo Nuevo
       UPDATE sip_municipio SET codreg=32 WHERE id=963; -- Puerto Libertador
       UPDATE sip_municipio SET codreg=33 WHERE id=957; -- Puerto Escondido
       UPDATE sip_municipio SET codreg=37 WHERE id=1071; -- Sahagún
       UPDATE sip_municipio SET codreg=40 WHERE id=1093; -- San Andrés De Sotavento
       UPDATE sip_municipio SET codreg=43 WHERE id=1099; -- San Antero
       UPDATE sip_municipio SET codreg=46 WHERE id=1107; -- San Bernardo Del Viento
       UPDATE sip_municipio SET codreg=49 WHERE id=1113; -- San Carlos
       UPDATE sip_municipio SET codreg=52 WHERE id=1122; -- San José De Uré
       UPDATE sip_municipio SET codreg=55 WHERE id=1132; -- San Pelayo
       UPDATE sip_municipio SET codreg=58 WHERE id=1313; -- Tierralta
       UPDATE sip_municipio SET codreg=60 WHERE id=1326; -- Tuchín
       UPDATE sip_municipio SET codreg=61 WHERE id=1368; -- Valencia
  
       UPDATE sip_municipio SET codreg=14 WHERE id=538; -- Cotorra
       UPDATE sip_municipio SET codreg=20 WHERE id=604; -- La Apartada
       UPDATE sip_municipio SET codreg=34 WHERE id=972; -- Purísima De La Concepción
  
       -- Cundinamarca (27)
  
       UPDATE sip_municipio SET codreg=4 WHERE id=6; -- Agua De Dios
       UPDATE sip_municipio SET codreg=7 WHERE id=288; -- Albán
       UPDATE sip_municipio SET codreg=10 WHERE id=603; -- Anapoima
       UPDATE sip_municipio SET codreg=13 WHERE id=689; -- Anolaima
       UPDATE sip_municipio SET codreg=16 WHERE id=893; -- Arbeláez
       UPDATE sip_municipio SET codreg=19 WHERE id=1373; -- Beltrán
       UPDATE sip_municipio SET codreg=22 WHERE id=1458; -- Bituima
       UPDATE sip_municipio SET codreg=25 WHERE id=1464; -- Bojacá
       UPDATE sip_municipio SET codreg=29 WHERE id=131; -- Cabrera
       UPDATE sip_municipio SET codreg=30 WHERE id=135; -- Cachipay
       UPDATE sip_municipio SET codreg=31 WHERE id=142; -- Cajicá
       UPDATE sip_municipio SET codreg=34 WHERE id=198; -- Caparrapí
       UPDATE sip_municipio SET codreg=37 WHERE id=217; -- Cáqueza
       UPDATE sip_municipio SET codreg=40 WHERE id=221; -- Carmen De Carupa
       UPDATE sip_municipio SET codreg=43 WHERE id=334; -- Cogua
       UPDATE sip_municipio SET codreg=46 WHERE id=363; -- Cota
       UPDATE sip_municipio SET codreg=49 WHERE id=385; -- Cucunubá
       UPDATE sip_municipio SET codreg=52 WHERE id=242; -- Chaguaní
       UPDATE sip_municipio SET codreg=55 WHERE id=262; -- Chía
       UPDATE sip_municipio SET codreg=58 WHERE id=265; -- Chipaque
       UPDATE sip_municipio SET codreg=61 WHERE id=277; -- Choachí
       UPDATE sip_municipio SET codreg=64 WHERE id=280; -- Chocontá
       UPDATE sip_municipio SET codreg=67 WHERE id=425; -- El Colegio
       UPDATE sip_municipio SET codreg=70 WHERE id=450; -- El Peñón
       UPDATE sip_municipio SET codreg=72 WHERE id=456; -- El Rosal
       UPDATE sip_municipio SET codreg=76 WHERE id=469; -- Facatativá
       UPDATE sip_municipio SET codreg=79 WHERE id=482; -- Fómeque
       UPDATE sip_municipio SET codreg=85 WHERE id=485; -- Fosca
       UPDATE sip_municipio SET codreg=88 WHERE id=489; -- Funza
       UPDATE sip_municipio SET codreg=91 WHERE id=493; -- Fúquene
       UPDATE sip_municipio SET codreg=94 WHERE id=497; -- Fusagasugá
       UPDATE sip_municipio SET codreg=97 WHERE id=498; -- Gachalá
       UPDATE sip_municipio SET codreg=100 WHERE id=500; -- Gachancipá
       UPDATE sip_municipio SET codreg=103 WHERE id=505; -- Gachetá
       UPDATE sip_municipio SET codreg=106 WHERE id=508; -- Gama
       UPDATE sip_municipio SET codreg=109 WHERE id=547; -- Girardot
       UPDATE sip_municipio SET codreg=112 WHERE id=560; -- Guachetá
       UPDATE sip_municipio SET codreg=115 WHERE id=573; -- Guaduas
       UPDATE sip_municipio SET codreg=118 WHERE id=578; -- Guasca
       UPDATE sip_municipio SET codreg=121 WHERE id=581; -- Guataquí
       UPDATE sip_municipio SET codreg=124 WHERE id=586; -- Guatavita
       UPDATE sip_municipio SET codreg=127 WHERE id=588; -- Guayabal De Síquima
       UPDATE sip_municipio SET codreg=128 WHERE id=591; -- Guayabetal
       UPDATE sip_municipio SET codreg=130 WHERE id=592; -- Gutiérrez
       UPDATE sip_municipio SET codreg=132 WHERE id=553; -- Granada
       UPDATE sip_municipio SET codreg=133 WHERE id=627; -- Jerusalén
       UPDATE sip_municipio SET codreg=136 WHERE id=632; -- Junín
       UPDATE sip_municipio SET codreg=139 WHERE id=636; -- La Calera
       UPDATE sip_municipio SET codreg=142 WHERE id=653; -- La Mesa
       UPDATE sip_municipio SET codreg=145 WHERE id=658; -- La Palma
       UPDATE sip_municipio SET codreg=148 WHERE id=662; -- La Peña
       UPDATE sip_municipio SET codreg=151 WHERE id=700; -- La Vega
       UPDATE sip_municipio SET codreg=154 WHERE id=708; -- Lenguazaque
       UPDATE sip_municipio SET codreg=157 WHERE id=734; -- Machetá
       UPDATE sip_municipio SET codreg=160 WHERE id=739; -- Madrid
       UPDATE sip_municipio SET codreg=163 WHERE id=750; -- Manta
       UPDATE sip_municipio SET codreg=166 WHERE id=751; -- Medina
       UPDATE sip_municipio SET codreg=169 WHERE id=794; -- Mosquera
       UPDATE sip_municipio SET codreg=172 WHERE id=803; -- Nariño
       UPDATE sip_municipio SET codreg=175 WHERE id=808; -- Nemocón
       UPDATE sip_municipio SET codreg=178 WHERE id=809; -- Nilo
       UPDATE sip_municipio SET codreg=181 WHERE id=810; -- Nimaima
       UPDATE sip_municipio SET codreg=184 WHERE id=815; -- Nocaima
       UPDATE sip_municipio SET codreg=190 WHERE id=867; -- Pacho
       UPDATE sip_municipio SET codreg=193 WHERE id=875; -- Paime
       UPDATE sip_municipio SET codreg=196 WHERE id=891; -- Pandi
       UPDATE sip_municipio SET codreg=199 WHERE id=902; -- Pasca
       UPDATE sip_municipio SET codreg=202 WHERE id=950; -- Puerto Salgar
       UPDATE sip_municipio SET codreg=205 WHERE id=964; -- Pulí
       UPDATE sip_municipio SET codreg=208 WHERE id=978; -- Quebradanegra
       UPDATE sip_municipio SET codreg=211 WHERE id=979; -- Quetame
       UPDATE sip_municipio SET codreg=214 WHERE id=982; -- Quipile
       UPDATE sip_municipio SET codreg=217 WHERE id=983; -- Apulo
       UPDATE sip_municipio SET codreg=218 WHERE id=1022; -- Ricaurte
       UPDATE sip_municipio SET codreg=220 WHERE id=1050; -- San Antonio Del Tequendama
       UPDATE sip_municipio SET codreg=223 WHERE id=1054; -- San Bernardo
       UPDATE sip_municipio SET codreg=226 WHERE id=1061; -- San Cayetano
       UPDATE sip_municipio SET codreg=229 WHERE id=1067; -- San Francisco
       UPDATE sip_municipio SET codreg=232 WHERE id=1078; -- San Juan De Rioseco
       UPDATE sip_municipio SET codreg=235 WHERE id=1185; -- Sasaima
       UPDATE sip_municipio SET codreg=238 WHERE id=1195; -- Sesquilé
       UPDATE sip_municipio SET codreg=239 WHERE id=1199; -- Sibaté
       UPDATE sip_municipio SET codreg=241 WHERE id=1202; -- Silvania
       UPDATE sip_municipio SET codreg=244 WHERE id=1206; -- Simijaca
       UPDATE sip_municipio SET codreg=247 WHERE id=1216; -- Soacha
       UPDATE sip_municipio SET codreg=250 WHERE id=1225; -- Sopó
       UPDATE sip_municipio SET codreg=256 WHERE id=1236; -- Subachoque
       UPDATE sip_municipio SET codreg=259 WHERE id=1245; -- Suesca
       UPDATE sip_municipio SET codreg=262 WHERE id=1251; -- Supatá
       UPDATE sip_municipio SET codreg=265 WHERE id=1254; -- Susa
       UPDATE sip_municipio SET codreg=268 WHERE id=1261; -- Sutatausa
       UPDATE sip_municipio SET codreg=271 WHERE id=1264; -- Tabio
       UPDATE sip_municipio SET codreg=274 WHERE id=1278; -- Tausa
       UPDATE sip_municipio SET codreg=277 WHERE id=1280; -- Tena
       UPDATE sip_municipio SET codreg=280 WHERE id=1286; -- Tenjo
       UPDATE sip_municipio SET codreg=283 WHERE id=1310; -- Tibacuy
       UPDATE sip_municipio SET codreg=286 WHERE id=1312; -- Tibirita
       UPDATE sip_municipio SET codreg=289 WHERE id=1325; -- Tocaima
       UPDATE sip_municipio SET codreg=292 WHERE id=1328; -- Tocancipá
       UPDATE sip_municipio SET codreg=295 WHERE id=1337; -- Topaipí
       UPDATE sip_municipio SET codreg=298 WHERE id=1353; -- Ubalá
       UPDATE sip_municipio SET codreg=301 WHERE id=1354; -- Ubaque
       UPDATE sip_municipio SET codreg=268 WHERE id=1261; -- Sutatausa
       UPDATE sip_municipio SET codreg=271 WHERE id=1264; -- Tabio
       UPDATE sip_municipio SET codreg=274 WHERE id=1278; -- Tausa
       UPDATE sip_municipio SET codreg=277 WHERE id=1280; -- Tena
       UPDATE sip_municipio SET codreg=280 WHERE id=1286; -- Tenjo
       UPDATE sip_municipio SET codreg=283 WHERE id=1310; -- Tibacuy
       UPDATE sip_municipio SET codreg=286 WHERE id=1312; -- Tibirita
       UPDATE sip_municipio SET codreg=289 WHERE id=1325; -- Tocaima
       UPDATE sip_municipio SET codreg=292 WHERE id=1328; -- Tocancipá
       UPDATE sip_municipio SET codreg=295 WHERE id=1337; -- Topaipí
       UPDATE sip_municipio SET codreg=298 WHERE id=1353; -- Ubalá
       UPDATE sip_municipio SET codreg=301 WHERE id=1354; -- Ubaque
       UPDATE sip_municipio SET codreg=307 WHERE id=1359; -- Une
       UPDATE sip_municipio SET codreg=316 WHERE id=1364; -- Útica
       UPDATE sip_municipio SET codreg=318 WHERE id=857; -- Venecia
       UPDATE sip_municipio SET codreg=319 WHERE id=1379; -- Vergara
       UPDATE sip_municipio SET codreg=322 WHERE id=1383; -- Vianí
       UPDATE sip_municipio SET codreg=323 WHERE id=1389; -- Villagómez
       UPDATE sip_municipio SET codreg=325 WHERE id=1395; -- Villapinzón
       UPDATE sip_municipio SET codreg=328 WHERE id=1399; -- Villeta
       UPDATE sip_municipio SET codreg=331 WHERE id=1401; -- Viotá
       UPDATE sip_municipio SET codreg=334 WHERE id=1410; -- Yacopí
       UPDATE sip_municipio SET codreg=337 WHERE id=1429; -- Zipacón
       UPDATE sip_municipio SET codreg=340 WHERE id=1430; -- Zipaquirá
  
       UPDATE sip_municipio SET codreg=198 WHERE id=895; -- PARATEBUENO | 25530
       UPDATE sip_municipio SET codreg=304 WHERE id=1357; -- VILLA DE SAN DIEGO DE UBATÉ | 25843
  
       -- Guainía (56)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=35; -- Inírida
       UPDATE sip_municipio SET codreg=70 WHERE id=594; -- Barrancominas
       UPDATE sip_municipio SET codreg=73 WHERE id=1414; -- Cacahual
       UPDATE sip_municipio SET codreg=78 WHERE id=1408; -- La Guadalupe
       UPDATE sip_municipio SET codreg=90 WHERE id=1407; -- Puerto Colombia
       UPDATE sip_municipio SET codreg=92 WHERE id=1406; -- San Felipe
  
        UPDATE sip_municipio SET codreg=83 WHERE id=1417; -- MORICHAL | 94888
        UPDATE sip_municipio SET codreg=87 WHERE id=1415; -- PANA PANA | 94887
  
       -- Guaviare (57)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=51; -- San José Del Guaviare
       UPDATE sip_municipio SET codreg=3 WHERE id=201; -- Calamar
       UPDATE sip_municipio SET codreg=7 WHERE id=433; -- El Retorno
       UPDATE sip_municipio SET codreg=12 WHERE id=335; -- Miraflores
  
       -- Huila (32)
       UPDATE sip_municipio SET codreg=1 WHERE id=42; -- Neiva
       UPDATE sip_municipio SET codreg=4 WHERE id=988; -- Acevedo
       UPDATE sip_municipio SET codreg=7 WHERE id=146; -- Agrado
       UPDATE sip_municipio SET codreg=10 WHERE id=223; -- Aipe
       UPDATE sip_municipio SET codreg=13 WHERE id=326; -- Algeciras
       UPDATE sip_municipio SET codreg=16 WHERE id=453; -- Altamira
       UPDATE sip_municipio SET codreg=19 WHERE id=1256; -- Baraya
       UPDATE sip_municipio SET codreg=22 WHERE id=169; -- Campoalegre
       UPDATE sip_municipio SET codreg=28 WHERE id=342; -- Colombia
       UPDATE sip_municipio SET codreg=31 WHERE id=420; -- Elías
       UPDATE sip_municipio SET codreg=34 WHERE id=506; -- Garzón
       UPDATE sip_municipio SET codreg=37 WHERE id=544; -- Gigante
       UPDATE sip_municipio SET codreg=40 WHERE id=569; -- Guadalupe
       UPDATE sip_municipio SET codreg=43 WHERE id=600; -- Hobo
       UPDATE sip_municipio SET codreg=44 WHERE id=613; -- Isnos
       UPDATE sip_municipio SET codreg=46 WHERE id=612; -- Íquira
       UPDATE sip_municipio SET codreg=49 WHERE id=659; -- La Plata
       UPDATE sip_municipio SET codreg=50 WHERE id=806; -- Nátaga
       UPDATE sip_municipio SET codreg=51 WHERE id=854; -- Oporapa
       UPDATE sip_municipio SET codreg=52 WHERE id=874; -- Paicol
       UPDATE sip_municipio SET codreg=55 WHERE id=888; -- Palermo
       UPDATE sip_municipio SET codreg=56 WHERE id=894; -- Palestina
       UPDATE sip_municipio SET codreg=58 WHERE id=918; -- Pital
       UPDATE sip_municipio SET codreg=61 WHERE id=926; -- Pitalito
       UPDATE sip_municipio SET codreg=37 WHERE id=544; -- Gigante
       UPDATE sip_municipio SET codreg=40 WHERE id=569; -- Guadalupe
       UPDATE sip_municipio SET codreg=43 WHERE id=600; -- Hobo
       UPDATE sip_municipio SET codreg=44 WHERE id=613; -- Isnos
       UPDATE sip_municipio SET codreg=46 WHERE id=612; -- Íquira
       UPDATE sip_municipio SET codreg=49 WHERE id=659; -- La Plata
       UPDATE sip_municipio SET codreg=50 WHERE id=806; -- Nátaga
       UPDATE sip_municipio SET codreg=51 WHERE id=854; -- Oporapa
       UPDATE sip_municipio SET codreg=52 WHERE id=874; -- Paicol
       UPDATE sip_municipio SET codreg=55 WHERE id=888; -- Palermo
       UPDATE sip_municipio SET codreg=56 WHERE id=894; -- Palestina
       UPDATE sip_municipio SET codreg=58 WHERE id=918; -- Pital
       UPDATE sip_municipio SET codreg=61 WHERE id=926; -- Pitalito
       UPDATE sip_municipio SET codreg=64 WHERE id=1029; -- Rivera
       UPDATE sip_municipio SET codreg=67 WHERE id=1072; -- Saladoblanco
       UPDATE sip_municipio SET codreg=70 WHERE id=1088; -- San Agustín
       UPDATE sip_municipio SET codreg=74 WHERE id=1110; -- Santa María
       UPDATE sip_municipio SET codreg=76 WHERE id=1242; -- Suaza
       UPDATE sip_municipio SET codreg=79 WHERE id=1276; -- Tarqui
       UPDATE sip_municipio SET codreg=82 WHERE id=1285; -- Tello
       UPDATE sip_municipio SET codreg=85 WHERE id=1308; -- Teruel
       UPDATE sip_municipio SET codreg=88 WHERE id=1314; -- Timaná
       UPDATE sip_municipio SET codreg=91 WHERE id=1391; -- Villavieja
       UPDATE sip_municipio SET codreg=94 WHERE id=1412; -- Yaguará
  
       UPDATE sip_municipio SET codreg=47 WHERE id=641; -- LA ARGENTINA | 41378
       UPDATE sip_municipio SET codreg=25 WHERE id=1281; -- TESALIA | 41797
  
       -- La Guajira (33)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=49; -- Riohacha
       UPDATE sip_municipio SET codreg=2 WHERE id=602; -- Albania
       UPDATE sip_municipio SET codreg=4 WHERE id=1257; -- Barrancas
       UPDATE sip_municipio SET codreg=5 WHERE id=1452; -- Dibulla
       UPDATE sip_municipio SET codreg=6 WHERE id=110; -- El Molino
       UPDATE sip_municipio SET codreg=7 WHERE id=481; -- Fonseca
       UPDATE sip_municipio SET codreg=8 WHERE id=1461; -- Distracción
       UPDATE sip_municipio SET codreg=9 WHERE id=640; -- Hatonuevo
       UPDATE sip_municipio SET codreg=10 WHERE id=741; -- Maicao
       UPDATE sip_municipio SET codreg=11 WHERE id=933; -- Manaure
       UPDATE sip_municipio SET codreg=12 WHERE id=728; -- La Jagua Del Pilar
       UPDATE sip_municipio SET codreg=13 WHERE id=1058; -- San Juan Del Cesar
       UPDATE sip_municipio SET codreg=16 WHERE id=1361; -- Uribia
       UPDATE sip_municipio SET codreg=18 WHERE id=1367; -- Urumita
       UPDATE sip_municipio SET codreg=20 WHERE id=1398; -- Villanueva
  
       -- Magdalena (34)
       UPDATE sip_municipio SET codreg=1 WHERE id=52; -- Santa Marta
       UPDATE sip_municipio SET codreg=8 WHERE id=534; -- Algarrobo
       UPDATE sip_municipio SET codreg=10 WHERE id=892; -- Aracataca
       UPDATE sip_municipio SET codreg=13 WHERE id=236; -- Cerro De San Antonio
       UPDATE sip_municipio SET codreg=15 WHERE id=254; -- Chivolo
       UPDATE sip_municipio SET codreg=16 WHERE id=285; -- Ciénaga
       UPDATE sip_municipio SET codreg=20 WHERE id=339; -- Concordia
       UPDATE sip_municipio SET codreg=25 WHERE id=421; -- El Banco
       UPDATE sip_municipio SET codreg=28 WHERE id=451; -- El Piñón
       UPDATE sip_municipio SET codreg=30 WHERE id=467; -- El Retén
       UPDATE sip_municipio SET codreg=31 WHERE id=492; -- Fundación
       UPDATE sip_municipio SET codreg=40 WHERE id=564; -- Guamal
       UPDATE sip_municipio SET codreg=42 WHERE id=778; -- Nueva Granada
       UPDATE sip_municipio SET codreg=46 WHERE id=908; -- Pedraza
       UPDATE sip_municipio SET codreg=48 WHERE id=913; -- Pijiño Del Carmen
       UPDATE sip_municipio SET codreg=49 WHERE id=927; -- Pivijay
       UPDATE sip_municipio SET codreg=52 WHERE id=931; -- Plato
       UPDATE sip_municipio SET codreg=55 WHERE id=945; -- Puebloviejo
       UPDATE sip_municipio SET codreg=58 WHERE id=1016; -- Remolino
       UPDATE sip_municipio SET codreg=60 WHERE id=1070; -- Sabanas De San Ángel
       UPDATE sip_municipio SET codreg=67 WHERE id=1105; -- Salamina
       UPDATE sip_municipio SET codreg=70 WHERE id=1144; -- San Sebastián De Buenavista
       UPDATE sip_municipio SET codreg=73 WHERE id=1177; -- San Zenón
       UPDATE sip_municipio SET codreg=76 WHERE id=1179; -- Santa Ana
       UPDATE sip_municipio SET codreg=15 WHERE id=254; -- Chivolo
       UPDATE sip_municipio SET codreg=16 WHERE id=285; -- Ciénaga
       UPDATE sip_municipio SET codreg=20 WHERE id=339; -- Concordia
       UPDATE sip_municipio SET codreg=25 WHERE id=421; -- El Banco
       UPDATE sip_municipio SET codreg=28 WHERE id=451; -- El Piñón
       UPDATE sip_municipio SET codreg=30 WHERE id=467; -- El Retén
       UPDATE sip_municipio SET codreg=31 WHERE id=492; -- Fundación
       UPDATE sip_municipio SET codreg=40 WHERE id=564; -- Guamal
       UPDATE sip_municipio SET codreg=42 WHERE id=778; -- Nueva Granada
       UPDATE sip_municipio SET codreg=46 WHERE id=908; -- Pedraza
       UPDATE sip_municipio SET codreg=48 WHERE id=913; -- Pijiño Del Carmen
       UPDATE sip_municipio SET codreg=49 WHERE id=927; -- Pivijay
       UPDATE sip_municipio SET codreg=52 WHERE id=931; -- Plato
       UPDATE sip_municipio SET codreg=55 WHERE id=945; -- Puebloviejo
       UPDATE sip_municipio SET codreg=58 WHERE id=1016; -- Remolino
       UPDATE sip_municipio SET codreg=60 WHERE id=1070; -- Sabanas De San Ángel
       UPDATE sip_municipio SET codreg=67 WHERE id=1105; -- Salamina
       UPDATE sip_municipio SET codreg=70 WHERE id=1144; -- San Sebastián De Buenavista
       UPDATE sip_municipio SET codreg=73 WHERE id=1177; -- San Zenón
       UPDATE sip_municipio SET codreg=76 WHERE id=1179; -- Santa Ana
       UPDATE sip_municipio SET codreg=78 WHERE id=1186; -- Santa Bárbara De Pinto
       UPDATE sip_municipio SET codreg=79 WHERE id=1208; -- Sitionuevo
       UPDATE sip_municipio SET codreg=85 WHERE id=1283; -- Tenerife
       UPDATE sip_municipio SET codreg=90 WHERE id=1459; -- Zapayán
  
        UPDATE sip_municipio SET codreg=12 WHERE id=962; -- ARIGUANÍ | 47058
         UPDATE sip_municipio SET codreg=95 WHERE id=1462; -- ZONA BANANERA | 47980
  
  
       -- Meta (37)
       UPDATE sip_municipio SET codreg=1 WHERE id=57; -- Villavicencio
       UPDATE sip_municipio SET codreg=5 WHERE id=986; -- Acacías
       UPDATE sip_municipio SET codreg=6 WHERE id=106; -- Barranca De Upía
       UPDATE sip_municipio SET codreg=8 WHERE id=136; -- Cabuyaro
       UPDATE sip_municipio SET codreg=10 WHERE id=216; -- Castilla La Nueva
       UPDATE sip_municipio SET codreg=15 WHERE id=380; -- Cubarral
       UPDATE sip_municipio SET codreg=20 WHERE id=387; -- Cumaral
       UPDATE sip_municipio SET codreg=25 WHERE id=422; -- El Calvario
       UPDATE sip_municipio SET codreg=27 WHERE id=444; -- El Castillo
       UPDATE sip_municipio SET codreg=28 WHERE id=471; -- El Dorado
       UPDATE sip_municipio SET codreg=30 WHERE id=490; -- Fuente De Oro
       UPDATE sip_municipio SET codreg=35 WHERE id=556; -- Granada
       UPDATE sip_municipio SET codreg=40 WHERE id=565; -- Guamal
       UPDATE sip_municipio SET codreg=41 WHERE id=605; -- La Macarena
       UPDATE sip_municipio SET codreg=42 WHERE id=696; -- Lejanías
       UPDATE sip_municipio SET codreg=43 WHERE id=941; -- Puerto Gaitán
       UPDATE sip_municipio SET codreg=44 WHERE id=589; -- Mesetas
       UPDATE sip_municipio SET codreg=45 WHERE id=954; -- Puerto López
       UPDATE sip_municipio SET codreg=46 WHERE id=584; -- Mapiripán
       UPDATE sip_municipio SET codreg=47 WHERE id=771; -- Puerto Concordia
       UPDATE sip_municipio SET codreg=48 WHERE id=960; -- Puerto Lleras
       UPDATE sip_municipio SET codreg=49 WHERE id=974; -- Puerto Rico
       UPDATE sip_municipio SET codreg=50 WHERE id=1018; -- Restrepo
       UPDATE sip_municipio SET codreg=55 WHERE id=1118; -- San Carlos De Guaroa
       UPDATE sip_municipio SET codreg=58 WHERE id=1124; -- San Juan De Arama
       UPDATE sip_municipio SET codreg=59 WHERE id=1130; -- San Juanito
       UPDATE sip_municipio SET codreg=74 WHERE id=630; -- Uribe
  
       UPDATE sip_municipio SET codreg=60 WHERE id=1139; -- SAN MARTÍN | 50689
       UPDATE sip_municipio SET codreg=80 WHERE id=1182; -- VISTAHERMOSA | 50711
  
       -- Nariño (38)
       UPDATE sip_municipio SET codreg=1 WHERE id=44; -- Pasto
       UPDATE sip_municipio SET codreg=7 WHERE id=371; -- Aldana
       UPDATE sip_municipio SET codreg=10 WHERE id=614; -- Ancuya
       UPDATE sip_municipio SET codreg=16 WHERE id=1270; -- Barbacoas
       UPDATE sip_municipio SET codreg=17 WHERE id=1341; -- Belén
       UPDATE sip_municipio SET codreg=19 WHERE id=109; -- Buesaco
       UPDATE sip_municipio SET codreg=25 WHERE id=346; -- Consacá
       UPDATE sip_municipio SET codreg=28 WHERE id=356; -- Contadero
       UPDATE sip_municipio SET codreg=31 WHERE id=366; -- Córdoba
       UPDATE sip_municipio SET codreg=37 WHERE id=390; -- Cumbal
       UPDATE sip_municipio SET codreg=38 WHERE id=415; -- Chachagüí
       UPDATE sip_municipio SET codreg=39 WHERE id=400; -- Cumbitara
       UPDATE sip_municipio SET codreg=40 WHERE id=448; -- El Rosario
       UPDATE sip_municipio SET codreg=41 WHERE id=437; -- El Charco
       UPDATE sip_municipio SET codreg=44 WHERE id=445; -- El Peñol
       UPDATE sip_municipio SET codreg=46 WHERE id=457; -- El Tambo
       UPDATE sip_municipio SET codreg=49 WHERE id=491; -- Funes
       UPDATE sip_municipio SET codreg=52 WHERE id=561; -- Guachucal
       UPDATE sip_municipio SET codreg=55 WHERE id=574; -- Guaitarilla
       UPDATE sip_municipio SET codreg=58 WHERE id=580; -- Gualmatán
       UPDATE sip_municipio SET codreg=61 WHERE id=607; -- Iles
       UPDATE sip_municipio SET codreg=64 WHERE id=609; -- Imués
       UPDATE sip_municipio SET codreg=67 WHERE id=611; -- Ipiales
       UPDATE sip_municipio SET codreg=73 WHERE id=642; -- La Cruz
       UPDATE sip_municipio SET codreg=76 WHERE id=647; -- La Florida
       UPDATE sip_municipio SET codreg=77 WHERE id=651; -- La Llanada
       UPDATE sip_municipio SET codreg=78 WHERE id=656; -- La Tola
       UPDATE sip_municipio SET codreg=79 WHERE id=664; -- La Unión
       UPDATE sip_municipio SET codreg=80 WHERE id=704; -- Leiva
       UPDATE sip_municipio SET codreg=82 WHERE id=715; -- Linares
       UPDATE sip_municipio SET codreg=94 WHERE id=795; -- Mosquera
       UPDATE sip_municipio SET codreg=95 WHERE id=813; -- Olaya Herrera
       UPDATE sip_municipio SET codreg=96 WHERE id=802; -- Nariño
       UPDATE sip_municipio SET codreg=97 WHERE id=856; -- Ospina
       UPDATE sip_municipio SET codreg=98 WHERE id=906; -- Policarpa
       UPDATE sip_municipio SET codreg=100 WHERE id=935; -- Potosí
       UPDATE sip_municipio SET codreg=101 WHERE id=939; -- Providencia
       UPDATE sip_municipio SET codreg=103 WHERE id=951; -- Puerres
       UPDATE sip_municipio SET codreg=106 WHERE id=969; -- Pupiales
       UPDATE sip_municipio SET codreg=109 WHERE id=1023; -- Ricaurte
       UPDATE sip_municipio SET codreg=115 WHERE id=1111; -- Samaniego
       UPDATE sip_municipio SET codreg=118 WHERE id=1125; -- Sandoná
       UPDATE sip_municipio SET codreg=120 WHERE id=1128; -- San Bernardo
       UPDATE sip_municipio SET codreg=121 WHERE id=1136; -- San Lorenzo
       UPDATE sip_municipio SET codreg=123 WHERE id=1148; -- San Pedro De Cartago
       UPDATE sip_municipio SET codreg=124 WHERE id=1145; -- San Pablo
       UPDATE sip_municipio SET codreg=130 WHERE id=1188; -- Sapuyes
       UPDATE sip_municipio SET codreg=133 WHERE id=1265; -- Taminango
       UPDATE sip_municipio SET codreg=136 WHERE id=1268; -- Tangua
       UPDATE sip_municipio SET codreg=142 WHERE id=1351; -- Túquerres
       UPDATE sip_municipio SET codreg=145 WHERE id=1411; -- Yacuanquer
  
       UPDATE sip_municipio SET codreg=4 WHERE id=287; -- ALBÁN | 52019
       UPDATE sip_municipio SET codreg=13 WHERE id=861; -- ARBOLEDA | 52051
       UPDATE sip_municipio SET codreg=22 WHERE id=336; -- COLÓN | 52203
       UPDATE sip_municipio SET codreg=34 WHERE id=383; -- CUASPUD CARLOSAMA | 52224
       UPDATE sip_municipio SET codreg=43 WHERE id=452; -- EL TABLÓN DE GÓMEZ | 52258
       UPDATE sip_municipio SET codreg=47 WHERE id=879; -- FRANCISCO PIZARRO | 52520
       UPDATE sip_municipio SET codreg=85 WHERE id=719; -- LOS ANDES | 52418
       UPDATE sip_municipio SET codreg=88 WHERE id=735; -- MAGÜÍ | 52427
       UPDATE sip_municipio SET codreg=91 WHERE id=748; -- MALLAMA | 52435
       UPDATE sip_municipio SET codreg=112 WHERE id=1036; -- ROBERTO PAYÁN | 52621
       UPDATE sip_municipio SET codreg=139 WHERE id=1345; -- SAN ANDRÉS DE TUMACO | 52835
       UPDATE sip_municipio SET codreg=125 WHERE id=1149; -- SANTA BÁRBARA | 52696
       UPDATE sip_municipio SET codreg=127 WHERE id=1153; -- SANTACRUZ | 52699
  
       -- Norte de Santander (39)
       UPDATE sip_municipio SET codreg=4 WHERE id=533; -- Ábrego
       UPDATE sip_municipio SET codreg=7 WHERE id=862; -- Arboledas
       UPDATE sip_municipio SET codreg=10 WHERE id=1463; -- Bochalema
       UPDATE sip_municipio SET codreg=13 WHERE id=85; -- Bucarasica
       UPDATE sip_municipio SET codreg=16 WHERE id=140; -- Cácota
       UPDATE sip_municipio SET codreg=19 WHERE id=144; -- Cáchira
       UPDATE sip_municipio SET codreg=22 WHERE id=344; -- Convención
       UPDATE sip_municipio SET codreg=25 WHERE id=382; -- Cucutilla
       UPDATE sip_municipio SET codreg=28 WHERE id=258; -- Chinácota
       UPDATE sip_municipio SET codreg=31 WHERE id=260; -- Chitagá
       UPDATE sip_municipio SET codreg=34 WHERE id=411; -- Durania
       UPDATE sip_municipio SET codreg=36 WHERE id=442; -- El Tarra
       UPDATE sip_municipio SET codreg=37 WHERE id=424; -- El Carmen
       UPDATE sip_municipio SET codreg=38 WHERE id=458; -- El Zulia
       UPDATE sip_municipio SET codreg=40 WHERE id=554; -- Gramalote
       UPDATE sip_municipio SET codreg=43 WHERE id=595; -- Hacarí
       UPDATE sip_municipio SET codreg=46 WHERE id=598; -- Herrán
       UPDATE sip_municipio SET codreg=49 WHERE id=638; -- Labateca
       UPDATE sip_municipio SET codreg=51 WHERE id=650; -- La Esperanza
       UPDATE sip_municipio SET codreg=52 WHERE id=663; -- La Playa
       UPDATE sip_municipio SET codreg=54 WHERE id=705; -- Los Patios
       UPDATE sip_municipio SET codreg=55 WHERE id=722; -- Lourdes
       UPDATE sip_municipio SET codreg=58 WHERE id=800; -- Mutiscua
       UPDATE sip_municipio SET codreg=61 WHERE id=823; -- Ocaña
       UPDATE sip_municipio SET codreg=64 WHERE id=877; -- Pamplona
       UPDATE sip_municipio SET codreg=67 WHERE id=883; -- Pamplonita
       UPDATE sip_municipio SET codreg=69 WHERE id=928; -- Puerto Santander
       UPDATE sip_municipio SET codreg=70 WHERE id=984; -- Ragonvalia
       UPDATE sip_municipio SET codreg=73 WHERE id=1073; -- Salazar
       UPDATE sip_municipio SET codreg=76 WHERE id=1094; -- San Calixto
       UPDATE sip_municipio SET codreg=79 WHERE id=1101; -- San Cayetano
       UPDATE sip_municipio SET codreg=82 WHERE id=1119; -- Santiago
       UPDATE sip_municipio SET codreg=85 WHERE id=1189; -- Sardinata
       UPDATE sip_municipio SET codreg=88 WHERE id=1201; -- Silos
       UPDATE sip_municipio SET codreg=91 WHERE id=1306; -- Teorama
       UPDATE sip_municipio SET codreg=93 WHERE id=1320; -- Tibú
       UPDATE sip_municipio SET codreg=94 WHERE id=1330; -- Toledo
       UPDATE sip_municipio SET codreg=97 WHERE id=1388; -- Villa Caro
       UPDATE sip_municipio SET codreg=100 WHERE id=1397; -- Villa Del Rosario
  
  
       UPDATE sip_municipio SET codreg=1 WHERE id=32; -- SAN JOSÉ DE CÚCUTA | 54001
  
       -- Putumayo (52)
       UPDATE sip_municipio SET codreg=1 WHERE id=40; -- Mocoa
       UPDATE sip_municipio SET codreg=2 WHERE id=940; -- Puerto Asís
       UPDATE sip_municipio SET codreg=4 WHERE id=953; -- Puerto Leguízamo
       UPDATE sip_municipio SET codreg=7 WHERE id=370; -- Colón
       UPDATE sip_municipio SET codreg=13 WHERE id=1217; -- San Francisco
       UPDATE sip_municipio SET codreg=16 WHERE id=1228; -- Santiago
       UPDATE sip_municipio SET codreg=19 WHERE id=1209; -- Sibundoy
       UPDATE sip_municipio SET codreg=23 WHERE id=575; -- Orito
       UPDATE sip_municipio SET codreg=25 WHERE id=946; -- Puerto Guzmán
       UPDATE sip_municipio SET codreg=26 WHERE id=942; -- Puerto Caicedo
       UPDATE sip_municipio SET codreg=30 WHERE id=1409; -- Villagarzón
  
       UPDATE sip_municipio SET codreg=18 WHERE id=1222; -- SAN MIGUEL | 86757
       UPDATE sip_municipio SET codreg=28 WHERE id=1381; -- VALLE DEL GUAMUEZ | 86865
  
       -- Quindío (41)
       UPDATE sip_municipio SET codreg=1 WHERE id=19; -- Armenia
       UPDATE sip_municipio SET codreg=5 WHERE id=111; -- Buenavista
       UPDATE sip_municipio SET codreg=10 WHERE id=165; -- Calarcá
       UPDATE sip_municipio SET codreg=20 WHERE id=297; -- Circasia
       UPDATE sip_municipio SET codreg=25 WHERE id=362; -- Córdoba
       UPDATE sip_municipio SET codreg=30 WHERE id=475; -- Filandia
       UPDATE sip_municipio SET codreg=40 WHERE id=543; -- Génova
       UPDATE sip_municipio SET codreg=50 WHERE id=698; -- La Tebaida
       UPDATE sip_municipio SET codreg=60 WHERE id=790; -- Montenegro
       UPDATE sip_municipio SET codreg=70 WHERE id=917; -- Pijao
       UPDATE sip_municipio SET codreg=80 WHERE id=980; -- Quimbaya
       UPDATE sip_municipio SET codreg=90 WHERE id=1141; -- Salento
  
       -- Risaralda (42)
       UPDATE sip_municipio SET codreg=1 WHERE id=45; -- Pereira
       UPDATE sip_municipio SET codreg=8 WHERE id=767; -- Apía
       UPDATE sip_municipio SET codreg=13 WHERE id=1212; -- Balboa
       UPDATE sip_municipio SET codreg=21 WHERE id=1405; -- Belén De Umbría
       UPDATE sip_municipio SET codreg=25 WHERE id=255; -- Dosquebradas
       UPDATE sip_municipio SET codreg=29 WHERE id=568; -- Guática
       UPDATE sip_municipio SET codreg=38 WHERE id=648; -- La Celia
       UPDATE sip_municipio SET codreg=46 WHERE id=695; -- La Virginia
       UPDATE sip_municipio SET codreg=54 WHERE id=755; -- Marsella
       UPDATE sip_municipio SET codreg=62 WHERE id=774; -- Mistrató
       UPDATE sip_municipio SET codreg=70 WHERE id=947; -- Pueblo Rico
       UPDATE sip_municipio SET codreg=78 WHERE id=981; -- Quinchía
       UPDATE sip_municipio SET codreg=86 WHERE id=1123; -- Santa Rosa De Cabal
       UPDATE sip_municipio SET codreg=94 WHERE id=1137; -- Santuario
  
       -- Santander (43)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=27; -- Bucaramanga
       UPDATE sip_municipio SET codreg=4 WHERE id=147; -- Aguada
       UPDATE sip_municipio SET codreg=7 WHERE id=324; -- Albania
       UPDATE sip_municipio SET codreg=10 WHERE id=860; -- Aratoca
       UPDATE sip_municipio SET codreg=13 WHERE id=1238; -- Barbosa
       UPDATE sip_municipio SET codreg=16 WHERE id=1272; -- Barichara
       UPDATE sip_municipio SET codreg=19 WHERE id=1319; -- Barrancabermeja
       UPDATE sip_municipio SET codreg=22 WHERE id=1454; -- Betulia
       UPDATE sip_municipio SET codreg=25 WHERE id=80; -- Bolívar
       UPDATE sip_municipio SET codreg=28 WHERE id=133; -- Cabrera
       UPDATE sip_municipio SET codreg=31 WHERE id=168; -- California
       UPDATE sip_municipio SET codreg=34 WHERE id=195; -- Capitanejo
       UPDATE sip_municipio SET codreg=37 WHERE id=219; -- Carcasí
       UPDATE sip_municipio SET codreg=40 WHERE id=233; -- Cepitá
       UPDATE sip_municipio SET codreg=43 WHERE id=239; -- Cerrito
       UPDATE sip_municipio SET codreg=45 WHERE id=296; -- Cimitarra
       UPDATE sip_municipio SET codreg=46 WHERE id=345; -- Concepción
       UPDATE sip_municipio SET codreg=49 WHERE id=348; -- Confines
       UPDATE sip_municipio SET codreg=52 WHERE id=357; -- Contratación
       UPDATE sip_municipio SET codreg=55 WHERE id=367; -- Coromoro
       UPDATE sip_municipio SET codreg=58 WHERE id=392; -- Curití
       UPDATE sip_municipio SET codreg=61 WHERE id=241; -- Charalá
       UPDATE sip_municipio SET codreg=64 WHERE id=245; -- Charta
       UPDATE sip_municipio SET codreg=67 WHERE id=263; -- Chima
       UPDATE sip_municipio SET codreg=70 WHERE id=267; -- Chipatá
       UPDATE sip_municipio SET codreg=73 WHERE id=426; -- El Guacamayo
       UPDATE sip_municipio SET codreg=74 WHERE id=446; -- El Playón
       UPDATE sip_municipio SET codreg=75 WHERE id=441; -- El Peñón
       UPDATE sip_municipio SET codreg=76 WHERE id=461; -- Encino
       UPDATE sip_municipio SET codreg=79 WHERE id=464; -- Enciso
       UPDATE sip_municipio SET codreg=80 WHERE id=473; -- Florián
       UPDATE sip_municipio SET codreg=82 WHERE id=480; -- Floridablanca
       UPDATE sip_municipio SET codreg=85 WHERE id=503; -- Galán
       UPDATE sip_municipio SET codreg=88 WHERE id=507; -- Gámbita
       UPDATE sip_municipio SET codreg=91 WHERE id=548; -- Girón
       UPDATE sip_municipio SET codreg=94 WHERE id=562; -- Guaca
       UPDATE sip_municipio SET codreg=97 WHERE id=572; -- Guadalupe
       UPDATE sip_municipio SET codreg=100 WHERE id=577; -- Guapotá
       UPDATE sip_municipio SET codreg=103 WHERE id=582; -- Guavatá
       UPDATE sip_municipio SET codreg=106 WHERE id=587; -- Güepsa
       UPDATE sip_municipio SET codreg=109 WHERE id=596; -- Hato
       UPDATE sip_municipio SET codreg=112 WHERE id=628; -- Jesús María
       UPDATE sip_municipio SET codreg=115 WHERE id=629; -- Jordán
       UPDATE sip_municipio SET codreg=118 WHERE id=660; -- La Paz
       UPDATE sip_municipio SET codreg=119 WHERE id=635; -- La Belleza
       UPDATE sip_municipio SET codreg=120 WHERE id=652; -- Landázuri
       UPDATE sip_municipio SET codreg=121 WHERE id=706; -- Lebrija
       UPDATE sip_municipio SET codreg=124 WHERE id=721; -- Los Santos
       UPDATE sip_municipio SET codreg=127 WHERE id=731; -- Macaravita
       UPDATE sip_municipio SET codreg=130 WHERE id=744; -- Málaga
       UPDATE sip_municipio SET codreg=133 WHERE id=763; -- Matanza
       UPDATE sip_municipio SET codreg=136 WHERE id=780; -- Mogotes
       UPDATE sip_municipio SET codreg=139 WHERE id=786; -- Molagavita
       UPDATE sip_municipio SET codreg=142 WHERE id=822; -- Ocamonte
       UPDATE sip_municipio SET codreg=145 WHERE id=850; -- Oiba
       UPDATE sip_municipio SET codreg=148 WHERE id=853; -- Onzaga
       UPDATE sip_municipio SET codreg=151 WHERE id=884; -- Palmar
       UPDATE sip_municipio SET codreg=154 WHERE id=890; -- Palmas Del Socorro
       UPDATE sip_municipio SET codreg=157 WHERE id=901; -- Páramo
       UPDATE sip_municipio SET codreg=160 WHERE id=914; -- Piedecuesta
       UPDATE sip_municipio SET codreg=163 WHERE id=919; -- Pinchote
       UPDATE sip_municipio SET codreg=166 WHERE id=948; -- Puente Nacional
       UPDATE sip_municipio SET codreg=167 WHERE id=955; -- Puerto Parra
       UPDATE sip_municipio SET codreg=169 WHERE id=958; -- Puerto Wilches
       UPDATE sip_municipio SET codreg=172 WHERE id=1027; -- Rionegro
       UPDATE sip_municipio SET codreg=174 WHERE id=1063; -- Sabana De Torres
       UPDATE sip_municipio SET codreg=175 WHERE id=1090; -- San Andrés
       UPDATE sip_municipio SET codreg=178 WHERE id=1100; -- San Benito
       UPDATE sip_municipio SET codreg=181 WHERE id=1115; -- San Gil
       UPDATE sip_municipio SET codreg=184 WHERE id=1121; -- San Joaquín
       UPDATE sip_municipio SET codreg=187 WHERE id=1127; -- San José De Miranda
       UPDATE sip_municipio SET codreg=190 WHERE id=1131; -- San Miguel
       UPDATE sip_municipio SET codreg=193 WHERE id=1140; -- San Vicente De Chucurí
       UPDATE sip_municipio SET codreg=194 WHERE id=1187; -- Santa Helena Del Opón
       UPDATE sip_municipio SET codreg=195 WHERE id=1178; -- Santa Bárbara
       UPDATE sip_municipio SET codreg=196 WHERE id=1205; -- Simacota
       UPDATE sip_municipio SET codreg=199 WHERE id=1218; -- Socorro
       UPDATE sip_municipio SET codreg=202 WHERE id=1240; -- Suaita
       UPDATE sip_municipio SET codreg=205 WHERE id=1247; -- Sucre
       UPDATE sip_municipio SET codreg=208 WHERE id=1258; -- Suratá
       UPDATE sip_municipio SET codreg=211 WHERE id=1332; -- Tona
       UPDATE sip_municipio SET codreg=217 WHERE id=1369; -- Valle De San José
       UPDATE sip_municipio SET codreg=219 WHERE id=1382; -- Vetas
       UPDATE sip_municipio SET codreg=220 WHERE id=1378; -- Vélez
       UPDATE sip_municipio SET codreg=221 WHERE id=1390; -- Villanueva
       UPDATE sip_municipio SET codreg=223 WHERE id=1425; -- Zapatoca
  
       UPDATE sip_municipio SET codreg=71 WHERE id=404; -- EL CARMEN DE CHUCURÍ | 68235
  
       -- Sucre (45)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=53; -- Sincelejo
       UPDATE sip_municipio SET codreg=10 WHERE id=107; -- Buenavista
       UPDATE sip_municipio SET codreg=20 WHERE id=137; -- Caimito
       UPDATE sip_municipio SET codreg=40 WHERE id=364; -- Corozal
       UPDATE sip_municipio SET codreg=41 WHERE id=378; -- Coveñas
       UPDATE sip_municipio SET codreg=42 WHERE id=402; -- El Roble
       UPDATE sip_municipio SET codreg=45 WHERE id=396; -- Chalán
       UPDATE sip_municipio SET codreg=49 WHERE id=463; -- Guaranda
       UPDATE sip_municipio SET codreg=50 WHERE id=693; -- La Unión
       UPDATE sip_municipio SET codreg=55 WHERE id=720; -- Los Palmitos
       UPDATE sip_municipio SET codreg=60 WHERE id=736; -- Majagual
       UPDATE sip_municipio SET codreg=80 WHERE id=793; -- Morroa
       UPDATE sip_municipio SET codreg=100 WHERE id=859; -- Ovejas
       UPDATE sip_municipio SET codreg=120 WHERE id=886; -- Palmito
       UPDATE sip_municipio SET codreg=160 WHERE id=1092; -- Sampués
       UPDATE sip_municipio SET codreg=180 WHERE id=1112; -- San Benito Abad
       UPDATE sip_municipio SET codreg=200 WHERE id=1180; -- San Marcos
       UPDATE sip_municipio SET codreg=220 WHERE id=1183; -- San Onofre
       UPDATE sip_municipio SET codreg=240 WHERE id=1184; -- San Pedro
       UPDATE sip_municipio SET codreg=280 WHERE id=1244; -- Sucre
  
       UPDATE sip_municipio SET codreg=30 WHERE id=337; -- COLOSÓ | 70204
       UPDATE sip_municipio SET codreg=48 WHERE id=405; -- GALERAS | 70235
       UPDATE sip_municipio SET codreg=320 WHERE id=1336; -- SAN JOSÉ DE TOLUVIEJO | 70823
       UPDATE sip_municipio SET codreg=190 WHERE id=1176; -- SAN JUAN DE BETULIA | 70702
       UPDATE sip_municipio SET codreg=260 WHERE id=1200; -- SAN LUIS DE SINCÉ | 70742
       UPDATE sip_municipio SET codreg=300 WHERE id=1331; -- SANTIAGO DE TOLÚ | 70820
  
       -- Tolima (46)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=34; -- Ibagué
       UPDATE sip_municipio SET codreg=4 WHERE id=412; -- Alpujarra
       UPDATE sip_municipio SET codreg=7 WHERE id=454; -- Alvarado
       UPDATE sip_municipio SET codreg=10 WHERE id=537; -- Ambalema
       UPDATE sip_municipio SET codreg=13 WHERE id=737; -- Anzoátegui
       UPDATE sip_municipio SET codreg=19 WHERE id=1091; -- Ataco
       UPDATE sip_municipio SET codreg=22 WHERE id=138; -- Cajamarca
       UPDATE sip_municipio SET codreg=25 WHERE id=199; -- Carmen De Apicalá
       UPDATE sip_municipio SET codreg=28 WHERE id=220; -- Casabianca
       UPDATE sip_municipio SET codreg=31 WHERE id=333; -- Coello
       UPDATE sip_municipio SET codreg=34 WHERE id=368; -- Coyaima
       UPDATE sip_municipio SET codreg=37 WHERE id=388; -- Cunday
       UPDATE sip_municipio SET codreg=40 WHERE id=243; -- Chaparral
       UPDATE sip_municipio SET codreg=43 WHERE id=407; -- Dolores
       UPDATE sip_municipio SET codreg=46 WHERE id=468; -- Espinal
       UPDATE sip_municipio SET codreg=49 WHERE id=472; -- Falan
       UPDATE sip_municipio SET codreg=52 WHERE id=477; -- Flandes
       UPDATE sip_municipio SET codreg=55 WHERE id=487; -- Fresno
       UPDATE sip_municipio SET codreg=58 WHERE id=570; -- Guamo
       UPDATE sip_municipio SET codreg=61 WHERE id=599; -- Herveo
       UPDATE sip_municipio SET codreg=64 WHERE id=601; -- Honda
       UPDATE sip_municipio SET codreg=67 WHERE id=606; -- Icononzo
       UPDATE sip_municipio SET codreg=70 WHERE id=710; -- Lérida
       UPDATE sip_municipio SET codreg=73 WHERE id=716; -- Líbano
       UPDATE sip_municipio SET codreg=79 WHERE id=765; -- Melgar
       UPDATE sip_municipio SET codreg=80 WHERE id=779; -- Murillo
       UPDATE sip_municipio SET codreg=82 WHERE id=805; -- Natagaima
       UPDATE sip_municipio SET codreg=85 WHERE id=855; -- Ortega
       UPDATE sip_municipio SET codreg=87 WHERE id=882; -- Palocabildo
       UPDATE sip_municipio SET codreg=88 WHERE id=915; -- Piedras
       UPDATE sip_municipio SET codreg=89 WHERE id=929; -- Planadas
       UPDATE sip_municipio SET codreg=91 WHERE id=937; -- Prado
       UPDATE sip_municipio SET codreg=94 WHERE id=971; -- Purificación
       UPDATE sip_municipio SET codreg=97 WHERE id=1030; -- Rioblanco
       UPDATE sip_municipio SET codreg=100 WHERE id=1039; -- Roncesvalles
       UPDATE sip_municipio SET codreg=103 WHERE id=1041; -- Rovira
       UPDATE sip_municipio SET codreg=105 WHERE id=1098; -- Saldaña
       UPDATE sip_municipio SET codreg=106 WHERE id=1106; -- San Antonio
       UPDATE sip_municipio SET codreg=109 WHERE id=1114; -- San Luis
       UPDATE sip_municipio SET codreg=112 WHERE id=1133; -- Santa Isabel
       UPDATE sip_municipio SET codreg=115 WHERE id=1243; -- Suárez
       UPDATE sip_municipio SET codreg=118 WHERE id=1366; -- Valle De San Juan
       UPDATE sip_municipio SET codreg=121 WHERE id=1375; -- Venadillo
       UPDATE sip_municipio SET codreg=124 WHERE id=1387; -- Villahermosa
       UPDATE sip_municipio SET codreg=127 WHERE id=1396; -- Villarrica
  
       UPDATE sip_municipio SET codreg=16 WHERE id=923; -- ARMERO | 73055
        UPDATE sip_municipio SET codreg=76 WHERE id=761; -- SAN SEBASTIÁN DE MARIQUITA | 73443
  
       -- Valle del Cauca (47)
  
       UPDATE sip_municipio SET codreg=1 WHERE id=28; -- Cali
       UPDATE sip_municipio SET codreg=4 WHERE id=325; -- Alcalá
       UPDATE sip_municipio SET codreg=7 WHERE id=615; -- Andalucía
       UPDATE sip_municipio SET codreg=10 WHERE id=711; -- Ansermanuevo
       UPDATE sip_municipio SET codreg=13 WHERE id=905; -- Argelia
       UPDATE sip_municipio SET codreg=16 WHERE id=78; -- Bolívar
       UPDATE sip_municipio SET codreg=19 WHERE id=86; -- Buenaventura
       UPDATE sip_municipio SET codreg=25 WHERE id=113; -- Bugalagrande
       UPDATE sip_municipio SET codreg=28 WHERE id=134; -- Caicedonia
       UPDATE sip_municipio SET codreg=31 WHERE id=166; -- Candelaria
       UPDATE sip_municipio SET codreg=34 WHERE id=197; -- Cartago
       UPDATE sip_municipio SET codreg=37 WHERE id=401; -- Dagua
       UPDATE sip_municipio SET codreg=43 WHERE id=417; -- El Águila
       UPDATE sip_municipio SET codreg=46 WHERE id=427; -- El Cairo
       UPDATE sip_municipio SET codreg=49 WHERE id=429; -- El Cerrito
       UPDATE sip_municipio SET codreg=52 WHERE id=438; -- El Dovio
       UPDATE sip_municipio SET codreg=55 WHERE id=478; -- Florida
       UPDATE sip_municipio SET codreg=58 WHERE id=545; -- Ginebra
       UPDATE sip_municipio SET codreg=61 WHERE id=563; -- Guacarí
       UPDATE sip_municipio SET codreg=64 WHERE id=622; -- Jamundí
       UPDATE sip_municipio SET codreg=67 WHERE id=637; -- La Cumbre
       UPDATE sip_municipio SET codreg=70 WHERE id=694; -- La Unión
       UPDATE sip_municipio SET codreg=73 WHERE id=702; -- La Victoria
       UPDATE sip_municipio SET codreg=76 WHERE id=821; -- Obando
       UPDATE sip_municipio SET codreg=79 WHERE id=881; -- Palmira
       UPDATE sip_municipio SET codreg=82 WHERE id=936; -- Pradera
       UPDATE sip_municipio SET codreg=85 WHERE id=1019; -- Restrepo
       UPDATE sip_municipio SET codreg=88 WHERE id=1031; -- Riofrío
       UPDATE sip_municipio SET codreg=91 WHERE id=1038; -- Roldanillo
       UPDATE sip_municipio SET codreg=94 WHERE id=1096; -- San Pedro
       UPDATE sip_municipio SET codreg=97 WHERE id=1196; -- Sevilla
       UPDATE sip_municipio SET codreg=100 WHERE id=1338; -- Toro
       UPDATE sip_municipio SET codreg=103 WHERE id=1340; -- Trujillo
       UPDATE sip_municipio SET codreg=106 WHERE id=1344; -- Tuluá
       UPDATE sip_municipio SET codreg=109 WHERE id=1358; -- Ulloa
       UPDATE sip_municipio SET codreg=112 WHERE id=1380; -- Versalles
       UPDATE sip_municipio SET codreg=115 WHERE id=1385; -- Vijes
       UPDATE sip_municipio SET codreg=118 WHERE id=1421; -- Yotoco
       UPDATE sip_municipio SET codreg=121 WHERE id=1422; -- Yumbo
       UPDATE sip_municipio SET codreg=124 WHERE id=1427; -- Zarzal
  
      UPDATE sip_municipio SET codreg=40 WHERE id=143; -- CALIMA | 76126
       UPDATE sip_municipio SET codreg=22 WHERE id=112; -- GUADALAJARA DE BUGA | 76111
  
       -- Vaupés (58)
       UPDATE sip_municipio SET codreg=1 WHERE id=39; -- Mitú
       UPDATE sip_municipio SET codreg=4 WHERE id=235; -- Carurú
       UPDATE sip_municipio SET codreg=17 WHERE id=1084; -- Taraira
       UPDATE sip_municipio SET codreg=22 WHERE id=1418; -- Yavaraté
  
      UPDATE sip_municipio SET codreg=13 WHERE id=866; -- PACOA | 97511
      UPDATE sip_municipio SET codreg=10 WHERE id=1250; -- PAPUNAHUA | 97777
  
       -- Vichada (59)
       UPDATE sip_municipio SET codreg=1 WHERE id=47; -- Puerto Carreño
       UPDATE sip_municipio SET codreg=2 WHERE id=1042; -- Santa Rosalía
       UPDATE sip_municipio SET codreg=6 WHERE id=1246; -- Cumaribo
       UPDATE sip_municipio SET codreg=8 WHERE id=887; -- La Primavera
  
        SQL
    end
  end

  def down
    remove_column :sip_municipio, :codreg, :integer
  end
end
