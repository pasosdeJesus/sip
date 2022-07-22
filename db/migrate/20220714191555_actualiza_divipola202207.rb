class ActualizaDivipola202207 < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL
      -- Latitud y Longitud de Departamentos
      UPDATE sip_departamento SET latitud='6.702032125', longitud='-75.50455704' WHERE id=35; -- Antioquia
      UPDATE sip_departamento SET latitud='10.67700953', longitud='-74.96521949' WHERE id=48; -- Atlántico
      UPDATE sip_departamento SET latitud='4.316107698', longitud='-74.1810727' WHERE id=4; -- Bogotá, D.C.
      UPDATE sip_departamento SET latitud='8.079796863', longitud='-74.23514814' WHERE id=7; -- Bolívar
      UPDATE sip_departamento SET latitud='5.891672889', longitud='-72.62788054' WHERE id=11; -- Boyacá
      UPDATE sip_departamento SET latitud='5.280139978', longitud='-75.27498304' WHERE id=13; -- Caldas
      UPDATE sip_departamento SET latitud='0.798556195', longitud='-73.95946756' WHERE id=15; -- Caquetá
      UPDATE sip_departamento SET latitud='2.396833887', longitud='-76.82423283' WHERE id=17; -- Cauca
      UPDATE sip_departamento SET latitud='9.53665993', longitud='-73.51783154' WHERE id=20; -- Cesar
      UPDATE sip_departamento SET latitud='8.358549754', longitud='-75.79200872' WHERE id=24; -- Córdoba
      UPDATE sip_departamento SET latitud='4.771120716', longitud='-74.43111092' WHERE id=27; -- Cundinamarca
      UPDATE sip_departamento SET latitud='5.397581542', longitud='-76.942811' WHERE id=29; -- Chocó
      UPDATE sip_departamento SET latitud='2.570143029', longitud='-75.58434836' WHERE id=32; -- Huila
      UPDATE sip_departamento SET latitud='11.47687008', longitud='-72.42951072' WHERE id=33; -- La Guajira
      UPDATE sip_departamento SET latitud='10.24738355', longitud='-74.26175733' WHERE id=34; -- Magdalena
      UPDATE sip_departamento SET latitud='3.345562732', longitud='-72.95645988' WHERE id=37; -- Meta
      UPDATE sip_departamento SET latitud='1.571094987', longitud='-77.87020496' WHERE id=38; -- Nariño
      UPDATE sip_departamento SET latitud='8.09513751', longitud='-72.88188297' WHERE id=39; -- Norte de Santander
      UPDATE sip_departamento SET latitud='4.455241567', longitud='-75.68962853' WHERE id=41; -- Quindío
      UPDATE sip_departamento SET latitud='5.240757239', longitud='-76.00244469' WHERE id=42; -- Risaralda
      UPDATE sip_departamento SET latitud='6.693633184', longitud='-73.48600894' WHERE id=43; -- Santander
      UPDATE sip_departamento SET latitud='9.064941448', longitud='-75.10981755' WHERE id=45; -- Sucre
      UPDATE sip_departamento SET latitud='4.03477252', longitud='-75.2558271' WHERE id=46; -- Tolima
      UPDATE sip_departamento SET latitud='3.569858693', longitud='-76.62850427' WHERE id=47; -- Valle del Cauca
      UPDATE sip_departamento SET latitud='6.569577215', longitud='-70.96732394' WHERE id=50; -- Arauca
      UPDATE sip_departamento SET latitud='5.404064237', longitud='-71.60188073' WHERE id=51; -- Casanare
      UPDATE sip_departamento SET latitud='0.3673031', longitud='-75.51406183' WHERE id=52; -- Putumayo
      UPDATE sip_departamento SET latitud='12.54311512', longitud='-81.71762382' WHERE id=53; -- Archipiélago de San Andrés, Providencia y Santa Catalina
      UPDATE sip_departamento SET latitud='-1.54622768', longitud='-71.50212858' WHERE id=55; -- Amazonas
      UPDATE sip_departamento SET latitud='2.727842865', longitud='-68.81661272' WHERE id=56; -- Guainía
      UPDATE sip_departamento SET latitud='1.924531973', longitud='-72.12859569' WHERE id=57; -- Guaviare
      UPDATE sip_departamento SET latitud='0.64624561', longitud='-70.56140566' WHERE id=58; -- Vaupés
      UPDATE sip_departamento SET latitud='4.713557125', longitud='-69.41400011' WHERE id=59; -- Vichada

      -- Municipios
      UPDATE sip_municipio SET  nombre='Sotará Paispamba',
        observaciones = 'Nombre cambiando en DIVIPOLA 2022-07'
        WHERE id=1230; -- Era Sotará - Paispamba

      INSERT INTO sip_municipio_histvigencia (
      municipio_id, vigenciaini, vigenciafin, 
      nombre, id_munlocal, observaciones)
      VALUES (1230, '2021-01-01', '2021-12-31',
      'Sotará - Paispamba', 760, 'Nombre cambiado en DIVIPOLA 2022');


      -- Ubicación de Municipios
      UPDATE sip_municipio SET latitud='-1.997234795', longitud='-72.72361566' WHERE id=459; -- El Encanto / Amazonas
      UPDATE sip_municipio SET latitud='-1.509799605', longitud='-72.44442966' WHERE id=703; -- La Chorrera / Amazonas
      UPDATE sip_municipio SET latitud='-1.550256503', longitud='-69.94602815' WHERE id=707; -- La Pedrera / Amazonas
      UPDATE sip_municipio SET latitud='-0.125016381', longitud='-71.10487805' WHERE id=738; -- La Victoria / Amazonas
      UPDATE sip_municipio SET latitud='-3.530058784', longitud='-70.04513691' WHERE id=36; -- Leticia / Amazonas
      UPDATE sip_municipio SET latitud='-0.687037553', longitud='-71.1855046' WHERE id=777; -- Mirití - Paraná / Amazonas
      UPDATE sip_municipio SET latitud='-0.952145073', longitud='-73.75722748' WHERE id=896; -- Puerto Alegría / Amazonas
      UPDATE sip_municipio SET latitud='-1.91085406', longitud='-71.1484049' WHERE id=903; -- Puerto Arica / Amazonas
      UPDATE sip_municipio SET latitud='-3.631323222', longitud='-70.47199039' WHERE id=907; -- Puerto Nariño / Amazonas
      UPDATE sip_municipio SET latitud='-1.101032624', longitud='-71.93893358' WHERE id=1089; -- Puerto Santander / Amazonas
      UPDATE sip_municipio SET latitud='-2.451794264', longitud='-70.00651535' WHERE id=1282; -- Tarapacá / Amazonas
      UPDATE sip_municipio SET latitud='5.803728154', longitud='-75.43847353' WHERE id=300; -- Abejorral / Antioquia
      UPDATE sip_municipio SET latitud='6.627569378', longitud='-76.08597756' WHERE id=665; -- Abriaquí / Antioquia
      UPDATE sip_municipio SET latitud='6.365534125', longitud='-75.09059702' WHERE id=349; -- Alejandría / Antioquia
      UPDATE sip_municipio SET latitud='6.032921994', longitud='-75.7080031' WHERE id=536; -- Amagá / Antioquia
      UPDATE sip_municipio SET latitud='6.977788843', longitud='-74.9812393' WHERE id=550; -- Amalfi / Antioquia
      UPDATE sip_municipio SET latitud='5.604993248', longitud='-75.94128391' WHERE id=593; -- Andes / Antioquia
      UPDATE sip_municipio SET latitud='6.121430303', longitud='-75.71594966' WHERE id=616; -- Angelópolis / Antioquia
      UPDATE sip_municipio SET latitud='6.861498764', longitud='-75.358316' WHERE id=643; -- Angostura / Antioquia
      UPDATE sip_municipio SET latitud='7.193110778', longitud='-75.10848954' WHERE id=690; -- Anorí / Antioquia
      UPDATE sip_municipio SET latitud='6.293546613', longitud='-75.91736927' WHERE id=752; -- Anzá / Antioquia
      UPDATE sip_municipio SET latitud='7.86047815', longitud='-76.58236264' WHERE id=766; -- Apartadó / Antioquia
      UPDATE sip_municipio SET latitud='8.611395262', longitud='-76.41478317' WHERE id=863; -- Arboletes / Antioquia
      UPDATE sip_municipio SET latitud='5.708114524', longitud='-75.09469795' WHERE id=922; -- Argelia / Antioquia
      UPDATE sip_municipio SET latitud='6.163683758', longitud='-75.80995528' WHERE id=973; -- Armenia / Antioquia
      UPDATE sip_municipio SET latitud='6.443417935', longitud='-75.32924085' WHERE id=1271; -- Barbosa / Antioquia
      UPDATE sip_municipio SET latitud='6.358841086', longitud='-75.58973588' WHERE id=1404; -- Bello / Antioquia
      UPDATE sip_municipio SET latitud='6.665853953', longitud='-75.68621659' WHERE id=1372; -- Belmira / Antioquia
      UPDATE sip_municipio SET latitud='5.727081285', longitud='-75.98689107' WHERE id=1453; -- Betania / Antioquia
      UPDATE sip_municipio SET latitud='6.185783612', longitud='-75.95649246' WHERE id=1456; -- Betulia / Antioquia
      UPDATE sip_municipio SET latitud='7.111788462', longitud='-75.56223474' WHERE id=83; -- Briceño / Antioquia
      UPDATE sip_municipio SET latitud='6.80906489', longitud='-75.91206595' WHERE id=114; -- Buriticá / Antioquia
      UPDATE sip_municipio SET latitud='7.665155105', longitud='-75.22369744' WHERE id=132; -- Cáceres / Antioquia
      UPDATE sip_municipio SET latitud='6.423463639', longitud='-75.99351498' WHERE id=139; -- Caicedo / Antioquia
      UPDATE sip_municipio SET latitud='6.054446841', longitud='-75.62642674' WHERE id=145; -- Caldas / Antioquia
      UPDATE sip_municipio SET latitud='7.036017478', longitud='-75.28766178' WHERE id=170; -- Campamento / Antioquia
      UPDATE sip_municipio SET latitud='6.814950023', longitud='-76.02689632' WHERE id=176; -- Cañasgordas / Antioquia
      UPDATE sip_municipio SET latitud='6.33797388', longitud='-74.73354817' WHERE id=193; -- Caracolí / Antioquia
      UPDATE sip_municipio SET latitud='5.555275296', longitud='-75.63082096' WHERE id=194; -- Caramanta / Antioquia
      UPDATE sip_municipio SET latitud='7.757967437', longitud='-76.64374657' WHERE id=196; -- Carepa / Antioquia
      UPDATE sip_municipio SET latitud='6.754821442', longitud='-75.30590654' WHERE id=214; -- Carolina / Antioquia
      UPDATE sip_municipio SET latitud='7.867941792', longitud='-75.03501824' WHERE id=222; -- Caucasia / Antioquia
      UPDATE sip_municipio SET latitud='7.631665644', longitud='-76.63964213' WHERE id=256; -- Chigorodó / Antioquia
      UPDATE sip_municipio SET latitud='6.550065431', longitud='-75.08254116' WHERE id=298; -- Cisneros / Antioquia
      UPDATE sip_municipio SET latitud='5.840995666', longitud='-76.01065253' WHERE id=79; -- Ciudad Bolívar / Antioquia
      UPDATE sip_municipio SET latitud='6.005593074', longitud='-75.16015403' WHERE id=299; -- Cocorná / Antioquia
      UPDATE sip_municipio SET latitud='6.376106187', longitud='-75.21785901' WHERE id=343; -- Concepción / Antioquia
      UPDATE sip_municipio SET latitud='6.057468678', longitud='-75.90014678' WHERE id=347; -- Concordia / Antioquia
      UPDATE sip_municipio SET latitud='6.351882893', longitud='-75.50075633' WHERE id=358; -- Copacabana / Antioquia
      UPDATE sip_municipio SET latitud='6.992243782', longitud='-76.31426328' WHERE id=403; -- Dabeiba / Antioquia
      UPDATE sip_municipio SET latitud='6.492403905', longitud='-75.42227687' WHERE id=408; -- Donmatías / Antioquia
      UPDATE sip_municipio SET latitud='6.326444922', longitud='-75.78331175' WHERE id=416; -- Ebéjico / Antioquia
      UPDATE sip_municipio SET latitud='7.704633351', longitud='-74.66427726' WHERE id=436; -- El Bagre / Antioquia
      UPDATE sip_municipio SET latitud='5.978078841', longitud='-75.2635361' WHERE id=200; -- El Carmen De Viboral / Antioquia
      UPDATE sip_municipio SET latitud='6.124209495', longitud='-75.25212278' WHERE id=1151; -- El Santuario / Antioquia
      UPDATE sip_municipio SET latitud='6.594656004', longitud='-75.55913083' WHERE id=462; -- Entrerríos / Antioquia
      UPDATE sip_municipio SET latitud='6.154394922', longitud='-75.54686779' WHERE id=465; -- Envigado / Antioquia
      UPDATE sip_municipio SET latitud='5.887702934', longitud='-75.67926242' WHERE id=486; -- Fredonia / Antioquia
      UPDATE sip_municipio SET latitud='6.691364773', longitud='-76.33199656' WHERE id=488; -- Frontino / Antioquia
      UPDATE sip_municipio SET latitud='6.663095863', longitud='-75.94804663' WHERE id=546; -- Giraldo / Antioquia
      UPDATE sip_municipio SET latitud='6.379745895', longitud='-75.44795744' WHERE id=549; -- Girardota / Antioquia
      UPDATE sip_municipio SET latitud='6.709562839', longitud='-75.19270291' WHERE id=552; -- Gómez Plata / Antioquia
      UPDATE sip_municipio SET latitud='6.123380721', longitud='-75.12763646' WHERE id=555; -- Granada / Antioquia
      UPDATE sip_municipio SET latitud='6.861576325', longitud='-75.22591303' WHERE id=557; -- Guadalupe / Antioquia
      UPDATE sip_municipio SET latitud='6.266625703', longitud='-75.43730801' WHERE id=567; -- Guarne / Antioquia
      UPDATE sip_municipio SET latitud='6.236329826', longitud='-75.15651272' WHERE id=576; -- Guatapé / Antioquia
      UPDATE sip_municipio SET latitud='6.214511788', longitud='-75.74971002' WHERE id=597; -- Heliconia / Antioquia
      UPDATE sip_municipio SET latitud='5.797039002', longitud='-75.90669203' WHERE id=608; -- Hispania / Antioquia
      UPDATE sip_municipio SET latitud='6.179279438', longitud='-75.6142037' WHERE id=617; -- Itagüí / Antioquia
      UPDATE sip_municipio SET latitud='7.341549718', longitud='-75.67842277' WHERE id=619; -- Ituango / Antioquia
      UPDATE sip_municipio SET latitud='5.574444339', longitud='-75.81842575' WHERE id=623; -- Jardín / Antioquia
      UPDATE sip_municipio SET latitud='5.769820536', longitud='-75.76488256' WHERE id=626; -- Jericó / Antioquia
      UPDATE sip_municipio SET latitud='5.992524843', longitud='-75.43086935' WHERE id=634; -- La Ceja / Antioquia
      UPDATE sip_municipio SET latitud='6.137595883', longitud='-75.64895499' WHERE id=646; -- La Estrella / Antioquia
      UPDATE sip_municipio SET latitud='5.746583958', longitud='-75.60220206' WHERE id=655; -- La Pintada / Antioquia
      UPDATE sip_municipio SET latitud='5.940434685', longitud='-75.35429023' WHERE id=692; -- La Unión / Antioquia
      UPDATE sip_municipio SET latitud='6.723990935', longitud='-75.78300046' WHERE id=714; -- Liborina / Antioquia
      UPDATE sip_municipio SET latitud='6.534573585', longitud='-74.71410854' WHERE id=732; -- Maceo / Antioquia
      UPDATE sip_municipio SET latitud='6.18520515', longitud='-75.30487933' WHERE id=754; -- Marinilla / Antioquia
      UPDATE sip_municipio SET latitud='6.257590259', longitud='-75.61103107' WHERE id=38; -- Medellín / Antioquia
      UPDATE sip_municipio SET latitud='5.916853903', longitud='-75.51972693' WHERE id=785; -- Montebello / Antioquia
      UPDATE sip_municipio SET latitud='6.828773855', longitud='-76.70861349' WHERE id=796; -- Murindó / Antioquia
      UPDATE sip_municipio SET latitud='7.329557848', longitud='-76.4630657' WHERE id=799; -- Mutatá / Antioquia
      UPDATE sip_municipio SET latitud='5.581275312', longitud='-75.19457019' WHERE id=804; -- Nariño / Antioquia
      UPDATE sip_municipio SET latitud='7.983477394', longitud='-74.65844186' WHERE id=818; -- Nechí / Antioquia
      UPDATE sip_municipio SET latitud='8.493728551', longitud='-76.67699588' WHERE id=811; -- Necoclí / Antioquia
      UPDATE sip_municipio SET latitud='6.611418083', longitud='-75.77567097' WHERE id=852; -- Olaya / Antioquia
      UPDATE sip_municipio SET latitud='6.232396368', longitud='-75.22350906' WHERE id=910; -- Peñol / Antioquia
      UPDATE sip_municipio SET latitud='7.044180058', longitud='-75.88968843' WHERE id=912; -- Peque / Antioquia
      UPDATE sip_municipio SET latitud='5.80970186', longitud='-75.86076667' WHERE id=959; -- Pueblorrico / Antioquia
      UPDATE sip_municipio SET latitud='6.481922267', longitud='-74.5287421' WHERE id=961; -- Puerto Berrío / Antioquia
      UPDATE sip_municipio SET latitud='6.126539139', longitud='-74.70317722' WHERE id=968; -- Puerto Nare / Antioquia
      UPDATE sip_municipio SET latitud='5.954830151', longitud='-74.6861918' WHERE id=976; -- Puerto Triunfo / Antioquia
      UPDATE sip_municipio SET latitud='6.997267375', longitud='-74.55865652' WHERE id=1015; -- Remedios / Antioquia
      UPDATE sip_municipio SET latitud='6.053444254', longitud='-75.51573805' WHERE id=1020; -- Retiro / Antioquia
      UPDATE sip_municipio SET latitud='6.150785807', longitud='-75.41076052' WHERE id=1026; -- Rionegro / Antioquia
      UPDATE sip_municipio SET latitud='6.901000506', longitud='-75.79222754' WHERE id=1043; -- Sabanalarga / Antioquia
      UPDATE sip_municipio SET latitud='6.138305183', longitud='-75.60880599' WHERE id=1044; -- Sabaneta / Antioquia
      UPDATE sip_municipio SET latitud='5.970502334', longitud='-75.98137251' WHERE id=1049; -- Salgar / Antioquia
      UPDATE sip_municipio SET latitud='6.918427233', longitud='-75.6657758' WHERE id=1052; -- San Andrés De Cuerquía / Antioquia
      UPDATE sip_municipio SET latitud='6.193789659', longitud='-74.90732769' WHERE id=1055; -- San Carlos / Antioquia
      UPDATE sip_municipio SET latitud='5.840093731', longitud='-74.98176334' WHERE id=1059; -- San Francisco / Antioquia
      UPDATE sip_municipio SET latitud='6.438300409', longitud='-75.70310727' WHERE id=1065; -- San Jerónimo / Antioquia
      UPDATE sip_municipio SET latitud='6.823258913', longitud='-75.67770826' WHERE id=1068; -- San José De La Montaña / Antioquia
      UPDATE sip_municipio SET latitud='8.707141583', longitud='-76.53248234' WHERE id=1069; -- San Juan De Urabá / Antioquia
      UPDATE sip_municipio SET latitud='6.024205956', longitud='-75.0076674' WHERE id=1076; -- San Luis / Antioquia
      UPDATE sip_municipio SET latitud='6.458666308', longitud='-75.5624839' WHERE id=1081; -- San Pedro De Los Milagros / Antioquia
      UPDATE sip_municipio SET latitud='8.37915695', longitud='-76.31664233' WHERE id=1083; -- San Pedro De Urabá / Antioquia
      UPDATE sip_municipio SET latitud='6.31074453', longitud='-74.99858652' WHERE id=1087; -- San Rafael / Antioquia
      UPDATE sip_municipio SET latitud='6.466165211', longitud='-74.9450732' WHERE id=1097; -- San Roque / Antioquia
      UPDATE sip_municipio SET latitud='6.310387522', longitud='-75.32740163' WHERE id=1104; -- San Vicente Ferrer / Antioquia
      UPDATE sip_municipio SET latitud='5.878984956', longitud='-75.58330371' WHERE id=1116; -- Santa Bárbara / Antioquia
      UPDATE sip_municipio SET latitud='6.535711576', longitud='-75.90426658' WHERE id=727; -- Santa Fé De Antioquia / Antioquia
      UPDATE sip_municipio SET latitud='6.675827825', longitud='-75.43814333' WHERE id=1134; -- Santa Rosa De Osos / Antioquia
      UPDATE sip_municipio SET latitud='6.481044132', longitud='-75.14260097' WHERE id=1143; -- Santo Domingo / Antioquia
      UPDATE sip_municipio SET latitud='7.26692339', longitud='-74.62163926' WHERE id=1194; -- Segovia / Antioquia
      UPDATE sip_municipio SET latitud='5.826388779', longitud='-74.83637623' WHERE id=1221; -- Sonsón / Antioquia
      UPDATE sip_municipio SET latitud='6.520164552', longitud='-75.74580903' WHERE id=1232; -- Sopetrán / Antioquia
      UPDATE sip_municipio SET latitud='5.673758571', longitud='-75.70979974' WHERE id=1269; -- Támesis / Antioquia
      UPDATE sip_municipio SET latitud='7.488875998', longitud='-75.40189438' WHERE id=1274; -- Tarazá / Antioquia
      UPDATE sip_municipio SET latitud='5.871064557', longitud='-75.82871144' WHERE id=1277; -- Tarso / Antioquia
      UPDATE sip_municipio SET latitud='6.058349971', longitud='-75.79966005' WHERE id=1318; -- Titiribí / Antioquia
      UPDATE sip_municipio SET latitud='7.016397069', longitud='-75.71363382' WHERE id=1329; -- Toledo / Antioquia
      UPDATE sip_municipio SET latitud='8.173851745', longitud='-76.5740377' WHERE id=1348; -- Turbo / Antioquia
      UPDATE sip_municipio SET latitud='6.913916924', longitud='-76.13318514' WHERE id=1355; -- Uramita / Antioquia
      UPDATE sip_municipio SET latitud='6.33534134', longitud='-76.25906482' WHERE id=1362; -- Urrao / Antioquia
      UPDATE sip_municipio SET latitud='7.265404213', longitud='-75.40094502' WHERE id=1365; -- Valdivia / Antioquia
      UPDATE sip_municipio SET latitud='5.651937802', longitud='-75.63083412' WHERE id=1370; -- Valparaíso / Antioquia
      UPDATE sip_municipio SET latitud='6.836535122', longitud='-74.7540302' WHERE id=1371; -- Vegachí / Antioquia
      UPDATE sip_municipio SET latitud='5.956576355', longitud='-75.77722423' WHERE id=1376; -- Venecia / Antioquia
      UPDATE sip_municipio SET latitud='6.453351334', longitud='-76.69504802' WHERE id=1392; -- Vigía Del Fuerte / Antioquia
      UPDATE sip_municipio SET latitud='6.716870679', longitud='-74.75565002' WHERE id=1413; -- Yalí / Antioquia
      UPDATE sip_municipio SET latitud='6.9881309', longitud='-75.45439957' WHERE id=1416; -- Yarumal / Antioquia
      UPDATE sip_municipio SET latitud='6.64442786', longitud='-75.02990266' WHERE id=1420; -- Yolombó / Antioquia
      UPDATE sip_municipio SET latitud='6.925159318', longitud='-74.15824041' WHERE id=1423; -- Yondó / Antioquia
      UPDATE sip_municipio SET latitud='7.474004006', longitud='-74.85848326' WHERE id=1426; -- Zaragoza / Antioquia
      UPDATE sip_municipio SET latitud='6.796280825', longitud='-70.50921153' WHERE id=18; -- Arauca / Arauca
      UPDATE sip_municipio SET latitud='6.799338394', longitud='-71.29827429' WHERE id=1056; -- Arauquita / Arauca
      UPDATE sip_municipio SET latitud='6.39654349', longitud='-70.07381197' WHERE id=377; -- Cravo Norte / Arauca
      UPDATE sip_municipio SET latitud='6.750907234', longitud='-71.79124241' WHERE id=539; -- Fortul / Arauca
      UPDATE sip_municipio SET latitud='6.411761829', longitud='-70.96678964' WHERE id=975; -- Puerto Rondón / Arauca
      UPDATE sip_municipio SET latitud='6.906941714', longitud='-71.85070757' WHERE id=1193; -- Saravena / Arauca
      UPDATE sip_municipio SET latitud='6.390650479', longitud='-71.79178647' WHERE id=1279; -- Tame / Arauca
      UPDATE sip_municipio SET latitud='13.3511096', longitud='-81.37388549' WHERE id=938; -- Providencia / Archipiélago de San Andrés, Providencia y Santa Catalina
      UPDATE sip_municipio SET latitud='12.54311512', longitud='-81.71762382' WHERE id=50; -- San Andrés / Archipiélago de San Andrés, Providencia y Santa Catalina
      UPDATE sip_municipio SET latitud='10.79329302', longitud='-74.92219491' WHERE id=1255; -- Baranoa / Atlántico
      UPDATE sip_municipio SET latitud='10.98152051', longitud='-74.82771544' WHERE id=22; -- Barranquilla / Atlántico
      UPDATE sip_municipio SET latitud='10.38405079', longitud='-74.88466039' WHERE id=175; -- Campo De La Cruz / Atlántico
      UPDATE sip_municipio SET latitud='10.48902047', longitud='-74.87756627' WHERE id=191; -- Candelaria / Atlántico
      UPDATE sip_municipio SET latitud='10.89771991', longitud='-74.88708788' WHERE id=502; -- Galapa / Atlántico
      UPDATE sip_municipio SET latitud='10.82306503', longitud='-75.07841904' WHERE id=631; -- Juan De Acosta / Atlántico
      UPDATE sip_municipio SET latitud='10.63503116', longitud='-75.15402741' WHERE id=729; -- Luruaco / Atlántico
      UPDATE sip_municipio SET latitud='10.84828864', longitud='-74.80617555' WHERE id=746; -- Malambo / Atlántico
      UPDATE sip_municipio SET latitud='10.45414555', longitud='-74.98477367' WHERE id=749; -- Manatí / Atlántico
      UPDATE sip_municipio SET latitud='10.69481208', longitud='-74.7701509' WHERE id=880; -- Palmar De Varela / Atlántico
      UPDATE sip_municipio SET latitud='10.74078959', longitud='-75.14366034' WHERE id=921; -- Piojó / Atlántico
      UPDATE sip_municipio SET latitud='10.76740141', longitud='-74.85414844' WHERE id=932; -- Polonuevo / Atlántico
      UPDATE sip_municipio SET latitud='10.59465102', longitud='-74.79847316' WHERE id=934; -- Ponedera / Atlántico
      UPDATE sip_municipio SET latitud='11.0044226', longitud='-74.9074058' WHERE id=952; -- Puerto Colombia / Atlántico
      UPDATE sip_municipio SET latitud='10.50757051', longitud='-75.12188053' WHERE id=1017; -- Repelón / Atlántico
      UPDATE sip_municipio SET latitud='10.79894015', longitud='-74.7687966' WHERE id=1046; -- Sabanagrande / Atlántico
      UPDATE sip_municipio SET latitud='10.62250777', longitud='-74.95510542' WHERE id=1047; -- Sabanalarga / Atlántico
      UPDATE sip_municipio SET latitud='10.35364192', longitud='-74.96541179' WHERE id=1108; -- Santa Lucía / Atlántico
      UPDATE sip_municipio SET latitud='10.75562656', longitud='-74.78726468' WHERE id=1129; -- Santo Tomás / Atlántico
      UPDATE sip_municipio SET latitud='10.9069066', longitud='-74.7784249' WHERE id=1224; -- Soledad / Atlántico
      UPDATE sip_municipio SET latitud='10.31085035', longitud='-74.90713308' WHERE id=1241; -- Suan / Atlántico
      UPDATE sip_municipio SET latitud='10.90721938', longitud='-74.98423293' WHERE id=1342; -- Tubará / Atlántico
      UPDATE sip_municipio SET latitud='10.74052266', longitud='-74.98267413' WHERE id=1363; -- Usiacurí / Atlántico
      UPDATE sip_municipio SET latitud='4.316107698', longitud='-74.1810727' WHERE id=24; -- Bogotá, D.C. / Bogotá, D.C.
      UPDATE sip_municipio SET latitud='8.622943262', longitud='-74.47805945' WHERE id=989; -- Achí / Bolívar
      UPDATE sip_municipio SET latitud='8.757468863', longitud='-74.19515811' WHERE id=535; -- Altos Del Rosario / Bolívar
      UPDATE sip_municipio SET latitud='8.362996158', longitud='-74.10301905' WHERE id=726; -- Arenal / Bolívar
      UPDATE sip_municipio SET latitud='10.16422123', longitud='-75.37121788' WHERE id=878; -- Arjona / Bolívar
      UPDATE sip_municipio SET latitud='10.24171805', longitud='-75.02690422' WHERE id=1033; -- Arroyohondo / Bolívar
      UPDATE sip_municipio SET latitud='8.837077654', longitud='-74.27966531' WHERE id=1197; -- Barranco De Loba / Bolívar
      UPDATE sip_municipio SET latitud='10.15517098', longitud='-74.99995949' WHERE id=190; -- Calamar / Bolívar
      UPDATE sip_municipio SET latitud='7.239229146', longitud='-74.10014043' WHERE id=232; -- Cantagallo / Bolívar
      UPDATE sip_municipio SET latitud='10.46343362', longitud='-75.45889915' WHERE id=31; -- Cartagena De Indias / Bolívar
      UPDATE sip_municipio SET latitud='9.235268598', longitud='-74.68840962' WHERE id=283; -- Cicuco / Bolívar
      UPDATE sip_municipio SET latitud='10.55663696', longitud='-75.31446653' WHERE id=379; -- Clemencia / Bolívar
      UPDATE sip_municipio SET latitud='9.540047515', longitud='-74.89445635' WHERE id=361; -- Córdoba / Bolívar
      UPDATE sip_municipio SET latitud='9.699819876', longitud='-75.15793573' WHERE id=418; -- El Carmen De Bolívar / Bolívar
      UPDATE sip_municipio SET latitud='10.03483672', longitud='-74.92811072' WHERE id=431; -- El Guamo / Bolívar
      UPDATE sip_municipio SET latitud='8.864818786', longitud='-73.91230147' WHERE id=466; -- El Peñón / Bolívar
      UPDATE sip_municipio SET latitud='8.981717133', longitud='-74.09071902' WHERE id=541; -- Hatillo De Loba / Bolívar
      UPDATE sip_municipio SET latitud='9.053135895', longitud='-74.70539318' WHERE id=740; -- Magangué / Bolívar
      UPDATE sip_municipio SET latitud='10.17821391', longitud='-75.17978161' WHERE id=745; -- Mahates / Bolívar
      UPDATE sip_municipio SET latitud='9.054601889', longitud='-74.22584706' WHERE id=753; -- Margarita / Bolívar
      UPDATE sip_municipio SET latitud='9.976017168', longitud='-75.34380265' WHERE id=759; -- María La Baja / Bolívar
      UPDATE sip_municipio SET latitud='8.01710024', longitud='-74.46342911' WHERE id=775; -- Montecristo / Bolívar
      UPDATE sip_municipio SET latitud='8.253700061', longitud='-73.9713459' WHERE id=791; -- Morales / Bolívar
      UPDATE sip_municipio SET latitud='8.50613476', longitud='-74.11588912' WHERE id=812; -- Norosí / Bolívar
      UPDATE sip_municipio SET latitud='8.886315511', longitud='-74.40888476' WHERE id=920; -- Pinillos / Bolívar
      UPDATE sip_municipio SET latitud='8.672628558', longitud='-73.91450679' WHERE id=966; -- Regidor / Bolívar
      UPDATE sip_municipio SET latitud='8.559982465', longitud='-73.90298668' WHERE id=1014; -- Río Viejo / Bolívar
      UPDATE sip_municipio SET latitud='10.36972087', longitud='-75.07333835' WHERE id=1034; -- San Cristóbal / Bolívar
      UPDATE sip_municipio SET latitud='10.36468192', longitud='-75.20523487' WHERE id=1053; -- San Estanislao / Bolívar
      UPDATE sip_municipio SET latitud='9.081483143', longitud='-74.37186647' WHERE id=1057; -- San Fernando / Bolívar
      UPDATE sip_municipio SET latitud='9.835362011', longitud='-75.10609201' WHERE id=1062; -- San Jacinto / Bolívar
      UPDATE sip_municipio SET latitud='8.212463202', longitud='-74.75082' WHERE id=1064; -- San Jacinto Del Cauca / Bolívar
      UPDATE sip_municipio SET latitud='9.967957823', longitud='-75.06571959' WHERE id=1066; -- San Juan Nepomuceno / Bolívar
      UPDATE sip_municipio SET latitud='8.816088444', longitud='-74.00599967' WHERE id=1086; -- San Martín De Loba / Bolívar
      UPDATE sip_municipio SET latitud='7.507922612', longitud='-74.10356977' WHERE id=1095; -- San Pablo / Bolívar
      UPDATE sip_municipio SET latitud='10.64981278', longitud='-75.26548463' WHERE id=1103; -- Santa Catalina / Bolívar
      UPDATE sip_municipio SET latitud='9.142512064', longitud='-74.54519906' WHERE id=787; -- Santa Cruz De Mompox / Bolívar
      UPDATE sip_municipio SET latitud='10.46920726', longitud='-75.36116053' WHERE id=1126; -- Santa Rosa / Bolívar
      UPDATE sip_municipio SET latitud='7.772519173', longitud='-74.26272843' WHERE id=1138; -- Santa Rosa Del Sur / Bolívar
      UPDATE sip_municipio SET latitud='7.851315534', longitud='-73.98371609' WHERE id=1204; -- Simití / Bolívar
      UPDATE sip_municipio SET latitud='10.33209031', longitud='-75.11699226' WHERE id=1229; -- Soplaviento / Bolívar
      UPDATE sip_municipio SET latitud='9.269516705', longitud='-74.58695233' WHERE id=1260; -- Talaigua Nuevo / Bolívar
      UPDATE sip_municipio SET latitud='8.492345176', longitud='-74.29676139' WHERE id=1322; -- Tiquisio / Bolívar
      UPDATE sip_municipio SET latitud='10.35310756', longitud='-75.37971541' WHERE id=1347; -- Turbaco / Bolívar
      UPDATE sip_municipio SET latitud='10.25276929', longitud='-75.43270299' WHERE id=1350; -- Turbaná / Bolívar
      UPDATE sip_municipio SET latitud='10.4449132', longitud='-75.26736275' WHERE id=1394; -- Villanueva / Bolívar
      UPDATE sip_municipio SET latitud='9.745147021', longitud='-74.88067037' WHERE id=1424; -- Zambrano / Bolívar
      UPDATE sip_municipio SET latitud='4.954825081', longitud='-73.38813425' WHERE id=373; -- Almeida / Boyacá
      UPDATE sip_municipio SET latitud='5.437416373', longitud='-72.87149471' WHERE id=789; -- Aquitania / Boyacá
      UPDATE sip_municipio SET latitud='5.73526424', longitud='-73.42793109' WHERE id=864; -- Arcabuco / Boyacá
      UPDATE sip_municipio SET latitud='6.005059265', longitud='-72.89369887' WHERE id=1386; -- Belén / Boyacá
      UPDATE sip_municipio SET latitud='5.230936356', longitud='-73.12731944' WHERE id=1450; -- Berbeo / Boyacá
      UPDATE sip_municipio SET latitud='5.920858933', longitud='-72.84857876' WHERE id=1455; -- Betéitiva / Boyacá
      UPDATE sip_municipio SET latitud='6.337515626', longitud='-72.62021239' WHERE id=1460; -- Boavita / Boyacá
      UPDATE sip_municipio SET latitud='5.439856216', longitud='-73.38136994' WHERE id=81; -- Boyacá / Boyacá
      UPDATE sip_municipio SET latitud='5.673229265', longitud='-73.92660705' WHERE id=82; -- Briceño / Boyacá
      UPDATE sip_municipio SET latitud='5.489399419', longitud='-73.95066255' WHERE id=87; -- Buenavista / Boyacá
      UPDATE sip_municipio SET latitud='5.843483731', longitud='-72.87574623' WHERE id=115; -- Busbanzá / Boyacá
      UPDATE sip_municipio SET latitud='5.575990669', longitud='-73.88057508' WHERE id=167; -- Caldas / Boyacá
      UPDATE sip_municipio SET latitud='5.006862536', longitud='-73.1446703' WHERE id=171; -- Campohermoso / Boyacá
      UPDATE sip_municipio SET latitud='5.962013698', longitud='-72.96447288' WHERE id=238; -- Cerinza / Boyacá
      UPDATE sip_municipio SET latitud='5.202971639', longitud='-73.34048074' WHERE id=257; -- Chinavita / Boyacá
      UPDATE sip_municipio SET latitud='5.622488024', longitud='-73.80424531' WHERE id=264; -- Chiquinquirá / Boyacá
      UPDATE sip_municipio SET latitud='5.643075648', longitud='-73.44562391' WHERE id=398; -- Chíquiza / Boyacá
      UPDATE sip_municipio SET latitud='6.68911806', longitud='-72.41795675' WHERE id=276; -- Chiscas / Boyacá
      UPDATE sip_municipio SET latitud='6.091468485', longitud='-72.43903174' WHERE id=279; -- Chita / Boyacá
      UPDATE sip_municipio SET latitud='5.984394625', longitud='-73.42582375' WHERE id=281; -- Chitaraque / Boyacá
      UPDATE sip_municipio SET latitud='5.556830465', longitud='-73.26061715' WHERE id=282; -- Chivatá / Boyacá
      UPDATE sip_municipio SET latitud='4.871181606', longitud='-73.36142379' WHERE id=406; -- Chivor / Boyacá
      UPDATE sip_municipio SET latitud='5.393059633', longitud='-73.28205772' WHERE id=286; -- Ciénega / Boyacá
      UPDATE sip_municipio SET latitud='5.667822366', longitud='-73.32137049' WHERE id=338; -- Cómbita / Boyacá
      UPDATE sip_municipio SET latitud='5.452461072', longitud='-74.05996578' WHERE id=359; -- Coper / Boyacá
      UPDATE sip_municipio SET latitud='5.82454582', longitud='-72.84544845' WHERE id=365; -- Corrales / Boyacá
      UPDATE sip_municipio SET latitud='6.519521476', longitud='-72.74020421' WHERE id=369; -- Covarachía / Boyacá
      UPDATE sip_municipio SET latitud='6.886954878', longitud='-72.18156285' WHERE id=381; -- Cubará / Boyacá
      UPDATE sip_municipio SET latitud='5.527104109', longitud='-73.44598646' WHERE id=384; -- Cucaita / Boyacá
      UPDATE sip_municipio SET latitud='5.58775449', longitud='-72.93953686' WHERE id=389; -- Cuítiva / Boyacá
      UPDATE sip_municipio SET latitud='5.890602515', longitud='-73.06709484' WHERE id=409; -- Duitama / Boyacá
      UPDATE sip_municipio SET latitud='6.353363177', longitud='-72.41923752' WHERE id=419; -- El Cocuy / Boyacá
      UPDATE sip_municipio SET latitud='6.508240556', longitud='-72.48049625' WHERE id=430; -- El Espino / Boyacá
      UPDATE sip_municipio SET latitud='5.67367659', longitud='-73.01983352' WHERE id=476; -- Firavitoba / Boyacá
      UPDATE sip_municipio SET latitud='5.85899211', longitud='-72.92499827' WHERE id=479; -- Floresta / Boyacá
      UPDATE sip_municipio SET latitud='5.744105975', longitud='-73.5426552' WHERE id=499; -- Gachantivá / Boyacá
      UPDATE sip_municipio SET latitud='5.799050256', longitud='-72.72964765' WHERE id=504; -- Gámeza / Boyacá
      UPDATE sip_municipio SET latitud='5.089466651', longitud='-73.31430272' WHERE id=509; -- Garagoa / Boyacá
      UPDATE sip_municipio SET latitud='6.445438546', longitud='-72.51635332' WHERE id=559; -- Guacamayas / Boyacá
      UPDATE sip_municipio SET latitud='5.01450831', longitud='-73.48812352' WHERE id=579; -- Guateque / Boyacá
      UPDATE sip_municipio SET latitud='4.931424341', longitud='-73.49663372' WHERE id=583; -- Guayatá / Boyacá
      UPDATE sip_municipio SET latitud='6.566991765', longitud='-72.25599334' WHERE id=590; -- Güicán De La Sierra / Boyacá
      UPDATE sip_municipio SET latitud='5.617366016', longitud='-72.96986504' WHERE id=620; -- Iza / Boyacá
      UPDATE sip_municipio SET latitud='5.38916272', longitud='-73.40087021' WHERE id=624; -- Jenesano / Boyacá
      UPDATE sip_municipio SET latitud='6.155633662', longitud='-72.58523093' WHERE id=625; -- Jericó / Boyacá
      UPDATE sip_municipio SET latitud='5.113167102', longitud='-73.45923708' WHERE id=644; -- La Capilla / Boyacá
      UPDATE sip_municipio SET latitud='6.265126191', longitud='-72.55551085' WHERE id=701; -- La Uvita / Boyacá
      UPDATE sip_municipio SET latitud='5.507008121', longitud='-74.24162727' WHERE id=699; -- La Victoria / Boyacá
      UPDATE sip_municipio SET latitud='5.541378132', longitud='-72.5903846' WHERE id=639; -- Labranzagrande / Boyacá
      UPDATE sip_municipio SET latitud='4.980176495', longitud='-73.29413695' WHERE id=730; -- Macanal / Boyacá
      UPDATE sip_municipio SET latitud='5.569810633', longitud='-74.02003127' WHERE id=757; -- Maripí / Boyacá
      UPDATE sip_municipio SET latitud='5.150953297', longitud='-73.17896722' WHERE id=772; -- Miraflores / Boyacá
      UPDATE sip_municipio SET latitud='5.710937981', longitud='-72.63402875' WHERE id=782; -- Mongua / Boyacá
      UPDATE sip_municipio SET latitud='5.697352228', longitud='-72.83298664' WHERE id=783; -- Monguí / Boyacá
      UPDATE sip_municipio SET latitud='5.863370485', longitud='-73.55852538' WHERE id=788; -- Moniquirá / Boyacá
      UPDATE sip_municipio SET latitud='5.606192449', longitud='-73.37734267' WHERE id=797; -- Motavita / Boyacá
      UPDATE sip_municipio SET latitud='5.539429272', longitud='-74.11177139' WHERE id=801; -- Muzo / Boyacá
      UPDATE sip_municipio SET latitud='5.778759851', longitud='-72.93268324' WHERE id=814; -- Nobsa / Boyacá
      UPDATE sip_municipio SET latitud='5.354701485', longitud='-73.44873424' WHERE id=817; -- Nuevo Colón / Boyacá
      UPDATE sip_municipio SET latitud='5.610787844', longitud='-73.27991905' WHERE id=851; -- Oicatá / Boyacá
      UPDATE sip_municipio SET latitud='5.753787787', longitud='-74.19719423' WHERE id=858; -- Otanche / Boyacá
      UPDATE sip_municipio SET latitud='5.148323877', longitud='-73.39951219' WHERE id=865; -- Pachavita / Boyacá
      UPDATE sip_municipio SET latitud='5.095211035', longitud='-73.00435863' WHERE id=870; -- Páez / Boyacá
      UPDATE sip_municipio SET latitud='5.762027786', longitud='-73.13777442' WHERE id=871; -- Paipa / Boyacá
      UPDATE sip_municipio SET latitud='5.382328949', longitud='-72.69672674' WHERE id=876; -- Pajarito / Boyacá
      UPDATE sip_municipio SET latitud='6.443299758', longitud='-72.46182431' WHERE id=885; -- Panqueba / Boyacá
      UPDATE sip_municipio SET latitud='5.688801559', longitud='-74.00504122' WHERE id=897; -- Pauna / Boyacá
      UPDATE sip_municipio SET latitud='5.621242742', longitud='-72.3692906' WHERE id=899; -- Paya / Boyacá
      UPDATE sip_municipio SET latitud='6.030008561', longitud='-72.75988018' WHERE id=904; -- Paz De Río / Boyacá
      UPDATE sip_municipio SET latitud='5.498483324', longitud='-73.07837993' WHERE id=911; -- Pesca / Boyacá
      UPDATE sip_municipio SET latitud='5.768131812', longitud='-72.43993232' WHERE id=925; -- Pisba / Boyacá
      UPDATE sip_municipio SET latitud='5.953466654', longitud='-74.4528581' WHERE id=949; -- Puerto Boyacá / Boyacá
      UPDATE sip_municipio SET latitud='5.595729831', longitud='-74.26857067' WHERE id=965; -- Quípama / Boyacá
      UPDATE sip_municipio SET latitud='5.319934092', longitud='-73.310779' WHERE id=985; -- Ramiriquí / Boyacá
      UPDATE sip_municipio SET latitud='5.496268621', longitud='-73.62894438' WHERE id=1013; -- Ráquira / Boyacá
      UPDATE sip_municipio SET latitud='5.379947879', longitud='-73.19650995' WHERE id=1037; -- Rondón / Boyacá
      UPDATE sip_municipio SET latitud='5.699926051', longitud='-73.74799466' WHERE id=1045; -- Saboyá / Boyacá
      UPDATE sip_municipio SET latitud='5.573464882', longitud='-73.543102' WHERE id=1048; -- Sáchica / Boyacá
      UPDATE sip_municipio SET latitud='5.47053997', longitud='-73.5211756' WHERE id=1051; -- Samacá / Boyacá
      UPDATE sip_municipio SET latitud='5.234614686', longitud='-73.04914067' WHERE id=1074; -- San Eduardo / Boyacá
      UPDATE sip_municipio SET latitud='5.994154088', longitud='-73.54386522' WHERE id=1080; -- San José De Pare / Boyacá
      UPDATE sip_municipio SET latitud='4.798203543', longitud='-73.13397018' WHERE id=1085; -- San Luis De Gaceno / Boyacá
      UPDATE sip_municipio SET latitud='6.395388812', longitud='-72.55184862' WHERE id=1102; -- San Mateo / Boyacá
      UPDATE sip_municipio SET latitud='5.532326922', longitud='-73.74715898' WHERE id=1109; -- San Miguel De Sema / Boyacá
      UPDATE sip_municipio SET latitud='5.677345066', longitud='-74.11403749' WHERE id=1120; -- San Pablo De Borbur / Boyacá
      UPDATE sip_municipio SET latitud='4.823002556', longitud='-73.25377506' WHERE id=1142; -- Santa María / Boyacá
      UPDATE sip_municipio SET latitud='5.892950301', longitud='-72.9917278' WHERE id=1147; -- Santa Rosa De Viterbo / Boyacá
      UPDATE sip_municipio SET latitud='5.731602716', longitud='-73.60366287' WHERE id=1150; -- Santa Sofía / Boyacá
      UPDATE sip_municipio SET latitud='6.057614971', longitud='-73.48974828' WHERE id=1135; -- Santana / Boyacá
      UPDATE sip_municipio SET latitud='6.13211793', longitud='-72.73032415' WHERE id=1190; -- Sativanorte / Boyacá
      UPDATE sip_municipio SET latitud='6.083405978', longitud='-72.72410815' WHERE id=1191; -- Sativasur / Boyacá
      UPDATE sip_municipio SET latitud='5.498747701', longitud='-73.21681778' WHERE id=1198; -- Siachoque / Boyacá
      UPDATE sip_municipio SET latitud='6.323088045', longitud='-72.69604089' WHERE id=1215; -- Soatá / Boyacá
      UPDATE sip_municipio SET latitud='5.960498836', longitud='-72.68239784' WHERE id=1223; -- Socha / Boyacá
      UPDATE sip_municipio SET latitud='5.906513772', longitud='-72.53646361' WHERE id=1219; -- Socotá / Boyacá
      UPDATE sip_municipio SET latitud='5.646672053', longitud='-72.8709565' WHERE id=1226; -- Sogamoso / Boyacá
      UPDATE sip_municipio SET latitud='4.970974064', longitud='-73.42878785' WHERE id=1231; -- Somondoco / Boyacá
      UPDATE sip_municipio SET latitud='5.580573191', longitud='-73.44371838' WHERE id=1233; -- Sora / Boyacá
      UPDATE sip_municipio SET latitud='5.494890461', longitud='-73.31899997' WHERE id=1235; -- Soracá / Boyacá
      UPDATE sip_municipio SET latitud='5.763010553', longitud='-73.24352232' WHERE id=1234; -- Sotaquirá / Boyacá
      UPDATE sip_municipio SET latitud='6.215200578', longitud='-72.71575634' WHERE id=1248; -- Susacón / Boyacá
      UPDATE sip_municipio SET latitud='5.640030759', longitud='-73.62598773' WHERE id=1249; -- Sutamarchán / Boyacá
      UPDATE sip_municipio SET latitud='5.030711335', longitud='-73.41224401' WHERE id=1253; -- Sutatenza / Boyacá
      UPDATE sip_municipio SET latitud='5.882294313', longitud='-72.72626817' WHERE id=1275; -- Tasco / Boyacá
      UPDATE sip_municipio SET latitud='5.071413139', longitud='-73.42479699' WHERE id=1284; -- Tenza / Boyacá
      UPDATE sip_municipio SET latitud='5.301116649', longitud='-73.3932521' WHERE id=1309; -- Tibaná / Boyacá
      UPDATE sip_municipio SET latitud='5.747329389', longitud='-73.01114724' WHERE id=1311; -- Tibasosa / Boyacá
      UPDATE sip_municipio SET latitud='5.577566497', longitud='-73.67614572' WHERE id=1316; -- Tinjacá / Boyacá
      UPDATE sip_municipio SET latitud='6.42035349', longitud='-72.69463583' WHERE id=1321; -- Tipacoque / Boyacá
      UPDATE sip_municipio SET latitud='5.580254287', longitud='-73.1606969' WHERE id=1324; -- Toca / Boyacá
      UPDATE sip_municipio SET latitud='5.921830062', longitud='-73.48921806' WHERE id=1327; -- Togüí / Boyacá
      UPDATE sip_municipio SET latitud='5.765350303', longitud='-72.83672958' WHERE id=1333; -- Tópaga / Boyacá
      UPDATE sip_municipio SET latitud='5.501297215', longitud='-72.99633297' WHERE id=1335; -- Tota / Boyacá
      UPDATE sip_municipio SET latitud='5.518472615', longitud='-73.37801856' WHERE id=54; -- Tunja / Boyacá
      UPDATE sip_municipio SET latitud='5.720301516', longitud='-73.94330927' WHERE id=1343; -- Tununguá / Boyacá
      UPDATE sip_municipio SET latitud='5.305697418', longitud='-73.50908714' WHERE id=1346; -- Turmequé / Boyacá
      UPDATE sip_municipio SET latitud='5.678126998', longitud='-73.17343053' WHERE id=1349; -- Tuta / Boyacá
      UPDATE sip_municipio SET latitud='6.078051903', longitud='-72.85707832' WHERE id=1352; -- Tutazá / Boyacá
      UPDATE sip_municipio SET latitud='5.217241368', longitud='-73.46338477' WHERE id=1356; -- Úmbita / Boyacá
      UPDATE sip_municipio SET latitud='5.383385481', longitud='-73.52097942' WHERE id=1377; -- Ventaquemada / Boyacá
      UPDATE sip_municipio SET latitud='5.665762424', longitud='-73.514948' WHERE id=709; -- Villa De Leyva / Boyacá
      UPDATE sip_municipio SET latitud='5.440558216', longitud='-73.26627456' WHERE id=1402; -- Viracachá / Boyacá
      UPDATE sip_municipio SET latitud='5.285635983', longitud='-73.16763091' WHERE id=1428; -- Zetaquira / Boyacá
      UPDATE sip_municipio SET latitud='5.616204006', longitud='-75.4554471' WHERE id=148; -- Aguadas / Caldas
      UPDATE sip_municipio SET latitud='5.20029922', longitud='-75.75289078' WHERE id=725; -- Anserma / Caldas
      UPDATE sip_municipio SET latitud='5.265539969', longitud='-75.47392619' WHERE id=846; -- Aranzazu / Caldas
      UPDATE sip_municipio SET latitud='4.99467728', longitud='-75.81225989' WHERE id=1403; -- Belalcázar / Caldas
      UPDATE sip_municipio SET latitud='4.974340569', longitud='-75.65954686' WHERE id=259; -- Chinchiná / Caldas
      UPDATE sip_municipio SET latitud='5.285743777', longitud='-75.58978784' WHERE id=474; -- Filadelfia / Caldas
      UPDATE sip_municipio SET latitud='5.410515691', longitud='-74.72114262' WHERE id=645; -- La Dorada / Caldas
      UPDATE sip_municipio SET latitud='5.393185716', longitud='-75.55791071' WHERE id=654; -- La Merced / Caldas
      UPDATE sip_municipio SET latitud='5.08343301', longitud='-75.50727881' WHERE id=37; -- Manizales / Caldas
      UPDATE sip_municipio SET latitud='5.23295391', longitud='-75.15263447' WHERE id=747; -- Manzanares / Caldas
      UPDATE sip_municipio SET latitud='5.492632029', longitud='-75.60209955' WHERE id=758; -- Marmato / Caldas
      UPDATE sip_municipio SET latitud='5.309142491', longitud='-75.04117892' WHERE id=762; -- Marquetalia / Caldas
      UPDATE sip_municipio SET latitud='5.235585244', longitud='-75.28316648' WHERE id=764; -- Marulanda / Caldas
      UPDATE sip_municipio SET latitud='5.183358589', longitud='-75.50692977' WHERE id=807; -- Neira / Caldas
      UPDATE sip_municipio SET latitud='5.638062349', longitud='-74.85492707' WHERE id=819; -- Norcasia / Caldas
      UPDATE sip_municipio SET latitud='5.500035035', longitud='-75.48245057' WHERE id=869; -- Pácora / Caldas
      UPDATE sip_municipio SET latitud='5.050342543', longitud='-75.66176266' WHERE id=889; -- Palestina / Caldas
      UPDATE sip_municipio SET latitud='5.407187836', longitud='-75.16683996' WHERE id=909; -- Pensilvania / Caldas
      UPDATE sip_municipio SET latitud='5.442275418', longitud='-75.75220499' WHERE id=1024; -- Riosucio / Caldas
      UPDATE sip_municipio SET latitud='5.097563816', longitud='-75.73335166' WHERE id=1032; -- Risaralda / Caldas
      UPDATE sip_municipio SET latitud='5.370332425', longitud='-75.40962177' WHERE id=1060; -- Salamina / Caldas
      UPDATE sip_municipio SET latitud='5.519692873', longitud='-74.99718577' WHERE id=1077; -- Samaná / Caldas
      UPDATE sip_municipio SET latitud='5.083424513', longitud='-75.8101789' WHERE id=1082; -- San José / Caldas
      UPDATE sip_municipio SET latitud='5.45295802', longitud='-75.64035705' WHERE id=1252; -- Supía / Caldas
      UPDATE sip_municipio SET latitud='5.447542859', longitud='-74.83622502' WHERE id=1384; -- Victoria / Caldas
      UPDATE sip_municipio SET latitud='4.940211591', longitud='-75.43544014' WHERE id=1393; -- Villamaría / Caldas
      UPDATE sip_municipio SET latitud='5.047822054', longitud='-75.879297' WHERE id=1400; -- Viterbo / Caldas
      UPDATE sip_municipio SET latitud='1.22786549', longitud='-75.88232651' WHERE id=494; -- Albania / Caquetá
      UPDATE sip_municipio SET latitud='1.536174657', longitud='-75.90947504' WHERE id=1457; -- Belén De Los Andaquíes / Caquetá
      UPDATE sip_municipio SET latitud='0.647693081', longitud='-74.27235499' WHERE id=215; -- Cartagena Del Chairá / Caquetá
      UPDATE sip_municipio SET latitud='1.115379292', longitud='-75.97328452' WHERE id=341; -- Curillo / Caquetá
      UPDATE sip_municipio SET latitud='1.713734697', longitud='-75.26878109' WHERE id=428; -- El Doncello / Caquetá
      UPDATE sip_municipio SET latitud='1.476630016', longitud='-75.20231825' WHERE id=447; -- El Paujíl / Caquetá
      UPDATE sip_municipio SET latitud='1.749138704', longitud='-75.55823906' WHERE id=33; -- Florencia / Caquetá
      UPDATE sip_municipio SET latitud='1.302860442', longitud='-75.23572732' WHERE id=712; -- La Montañita / Caquetá
      UPDATE sip_municipio SET latitud='1.146692554', longitud='-75.38664764' WHERE id=776; -- Milán / Caquetá
      UPDATE sip_municipio SET latitud='1.38299611', longitud='-75.67381123' WHERE id=798; -- Morelia / Caquetá
      UPDATE sip_municipio SET latitud='2.018940891', longitud='-75.07308627' WHERE id=977; -- Puerto Rico / Caquetá
      UPDATE sip_municipio SET latitud='1.304702314', longitud='-76.11000594' WHERE id=1021; -- San José Del Fragua / Caquetá
      UPDATE sip_municipio SET latitud='1.308465061', longitud='-74.19746971' WHERE id=1214; -- San Vicente Del Caguán / Caquetá
      UPDATE sip_municipio SET latitud='0.096131862', longitud='-72.32036402' WHERE id=1220; -- Solano / Caquetá
      UPDATE sip_municipio SET latitud='0.943939454', longitud='-75.64668544' WHERE id=1262; -- Solita / Caquetá
      UPDATE sip_municipio SET latitud='1.07534915', longitud='-75.73779004' WHERE id=1374; -- Valparaíso / Caquetá
      UPDATE sip_municipio SET latitud='5.126121886', longitud='-72.54821017' WHERE id=59; -- Aguazul / Casanare
      UPDATE sip_municipio SET latitud='5.228453404', longitud='-72.86496804' WHERE id=202; -- Chámeza / Casanare
      UPDATE sip_municipio SET latitud='6.03948032', longitud='-71.52445752' WHERE id=141; -- Hato Corozal / Casanare
      UPDATE sip_municipio SET latitud='6.178282373', longitud='-72.34693377' WHERE id=173; -- La Salina / Casanare
      UPDATE sip_municipio SET latitud='4.675769488', longitud='-72.21280273' WHERE id=177; -- Maní / Casanare
      UPDATE sip_municipio SET latitud='4.841308642', longitud='-72.8473434' WHERE id=240; -- Monterrey / Casanare
      UPDATE sip_municipio SET latitud='5.529181235', longitud='-72.09251937' WHERE id=386; -- Nunchía / Casanare
      UPDATE sip_municipio SET latitud='4.915139133', longitud='-71.59873966' WHERE id=397; -- Orocué / Casanare
      UPDATE sip_municipio SET latitud='5.779915281', longitud='-70.86947037' WHERE id=443; -- Paz De Ariporo / Casanare
      UPDATE sip_municipio SET latitud='5.663194953', longitud='-71.92580806' WHERE id=460; -- Pore / Casanare
      UPDATE sip_municipio SET latitud='5.263068507', longitud='-72.77081831' WHERE id=483; -- Recetor / Casanare
      UPDATE sip_municipio SET latitud='4.81119011', longitud='-72.99580655' WHERE id=542; -- Sabanalarga / Casanare
      UPDATE sip_municipio SET latitud='6.049906435', longitud='-72.21076163' WHERE id=558; -- Sácama / Casanare
      UPDATE sip_municipio SET latitud='5.274955665', longitud='-71.81749276' WHERE id=585; -- San Luis De Palenque / Casanare
      UPDATE sip_municipio SET latitud='5.878927424', longitud='-72.20067822' WHERE id=697; -- Támara / Casanare
      UPDATE sip_municipio SET latitud='4.697463691', longitud='-72.62922436' WHERE id=713; -- Tauramena / Casanare
      UPDATE sip_municipio SET latitud='5.354527091', longitud='-71.25479519' WHERE id=743; -- Trinidad / Casanare
      UPDATE sip_municipio SET latitud='4.528307719', longitud='-72.82314281' WHERE id=756; -- Villanueva / Casanare
      UPDATE sip_municipio SET latitud='5.242744761', longitud='-72.25802857' WHERE id=58; -- Yopal / Casanare
      UPDATE sip_municipio SET latitud='1.912440521', longitud='-76.83494519' WHERE id=372; -- Almaguer / Cauca
      UPDATE sip_municipio SET latitud='2.329337283', longitud='-77.26314906' WHERE id=847; -- Argelia / Cauca
      UPDATE sip_municipio SET latitud='2.084732945', longitud='-77.2088133' WHERE id=1211; -- Balboa / Cauca
      UPDATE sip_municipio SET latitud='1.853951938', longitud='-76.96337454' WHERE id=77; -- Bolívar / Cauca
      UPDATE sip_municipio SET latitud='2.988923885', longitud='-76.62158951' WHERE id=108; -- Buenos Aires / Cauca
      UPDATE sip_municipio SET latitud='2.643209848', longitud='-76.70138914' WHERE id=164; -- Cajibío / Cauca
      UPDATE sip_municipio SET latitud='2.803845691', longitud='-76.42719377' WHERE id=174; -- Caldono / Cauca
      UPDATE sip_municipio SET latitud='3.062875557', longitud='-76.32127977' WHERE id=192; -- Caloto / Cauca
      UPDATE sip_municipio SET latitud='3.136753606', longitud='-76.20964569' WHERE id=360; -- Corinto / Cauca
      UPDATE sip_municipio SET latitud='2.534488312', longitud='-77.00511207' WHERE id=449; -- El Tambo / Cauca
      UPDATE sip_municipio SET latitud='1.69453474', longitud='-77.08735723' WHERE id=496; -- Florencia / Cauca
      UPDATE sip_municipio SET latitud='3.144389993', longitud='-76.39234811' WHERE id=540; -- Guachené / Cauca
      UPDATE sip_municipio SET latitud='2.41326696', longitud='-77.69047531' WHERE id=566; -- Guapi / Cauca
      UPDATE sip_municipio SET latitud='2.499058783', longitud='-76.13762531' WHERE id=610; -- Inzá / Cauca
      UPDATE sip_municipio SET latitud='2.84981013', longitud='-76.31124919' WHERE id=621; -- Jambaló / Cauca
      UPDATE sip_municipio SET latitud='2.187473572', longitud='-76.78228032' WHERE id=657; -- La Sierra / Cauca
      UPDATE sip_municipio SET latitud='2.053933426', longitud='-76.7588062' WHERE id=661; -- La Vega / Cauca
      UPDATE sip_municipio SET latitud='2.95819877', longitud='-77.24212158' WHERE id=723; -- López De Micay / Cauca
      UPDATE sip_municipio SET latitud='1.793825164', longitud='-77.18060381' WHERE id=770; -- Mercaderes / Cauca
      UPDATE sip_municipio SET latitud='3.228235212', longitud='-76.21670827' WHERE id=773; -- Miranda / Cauca
      UPDATE sip_municipio SET latitud='2.773663981', longitud='-76.74605152' WHERE id=792; -- Morales / Cauca
      UPDATE sip_municipio SET latitud='3.194730618', longitud='-76.3362418' WHERE id=868; -- Padilla / Cauca
      UPDATE sip_municipio SET latitud='2.733887702', longitud='-75.99368264' WHERE id=873; -- Páez / Cauca
      UPDATE sip_municipio SET latitud='2.157983906', longitud='-77.0465762' WHERE id=898; -- Patía / Cauca
      UPDATE sip_municipio SET latitud='1.054128816', longitud='-76.4443271' WHERE id=900; -- Piamonte / Cauca
      UPDATE sip_municipio SET latitud='2.702420026', longitud='-76.53770455' WHERE id=916; -- Piendamó - Tunía / Cauca
      UPDATE sip_municipio SET latitud='2.471704362', longitud='-76.59194419' WHERE id=46; -- Popayán / Cauca
      UPDATE sip_municipio SET latitud='3.266724205', longitud='-76.41846353' WHERE id=956; -- Puerto Tejada / Cauca
      UPDATE sip_municipio SET latitud='2.262153618', longitud='-76.44826938' WHERE id=970; -- Puracé / Cauca
      UPDATE sip_municipio SET latitud='2.260421954', longitud='-76.74582033' WHERE id=1040; -- Rosas / Cauca
      UPDATE sip_municipio SET latitud='1.856261815', longitud='-76.71652424' WHERE id=1146; -- San Sebastián / Cauca
      UPDATE sip_municipio SET latitud='1.52002179', longitud='-76.53876281' WHERE id=1175; -- Santa Rosa / Cauca
      UPDATE sip_municipio SET latitud='2.984467338', longitud='-76.49873145' WHERE id=1152; -- Santander De Quilichao / Cauca
      UPDATE sip_municipio SET latitud='2.651291894', longitud='-76.35057356' WHERE id=1203; -- Silvia / Cauca
      UPDATE sip_municipio SET latitud='2.231820541', longitud='-76.61146633' WHERE id=1230; -- Sotará Paispamba / Cauca
      UPDATE sip_municipio SET latitud='2.936865997', longitud='-76.7458243' WHERE id=1259; -- Suárez / Cauca
      UPDATE sip_municipio SET latitud='2.057735184', longitud='-76.90993965' WHERE id=1263; -- Sucre / Cauca
      UPDATE sip_municipio SET latitud='2.369625312', longitud='-76.71051932' WHERE id=1315; -- Timbío / Cauca
      UPDATE sip_municipio SET latitud='2.699475127', longitud='-77.49131577' WHERE id=1317; -- Timbiquí / Cauca
      UPDATE sip_municipio SET latitud='2.975771999', longitud='-76.20331566' WHERE id=1334; -- Toribío / Cauca
      UPDATE sip_municipio SET latitud='2.475213085', longitud='-76.39675937' WHERE id=1339; -- Totoró / Cauca
      UPDATE sip_municipio SET latitud='3.180627317', longitud='-76.46445558' WHERE id=1360; -- Villa Rica / Cauca
      UPDATE sip_municipio SET latitud='8.248735219', longitud='-73.6227405' WHERE id=88; -- Aguachica / Cesar
      UPDATE sip_municipio SET latitud='9.949215908', longitud='-73.22358244' WHERE id=149; -- Agustín Codazzi / Cesar
      UPDATE sip_municipio SET latitud='9.510727925', longitud='-73.94214641' WHERE id=571; -- Astrea / Cesar
      UPDATE sip_municipio SET latitud='9.727732939', longitud='-73.25250522' WHERE id=768; -- Becerril / Cesar
      UPDATE sip_municipio SET latitud='9.946391309', longitud='-73.86628815' WHERE id=1011; -- Bosconia / Cesar
      UPDATE sip_municipio SET latitud='9.27797765', longitud='-73.84697903' WHERE id=261; -- Chimichagua / Cesar
      UPDATE sip_municipio SET latitud='9.426648354', longitud='-73.54797894' WHERE id=266; -- Chiriguaná / Cesar
      UPDATE sip_municipio SET latitud='9.238771332', longitud='-73.48810861' WHERE id=391; -- Curumaní / Cesar
      UPDATE sip_municipio SET latitud='10.19995356', longitud='-73.91282064' WHERE id=410; -- El Copey / Cesar
      UPDATE sip_municipio SET latitud='9.683474681', longitud='-73.73833778' WHERE id=440; -- El Paso / Cesar
      UPDATE sip_municipio SET latitud='8.337726622', longitud='-73.70649199' WHERE id=501; -- Gamarra / Cesar
      UPDATE sip_municipio SET latitud='8.405516522', longitud='-73.37537309' WHERE id=551; -- González / Cesar
      UPDATE sip_municipio SET latitud='8.588002247', longitud='-73.61602384' WHERE id=649; -- La Gloria / Cesar
      UPDATE sip_municipio SET latitud='9.52099808', longitud='-73.32249338' WHERE id=691; -- La Jagua De Ibirico / Cesar
      UPDATE sip_municipio SET latitud='10.24440562', longitud='-73.07824569' WHERE id=1035; -- La Paz / Cesar
      UPDATE sip_municipio SET latitud='10.38027852', longitud='-73.00706275' WHERE id=760; -- Manaure Balcón Del Cesar / Cesar
      UPDATE sip_municipio SET latitud='8.938916143', longitud='-73.57247213' WHERE id=872; -- Pailitas / Cesar
      UPDATE sip_municipio SET latitud='8.764116734', longitud='-73.63295546' WHERE id=924; -- Pelaya / Cesar
      UPDATE sip_municipio SET latitud='10.41736874', longitud='-73.61450632' WHERE id=943; -- Pueblo Bello / Cesar
      UPDATE sip_municipio SET latitud='8.201070245', longitud='-73.48750127' WHERE id=1025; -- Río De Oro / Cesar
      UPDATE sip_municipio SET latitud='7.769815987', longitud='-73.47218888' WHERE id=1181; -- San Alberto / Cesar
      UPDATE sip_municipio SET latitud='10.16952712', longitud='-73.2879827' WHERE id=1213; -- San Diego / Cesar
      UPDATE sip_municipio SET latitud='7.937788454', longitud='-73.54436312' WHERE id=1239; -- San Martín / Cesar
      UPDATE sip_municipio SET latitud='8.902075012', longitud='-73.7633962' WHERE id=1267; -- Tamalameque / Cesar
      UPDATE sip_municipio SET latitud='10.21890277', longitud='-73.45784764' WHERE id=55; -- Valledupar / Cesar
      UPDATE sip_municipio SET latitud='8.383938499', longitud='-77.26560256' WHERE id=987; -- Acandí / Chocó
      UPDATE sip_municipio SET latitud='5.636740989', longitud='-77.0842154' WHERE id=432; -- Alto Baudó / Chocó
      UPDATE sip_municipio SET latitud='5.525825084', longitud='-76.65064357' WHERE id=848; -- Atrato / Chocó
      UPDATE sip_municipio SET latitud='5.503119772', longitud='-76.19796907' WHERE id=1192; -- Bagadó / Chocó
      UPDATE sip_municipio SET latitud='6.162762775', longitud='-77.41653534' WHERE id=1210; -- Bahía Solano / Chocó
      UPDATE sip_municipio SET latitud='4.492865435', longitud='-77.08271352' WHERE id=1237; -- Bajo Baudó / Chocó
      UPDATE sip_municipio SET latitud='6.474666885', longitud='-77.09933025' WHERE id=1465; -- Bojayá / Chocó
      UPDATE sip_municipio SET latitud='7.033646541', longitud='-76.97423016' WHERE id=213; -- Carmen Del Darién / Chocó
      UPDATE sip_municipio SET latitud='5.389828229', longitud='-76.52264237' WHERE id=234; -- Cértegui / Chocó
      UPDATE sip_municipio SET latitud='5.070586101', longitud='-76.50701751' WHERE id=340; -- Condoto / Chocó
      UPDATE sip_municipio SET latitud='5.359661967', longitud='-76.77255624' WHERE id=172; -- El Cantón Del San Pablo / Chocó
      UPDATE sip_municipio SET latitud='5.810938364', longitud='-76.19189442' WHERE id=423; -- El Carmen De Atrato / Chocó
      UPDATE sip_municipio SET latitud='4.272940191', longitud='-76.98785828' WHERE id=439; -- El Litoral Del San Juan / Chocó
      UPDATE sip_municipio SET latitud='4.586818665', longitud='-77.00090737' WHERE id=618; -- Istmina / Chocó
      UPDATE sip_municipio SET latitud='7.103338868', longitud='-77.67973662' WHERE id=633; -- Juradó / Chocó
      UPDATE sip_municipio SET latitud='5.585101179', longitud='-76.38544449' WHERE id=717; -- Lloró / Chocó
      UPDATE sip_municipio SET latitud='6.033880098', longitud='-76.6734697' WHERE id=733; -- Medio Atrato / Chocó
      UPDATE sip_municipio SET latitud='5.110392243', longitud='-76.99593075' WHERE id=742; -- Medio Baudó / Chocó
      UPDATE sip_municipio SET latitud='4.621182739', longitud='-76.80861843' WHERE id=769; -- Medio San Juan / Chocó
      UPDATE sip_municipio SET latitud='4.853386627', longitud='-76.61823669' WHERE id=816; -- Nóvita / Chocó
      UPDATE sip_municipio SET latitud='5.591359844', longitud='-77.33057439' WHERE id=820; -- Nuquí / Chocó
      UPDATE sip_municipio SET latitud='5.7543229', longitud='-76.65015147' WHERE id=48; -- Quibdó / Chocó
      UPDATE sip_municipio SET latitud='5.190995015', longitud='-76.41996151' WHERE id=967; -- Río Iró / Chocó
      UPDATE sip_municipio SET latitud='5.567533337', longitud='-76.81157084' WHERE id=1012; -- Río Quito / Chocó
      UPDATE sip_municipio SET latitud='7.389887937', longitud='-77.24067483' WHERE id=1028; -- Riosucio / Chocó
      UPDATE sip_municipio SET latitud='4.958741345', longitud='-76.28002361' WHERE id=1075; -- San José Del Palmar / Chocó
      UPDATE sip_municipio SET latitud='4.594415157', longitud='-76.54194459' WHERE id=1207; -- Sipí / Chocó
      UPDATE sip_municipio SET latitud='5.26610158', longitud='-76.33109547' WHERE id=1266; -- Tadó / Chocó
      UPDATE sip_municipio SET latitud='8.117281079', longitud='-77.10372723' WHERE id=1307; -- Unguía / Chocó
      UPDATE sip_municipio SET latitud='5.281599258', longitud='-76.61962746' WHERE id=1323; -- Unión Panamericana / Chocó
      UPDATE sip_municipio SET latitud='8.265768688', longitud='-75.04868436' WHERE id=1117; -- Ayapel / Córdoba
      UPDATE sip_municipio SET latitud='8.191397953', longitud='-75.43382532' WHERE id=1273; -- Buenavista / Córdoba
      UPDATE sip_municipio SET latitud='8.7240958', longitud='-76.23779081' WHERE id=1451; -- Canalete / Córdoba
      UPDATE sip_municipio SET latitud='8.895667051', longitud='-75.87842391' WHERE id=237; -- Cereté / Córdoba
      UPDATE sip_municipio SET latitud='9.11024941', longitud='-75.65237351' WHERE id=244; -- Chimá / Córdoba
      UPDATE sip_municipio SET latitud='9.053287104', longitud='-75.37387363' WHERE id=278; -- Chinú / Córdoba
      UPDATE sip_municipio SET latitud='8.841811894', longitud='-75.60779829' WHERE id=284; -- Ciénaga De Oro / Córdoba
      UPDATE sip_municipio SET latitud='9.071460219', longitud='-75.75459276' WHERE id=538; -- Cotorra / Córdoba
      UPDATE sip_municipio SET latitud='8.052218422', longitud='-75.28816022' WHERE id=604; -- La Apartada / Córdoba
      UPDATE sip_municipio SET latitud='9.165034998', longitud='-75.90978124' WHERE id=718; -- Lorica / Córdoba
      UPDATE sip_municipio SET latitud='8.823307063', longitud='-76.3430552' WHERE id=724; -- Los Córdobas / Córdoba
      UPDATE sip_municipio SET latitud='9.265461621', longitud='-75.65090876' WHERE id=781; -- Momil / Córdoba
      UPDATE sip_municipio SET latitud='7.866432635', longitud='-75.87533926' WHERE id=784; -- Montelíbano / Córdoba
      UPDATE sip_municipio SET latitud='8.584698016', longitud='-75.95055079' WHERE id=41; -- Montería / Córdoba
      UPDATE sip_municipio SET latitud='9.190515343', longitud='-76.11931709' WHERE id=849; -- Moñitos / Córdoba
      UPDATE sip_municipio SET latitud='8.181108488', longitud='-75.68923803' WHERE id=930; -- Planeta Rica / Córdoba
      UPDATE sip_municipio SET latitud='8.481339568', longitud='-75.40516154' WHERE id=944; -- Pueblo Nuevo / Córdoba
      UPDATE sip_municipio SET latitud='8.988667731', longitud='-76.19405912' WHERE id=957; -- Puerto Escondido / Córdoba
      UPDATE sip_municipio SET latitud='7.711515736', longitud='-75.77123224' WHERE id=963; -- Puerto Libertador / Córdoba
      UPDATE sip_municipio SET latitud='9.282386127', longitud='-75.72129392' WHERE id=972; -- Purísima De La Concepción / Córdoba
      UPDATE sip_municipio SET latitud='8.799007016', longitud='-75.42925664' WHERE id=1071; -- Sahagún / Córdoba
      UPDATE sip_municipio SET latitud='9.121296353', longitud='-75.52091711' WHERE id=1093; -- San Andrés De Sotavento / Córdoba
      UPDATE sip_municipio SET latitud='9.359667489', longitud='-75.78700252' WHERE id=1099; -- San Antero / Córdoba
      UPDATE sip_municipio SET latitud='9.330098329', longitud='-75.97623858' WHERE id=1107; -- San Bernardo Del Viento / Córdoba
      UPDATE sip_municipio SET latitud='8.706464263', longitud='-75.69251825' WHERE id=1113; -- San Carlos / Córdoba
      UPDATE sip_municipio SET latitud='7.753054395', longitud='-75.5672474' WHERE id=1122; -- San José De Uré / Córdoba
      UPDATE sip_municipio SET latitud='8.987777392', longitud='-75.90958771' WHERE id=1132; -- San Pelayo / Córdoba
      UPDATE sip_municipio SET latitud='7.813896829', longitud='-76.16846678' WHERE id=1313; -- Tierralta / Córdoba
      UPDATE sip_municipio SET latitud='9.224630803', longitud='-75.54410593' WHERE id=1326; -- Tuchín / Córdoba
      UPDATE sip_municipio SET latitud='8.219904128', longitud='-76.2213286' WHERE id=1368; -- Valencia / Córdoba
      UPDATE sip_municipio SET latitud='4.372744676', longitud='-74.67111051' WHERE id=6; -- Agua De Dios / Cundinamarca
      UPDATE sip_municipio SET latitud='4.891121638', longitud='-74.44278432' WHERE id=288; -- Albán / Cundinamarca
      UPDATE sip_municipio SET latitud='4.559962881', longitud='-74.5256953' WHERE id=603; -- Anapoima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.789313614', longitud='-74.46194256' WHERE id=689; -- Anolaima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.537711619', longitud='-74.59124656' WHERE id=983; -- Apulo / Cundinamarca
      UPDATE sip_municipio SET latitud='4.232786985', longitud='-74.39576291' WHERE id=893; -- Arbeláez / Cundinamarca
      UPDATE sip_municipio SET latitud='4.791721105', longitud='-74.71491399' WHERE id=1373; -- Beltrán / Cundinamarca
      UPDATE sip_municipio SET latitud='4.847821091', longitud='-74.52862766' WHERE id=1458; -- Bituima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.705576252', longitud='-74.3354077' WHERE id=1464; -- Bojacá / Cundinamarca
      UPDATE sip_municipio SET latitud='3.91861924', longitud='-74.44615606' WHERE id=131; -- Cabrera / Cundinamarca
      UPDATE sip_municipio SET latitud='4.723063341', longitud='-74.45919528' WHERE id=135; -- Cachipay / Cundinamarca
      UPDATE sip_municipio SET latitud='4.930402779', longitud='-74.02985115' WHERE id=142; -- Cajicá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.381501399', longitud='-74.52123595' WHERE id=198; -- Caparrapí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.402259457', longitud='-73.94482435' WHERE id=217; -- Cáqueza / Cundinamarca
      UPDATE sip_municipio SET latitud='5.338856556', longitud='-73.92614817' WHERE id=221; -- Carmen De Carupa / Cundinamarca
      UPDATE sip_municipio SET latitud='4.95425175', longitud='-74.63090139' WHERE id=242; -- Chaguaní / Cundinamarca
      UPDATE sip_municipio SET latitud='4.857823671', longitud='-74.03809539' WHERE id=262; -- Chía / Cundinamarca
      UPDATE sip_municipio SET latitud='4.463746629', longitud='-74.04605246' WHERE id=265; -- Chipaque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.578183896', longitud='-73.95290054' WHERE id=277; -- Choachí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.118419271', longitud='-73.68068583' WHERE id=280; -- Chocontá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.103127532', longitud='-73.97536559' WHERE id=334; -- Cogua / Cundinamarca
      UPDATE sip_municipio SET latitud='4.76754674', longitud='-74.1415583' WHERE id=363; -- Cota / Cundinamarca
      UPDATE sip_municipio SET latitud='5.230308105', longitud='-73.78001885' WHERE id=385; -- Cucunubá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.556947085', longitud='-74.42658478' WHERE id=425; -- El Colegio / Cundinamarca
      UPDATE sip_municipio SET latitud='5.261728244', longitud='-74.30830564' WHERE id=450; -- El Peñón / Cundinamarca
      UPDATE sip_municipio SET latitud='4.879723016', longitud='-74.23802273' WHERE id=456; -- El Rosal / Cundinamarca
      UPDATE sip_municipio SET latitud='4.834052334', longitud='-74.3380229' WHERE id=469; -- Facatativá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.528568462', longitud='-73.79705267' WHERE id=482; -- Fómeque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.316280072', longitud='-73.95286784' WHERE id=485; -- Fosca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.743996711', longitud='-74.19865992' WHERE id=489; -- Funza / Cundinamarca
      UPDATE sip_municipio SET latitud='5.416288902', longitud='-73.77059829' WHERE id=493; -- Fúquene / Cundinamarca
      UPDATE sip_municipio SET latitud='4.323534028', longitud='-74.38859114' WHERE id=497; -- Fusagasugá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.65495513', longitud='-73.51055381' WHERE id=498; -- Gachalá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.01001953', longitud='-73.87671759' WHERE id=500; -- Gachancipá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.867551134', longitud='-73.61773287' WHERE id=505; -- Gachetá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.723573464', longitud='-73.60054441' WHERE id=508; -- Gama / Cundinamarca
      UPDATE sip_municipio SET latitud='4.338154518', longitud='-74.81143922' WHERE id=547; -- Girardot / Cundinamarca
      UPDATE sip_municipio SET latitud='4.523484884', longitud='-74.33724619' WHERE id=553; -- Granada / Cundinamarca
      UPDATE sip_municipio SET latitud='5.387291542', longitud='-73.69328234' WHERE id=560; -- Guachetá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.173554764', longitud='-74.64014651' WHERE id=573; -- Guaduas / Cundinamarca
      UPDATE sip_municipio SET latitud='4.801276832', longitud='-73.84643485' WHERE id=578; -- Guasca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.516381655', longitud='-74.78257788' WHERE id=581; -- Guataquí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.91158717', longitud='-73.78648564' WHERE id=586; -- Guatavita / Cundinamarca
      UPDATE sip_municipio SET latitud='4.866310254', longitud='-74.4767709' WHERE id=588; -- Guayabal De Síquima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.231875945', longitud='-73.83543981' WHERE id=591; -- Guayabetal / Cundinamarca
      UPDATE sip_municipio SET latitud='4.166089563', longitud='-74.0246527' WHERE id=592; -- Gutiérrez / Cundinamarca
      UPDATE sip_municipio SET latitud='4.571350254', longitud='-74.68915854' WHERE id=627; -- Jerusalén / Cundinamarca
      UPDATE sip_municipio SET latitud='4.705170789', longitud='-73.69247873' WHERE id=632; -- Junín / Cundinamarca
      UPDATE sip_municipio SET latitud='4.700785443', longitud='-73.92939921' WHERE id=636; -- La Calera / Cundinamarca
      UPDATE sip_municipio SET latitud='4.650773167', longitud='-74.47321717' WHERE id=653; -- La Mesa / Cundinamarca
      UPDATE sip_municipio SET latitud='5.333400646', longitud='-74.40807863' WHERE id=658; -- La Palma / Cundinamarca
      UPDATE sip_municipio SET latitud='5.20459882', longitud='-74.40786611' WHERE id=662; -- La Peña / Cundinamarca
      UPDATE sip_municipio SET latitud='4.978619842', longitud='-74.33936061' WHERE id=700; -- La Vega / Cundinamarca
      UPDATE sip_municipio SET latitud='5.303637171', longitud='-73.68153228' WHERE id=708; -- Lenguazaque / Cundinamarca
      UPDATE sip_municipio SET latitud='5.040349198', longitud='-73.61738241' WHERE id=734; -- Machetá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75156751', longitud='-74.2896305' WHERE id=739; -- Madrid / Cundinamarca
      UPDATE sip_municipio SET latitud='4.976881151', longitud='-73.56313741' WHERE id=750; -- Manta / Cundinamarca
      UPDATE sip_municipio SET latitud='4.484437919', longitud='-73.40598487' WHERE id=751; -- Medina / Cundinamarca
      UPDATE sip_municipio SET latitud='4.672714223', longitud='-74.23573194' WHERE id=794; -- Mosquera / Cundinamarca
      UPDATE sip_municipio SET latitud='4.407952015', longitud='-74.80565317' WHERE id=803; -- Nariño / Cundinamarca
      UPDATE sip_municipio SET latitud='5.093705358', longitud='-73.88380238' WHERE id=808; -- Nemocón / Cundinamarca
      UPDATE sip_municipio SET latitud='4.294780933', longitud='-74.614695' WHERE id=809; -- Nilo / Cundinamarca
      UPDATE sip_municipio SET latitud='5.121445325', longitud='-74.39737048' WHERE id=810; -- Nimaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.066110761', longitud='-74.38975476' WHERE id=815; -- Nocaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.168367634', longitud='-74.16336544' WHERE id=867; -- Pacho / Cundinamarca
      UPDATE sip_municipio SET latitud='5.387647345', longitud='-74.16395696' WHERE id=875; -- Paime / Cundinamarca
      UPDATE sip_municipio SET latitud='4.180497268', longitud='-74.4711213' WHERE id=891; -- Pandi / Cundinamarca
      UPDATE sip_municipio SET latitud='4.368158959', longitud='-73.2416614' WHERE id=895; -- Paratebueno / Cundinamarca
      UPDATE sip_municipio SET latitud='4.293733611', longitud='-74.27396924' WHERE id=902; -- Pasca / Cundinamarca
      UPDATE sip_municipio SET latitud='5.619752748', longitud='-74.5801923' WHERE id=950; -- Puerto Salgar / Cundinamarca
      UPDATE sip_municipio SET latitud='4.691336253', longitud='-74.68074404' WHERE id=964; -- Pulí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.09998103', longitud='-74.4945107' WHERE id=978; -- Quebradanegra / Cundinamarca
      UPDATE sip_municipio SET latitud='4.334589044', longitud='-73.85264561' WHERE id=979; -- Quetame / Cundinamarca
      UPDATE sip_municipio SET latitud='4.726907976', longitud='-74.55359926' WHERE id=982; -- Quipile / Cundinamarca
      UPDATE sip_municipio SET latitud='4.307363489', longitud='-74.72943403' WHERE id=1022; -- Ricaurte / Cundinamarca
      UPDATE sip_municipio SET latitud='4.599741357', longitud='-74.34490342' WHERE id=1050; -- San Antonio Del Tequendama / Cundinamarca
      UPDATE sip_municipio SET latitud='4.140958464', longitud='-74.35397692' WHERE id=1054; -- San Bernardo / Cundinamarca
      UPDATE sip_municipio SET latitud='5.314600423', longitud='-74.07232077' WHERE id=1061; -- San Cayetano / Cundinamarca
      UPDATE sip_municipio SET latitud='4.964100703', longitud='-74.27217129' WHERE id=1067; -- San Francisco / Cundinamarca
      UPDATE sip_municipio SET latitud='4.814537831', longitud='-74.61525985' WHERE id=1078; -- San Juan De Rioseco / Cundinamarca
      UPDATE sip_municipio SET latitud='4.946805263', longitud='-74.41230921' WHERE id=1185; -- Sasaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.000633875', longitud='-73.77206544' WHERE id=1195; -- Sesquilé / Cundinamarca
      UPDATE sip_municipio SET latitud='4.465970004', longitud='-74.26328963' WHERE id=1199; -- Sibaté / Cundinamarca
      UPDATE sip_municipio SET latitud='4.436967141', longitud='-74.37050903' WHERE id=1202; -- Silvania / Cundinamarca
      UPDATE sip_municipio SET latitud='5.509773128', longitud='-73.84519164' WHERE id=1206; -- Simijaca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.581866267', longitud='-74.24029696' WHERE id=1216; -- Soacha / Cundinamarca
      UPDATE sip_municipio SET latitud='4.888060112', longitud='-73.96587528' WHERE id=1225; -- Sopó / Cundinamarca
      UPDATE sip_municipio SET latitud='4.970358034', longitud='-74.15689923' WHERE id=1236; -- Subachoque / Cundinamarca
      UPDATE sip_municipio SET latitud='5.122728461', longitud='-73.82427313' WHERE id=1245; -- Suesca / Cundinamarca
      UPDATE sip_municipio SET latitud='5.061692703', longitud='-74.23138328' WHERE id=1251; -- Supatá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.440092358', longitud='-73.82392529' WHERE id=1254; -- Susa / Cundinamarca
      UPDATE sip_municipio SET latitud='5.242909347', longitud='-73.85540343' WHERE id=1261; -- Sutatausa / Cundinamarca
      UPDATE sip_municipio SET latitud='4.951520046', longitud='-74.08449648' WHERE id=1264; -- Tabio / Cundinamarca
      UPDATE sip_municipio SET latitud='5.170527212', longitud='-73.95819594' WHERE id=1278; -- Tausa / Cundinamarca
      UPDATE sip_municipio SET latitud='4.666608192', longitud='-74.36764956' WHERE id=1280; -- Tena / Cundinamarca
      UPDATE sip_municipio SET latitud='4.838548601', longitud='-74.14680287' WHERE id=1286; -- Tenjo / Cundinamarca
      UPDATE sip_municipio SET latitud='4.321357899', longitud='-74.48667274' WHERE id=1310; -- Tibacuy / Cundinamarca
      UPDATE sip_municipio SET latitud='5.084102682', longitud='-73.51362546' WHERE id=1312; -- Tibirita / Cundinamarca
      UPDATE sip_municipio SET latitud='4.452072974', longitud='-74.64864406' WHERE id=1325; -- Tocaima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.968852913', longitud='-73.92887021' WHERE id=1328; -- Tocancipá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.355688386', longitud='-74.28963994' WHERE id=1337; -- Topaipí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.803805182', longitud='-73.47654604' WHERE id=1353; -- Ubalá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.500754182', longitud='-73.97564545' WHERE id=1354; -- Ubaque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.244611163', longitud='-74.11187304' WHERE id=1359; -- Une / Cundinamarca
      UPDATE sip_municipio SET latitud='5.192795708', longitud='-74.47780003' WHERE id=1364; -- Útica / Cundinamarca
      UPDATE sip_municipio SET latitud='4.063342074', longitud='-74.45259796' WHERE id=857; -- Venecia / Cundinamarca
      UPDATE sip_municipio SET latitud='5.131267542', longitud='-74.30979229' WHERE id=1379; -- Vergara / Cundinamarca
      UPDATE sip_municipio SET latitud='4.914040619', longitud='-74.54936655' WHERE id=1383; -- Vianí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.316080652', longitud='-73.82010566' WHERE id=1357; -- Villa De San Diego De Ubaté / Cundinamarca
      UPDATE sip_municipio SET latitud='5.270694636', longitud='-74.19074375' WHERE id=1389; -- Villagómez / Cundinamarca
      UPDATE sip_municipio SET latitud='5.227298709', longitud='-73.57725921' WHERE id=1395; -- Villapinzón / Cundinamarca
      UPDATE sip_municipio SET latitud='5.011670402', longitud='-74.48764746' WHERE id=1399; -- Villeta / Cundinamarca
      UPDATE sip_municipio SET latitud='4.436054105', longitud='-74.48543339' WHERE id=1401; -- Viotá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.591910157', longitud='-74.36480865' WHERE id=1410; -- Yacopí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75432173', longitud='-74.38673444' WHERE id=1429; -- Zipacón / Cundinamarca
      UPDATE sip_municipio SET latitud='5.06631685', longitud='-74.04960323' WHERE id=1430; -- Zipaquirá / Cundinamarca
      UPDATE sip_municipio SET latitud='3.140558454', longitud='-69.69713423' WHERE id=594; -- Barrancominas / Guainía
      UPDATE sip_municipio SET latitud='3.38616245', longitud='-67.58507998' WHERE id=1414; -- Cacahual / Guainía
      UPDATE sip_municipio SET latitud='3.516363079', longitud='-68.00834728' WHERE id=35; -- Inírida / Guainía
      UPDATE sip_municipio SET latitud='1.404540273', longitud='-67.001518' WHERE id=1408; -- La Guadalupe / Guainía
      UPDATE sip_municipio SET latitud='2.421444806', longitud='-69.84001585' WHERE id=1417; -- Morichal / Guainía
      UPDATE sip_municipio SET latitud='1.981055294', longitud='-69.11440036' WHERE id=1415; -- Pana Pana / Guainía
      UPDATE sip_municipio SET latitud='2.582829542', longitud='-68.25799033' WHERE id=1407; -- Puerto Colombia / Guainía
      UPDATE sip_municipio SET latitud='2.312179782', longitud='-67.52060569' WHERE id=1406; -- San Felipe / Guainía
      UPDATE sip_municipio SET latitud='1.613634284', longitud='-73.0342639' WHERE id=201; -- Calamar / Guaviare
      UPDATE sip_municipio SET latitud='2.143447362', longitud='-72.24364869' WHERE id=433; -- El Retorno / Guaviare
      UPDATE sip_municipio SET latitud='1.363974932', longitud='-72.01810951' WHERE id=335; -- Miraflores / Guaviare
      UPDATE sip_municipio SET latitud='2.484286091', longitud='-71.91916993' WHERE id=51; -- San José Del Guaviare / Guaviare
      UPDATE sip_municipio SET latitud='1.709114446', longitud='-75.99664184' WHERE id=988; -- Acevedo / Huila
      UPDATE sip_municipio SET latitud='2.26975042', longitud='-75.71632236' WHERE id=146; -- Agrado / Huila
      UPDATE sip_municipio SET latitud='3.243441923', longitud='-75.27670655' WHERE id=223; -- Aipe / Huila
      UPDATE sip_municipio SET latitud='2.49785068', longitud='-75.29134946' WHERE id=326; -- Algeciras / Huila
      UPDATE sip_municipio SET latitud='2.07922808', longitud='-75.76858288' WHERE id=453; -- Altamira / Huila
      UPDATE sip_municipio SET latitud='3.135423634', longitud='-74.95797796' WHERE id=1256; -- Baraya / Huila
      UPDATE sip_municipio SET latitud='2.658666675', longitud='-75.32943803' WHERE id=169; -- Campoalegre / Huila
      UPDATE sip_municipio SET latitud='3.262763564', longitud='-74.78516117' WHERE id=342; -- Colombia / Huila
      UPDATE sip_municipio SET latitud='2.022053305', longitud='-75.94430521' WHERE id=420; -- Elías / Huila
      UPDATE sip_municipio SET latitud='2.172441496', longitud='-75.57131243' WHERE id=506; -- Garzón / Huila
      UPDATE sip_municipio SET latitud='2.371781539', longitud='-75.51699754' WHERE id=544; -- Gigante / Huila
      UPDATE sip_municipio SET latitud='1.984394016', longitud='-75.69693549' WHERE id=569; -- Guadalupe / Huila
      UPDATE sip_municipio SET latitud='2.541654161', longitud='-75.44781083' WHERE id=600; -- Hobo / Huila
      UPDATE sip_municipio SET latitud='2.691517773', longitud='-75.67383141' WHERE id=612; -- Íquira / Huila
      UPDATE sip_municipio SET latitud='1.945591321', longitud='-76.18204722' WHERE id=613; -- Isnos / Huila
      UPDATE sip_municipio SET latitud='2.156287619', longitud='-76.00679451' WHERE id=641; -- La Argentina / Huila
      UPDATE sip_municipio SET latitud='2.328076586', longitud='-76.00117299' WHERE id=659; -- La Plata / Huila
      UPDATE sip_municipio SET latitud='2.576066285', longitud='-75.78693757' WHERE id=806; -- Nátaga / Huila
      UPDATE sip_municipio SET latitud='2.993360046', longitud='-75.27236232' WHERE id=42; -- Neiva / Huila
      UPDATE sip_municipio SET latitud='2.061191362', longitud='-76.04110289' WHERE id=854; -- Oporapa / Huila
      UPDATE sip_municipio SET latitud='2.40689827', longitud='-75.72803027' WHERE id=874; -- Paicol / Huila
      UPDATE sip_municipio SET latitud='2.914491967', longitud='-75.44066118' WHERE id=888; -- Palermo / Huila
      UPDATE sip_municipio SET latitud='1.68458076', longitud='-76.1478559' WHERE id=894; -- Palestina / Huila
      UPDATE sip_municipio SET latitud='2.259601773', longitud='-75.8319516' WHERE id=918; -- Pital / Huila
      UPDATE sip_municipio SET latitud='1.848217185', longitud='-76.05217643' WHERE id=926; -- Pitalito / Huila
      UPDATE sip_municipio SET latitud='2.79286115', longitud='-75.23536868' WHERE id=1029; -- Rivera / Huila
      UPDATE sip_municipio SET latitud='2.100382849', longitud='-76.22897871' WHERE id=1072; -- Saladoblanco / Huila
      UPDATE sip_municipio SET latitud='1.924165493', longitud='-76.4165655' WHERE id=1088; -- San Agustín / Huila
      UPDATE sip_municipio SET latitud='2.926265937', longitud='-75.63359786' WHERE id=1110; -- Santa María / Huila
      UPDATE sip_municipio SET latitud='1.870992095', longitud='-75.80798471' WHERE id=1242; -- Suaza / Huila
      UPDATE sip_municipio SET latitud='2.130280544', longitud='-75.87534845' WHERE id=1276; -- Tarqui / Huila
      UPDATE sip_municipio SET latitud='3.030611777', longitud='-75.08536553' WHERE id=1285; -- Tello / Huila
      UPDATE sip_municipio SET latitud='2.851852692', longitud='-75.75988934' WHERE id=1308; -- Teruel / Huila
      UPDATE sip_municipio SET latitud='2.526855132', longitud='-75.68259642' WHERE id=1281; -- Tesalia / Huila
      UPDATE sip_municipio SET latitud='1.950715226', longitud='-75.91757649' WHERE id=1314; -- Timaná / Huila
      UPDATE sip_municipio SET latitud='3.287057875', longitud='-75.13838292' WHERE id=1391; -- Villavieja / Huila
      UPDATE sip_municipio SET latitud='2.646563339', longitud='-75.51592645' WHERE id=1412; -- Yaguará / Huila
      UPDATE sip_municipio SET latitud='11.22869049', longitud='-72.53209657' WHERE id=602; -- Albania / La Guajira
      UPDATE sip_municipio SET latitud='10.94871677', longitud='-72.69696879' WHERE id=1257; -- Barrancas / La Guajira
      UPDATE sip_municipio SET latitud='11.09029715', longitud='-73.43568788' WHERE id=1452; -- Dibulla / La Guajira
      UPDATE sip_municipio SET latitud='10.92505107', longitud='-72.94444027' WHERE id=1461; -- Distracción / La Guajira
      UPDATE sip_municipio SET latitud='10.63669646', longitud='-72.8858431' WHERE id=110; -- El Molino / La Guajira
      UPDATE sip_municipio SET latitud='10.8283716', longitud='-72.8018178' WHERE id=481; -- Fonseca / La Guajira
      UPDATE sip_municipio SET latitud='11.09905582', longitud='-72.73842427' WHERE id=640; -- Hatonuevo / La Guajira
      UPDATE sip_municipio SET latitud='10.4580941', longitud='-73.07209193' WHERE id=728; -- La Jagua Del Pilar / La Guajira
      UPDATE sip_municipio SET latitud='11.38157764', longitud='-72.29500818' WHERE id=741; -- Maicao / La Guajira
      UPDATE sip_municipio SET latitud='11.60554263', longitud='-72.57160392' WHERE id=933; -- Manaure / La Guajira
      UPDATE sip_municipio SET latitud='11.24297214', longitud='-72.95876315' WHERE id=49; -- Riohacha / La Guajira
      UPDATE sip_municipio SET latitud='10.81311496', longitud='-73.08659986' WHERE id=1058; -- San Juan Del Cesar / La Guajira
      UPDATE sip_municipio SET latitud='11.99971986', longitud='-71.74882662' WHERE id=1361; -- Uribia / La Guajira
      UPDATE sip_municipio SET latitud='10.4947021', longitud='-72.98623991' WHERE id=1367; -- Urumita / La Guajira
      UPDATE sip_municipio SET latitud='10.58364755', longitud='-72.97520286' WHERE id=1398; -- Villanueva / La Guajira
      UPDATE sip_municipio SET latitud='10.25356475', longitud='-74.10323027' WHERE id=534; -- Algarrobo / Magdalena
      UPDATE sip_municipio SET latitud='10.64490877', longitud='-73.87972257' WHERE id=892; -- Aracataca / Magdalena
      UPDATE sip_municipio SET latitud='9.834264955', longitud='-74.08460085' WHERE id=962; -- Ariguaní / Magdalena
      UPDATE sip_municipio SET latitud='10.3132933', longitud='-74.80834413' WHERE id=236; -- Cerro De San Antonio / Magdalena
      UPDATE sip_municipio SET latitud='10.09951961', longitud='-74.52606667' WHERE id=254; -- Chivolo / Magdalena
      UPDATE sip_municipio SET latitud='10.85754552', longitud='-74.02500493' WHERE id=285; -- Ciénaga / Magdalena
      UPDATE sip_municipio SET latitud='10.23284801', longitud='-74.77810175' WHERE id=339; -- Concordia / Magdalena
      UPDATE sip_municipio SET latitud='9.114930635', longitud='-73.98105491' WHERE id=421; -- El Banco / Magdalena
      UPDATE sip_municipio SET latitud='10.34310988', longitud='-74.67817756' WHERE id=451; -- El Piñón / Magdalena
      UPDATE sip_municipio SET latitud='10.65961696', longitud='-74.3251597' WHERE id=467; -- El Retén / Magdalena
      UPDATE sip_municipio SET latitud='10.45937818', longitud='-73.88406518' WHERE id=492; -- Fundación / Magdalena
      UPDATE sip_municipio SET latitud='9.248004673', longitud='-74.13968085' WHERE id=564; -- Guamal / Magdalena
      UPDATE sip_municipio SET latitud='9.735998134', longitud='-74.32840222' WHERE id=778; -- Nueva Granada / Magdalena
      UPDATE sip_municipio SET latitud='10.15429546', longitud='-74.83178091' WHERE id=908; -- Pedraza / Magdalena
      UPDATE sip_municipio SET latitud='9.530748654', longitud='-74.1447657' WHERE id=913; -- Pijiño Del Carmen / Magdalena
      UPDATE sip_municipio SET latitud='10.43303399', longitud='-74.41251197' WHERE id=927; -- Pivijay / Magdalena
      UPDATE sip_municipio SET latitud='9.76945611', longitud='-74.60181576' WHERE id=931; -- Plato / Magdalena
      UPDATE sip_municipio SET latitud='10.84758901', longitud='-74.36057942' WHERE id=945; -- Puebloviejo / Magdalena
      UPDATE sip_municipio SET latitud='10.64860351', longitud='-74.58106823' WHERE id=1016; -- Remolino / Magdalena
      UPDATE sip_municipio SET latitud='10.10533028', longitud='-74.2644392' WHERE id=1070; -- Sabanas De San Ángel / Magdalena
      UPDATE sip_municipio SET latitud='10.51538178', longitud='-74.72296972' WHERE id=1105; -- Salamina / Magdalena
      UPDATE sip_municipio SET latitud='9.380680272', longitud='-74.19797988' WHERE id=1144; -- San Sebastián De Buenavista / Magdalena
      UPDATE sip_municipio SET latitud='9.306869548', longitud='-74.35851644' WHERE id=1177; -- San Zenón / Magdalena
      UPDATE sip_municipio SET latitud='9.503097215', longitud='-74.44419381' WHERE id=1179; -- Santa Ana / Magdalena
      UPDATE sip_municipio SET latitud='9.484388135', longitud='-74.66521178' WHERE id=1186; -- Santa Bárbara De Pinto / Magdalena
      UPDATE sip_municipio SET latitud='11.12189436', longitud='-73.88527855' WHERE id=52; -- Santa Marta / Magdalena
      UPDATE sip_municipio SET latitud='10.89027616', longitud='-74.62966038' WHERE id=1208; -- Sitionuevo / Magdalena
      UPDATE sip_municipio SET latitud='9.924701267', longitud='-74.73263001' WHERE id=1283; -- Tenerife / Magdalena
      UPDATE sip_municipio SET latitud='10.11779893', longitud='-74.69115456' WHERE id=1459; -- Zapayán / Magdalena
      UPDATE sip_municipio SET latitud='10.79634658', longitud='-74.17798317' WHERE id=1462; -- Zona Bananera / Magdalena
      UPDATE sip_municipio SET latitud='3.943383008', longitud='-73.57135162' WHERE id=986; -- Acacías / Meta
      UPDATE sip_municipio SET latitud='4.519076127', longitud='-72.99548981' WHERE id=106; -- Barranca De Upía / Meta
      UPDATE sip_municipio SET latitud='4.315244759', longitud='-72.95268896' WHERE id=136; -- Cabuyaro / Meta
      UPDATE sip_municipio SET latitud='3.805154089', longitud='-73.53886668' WHERE id=216; -- Castilla La Nueva / Meta
      UPDATE sip_municipio SET latitud='3.834631516', longitud='-74.06232494' WHERE id=380; -- Cubarral / Meta
      UPDATE sip_municipio SET latitud='4.232526389', longitud='-73.31477539' WHERE id=387; -- Cumaral / Meta
      UPDATE sip_municipio SET latitud='4.353769888', longitud='-73.71441684' WHERE id=422; -- El Calvario / Meta
      UPDATE sip_municipio SET latitud='3.60282633', longitud='-73.89445238' WHERE id=444; -- El Castillo / Meta
      UPDATE sip_municipio SET latitud='3.706969785', longitud='-73.83161892' WHERE id=471; -- El Dorado / Meta
      UPDATE sip_municipio SET latitud='3.382370124', longitud='-73.59625429' WHERE id=490; -- Fuente De Oro / Meta
      UPDATE sip_municipio SET latitud='3.441051399', longitud='-73.7611547' WHERE id=556; -- Granada / Meta
      UPDATE sip_municipio SET latitud='3.947775585', longitud='-73.95983864' WHERE id=565; -- Guamal / Meta
      UPDATE sip_municipio SET latitud='2.161863917', longitud='-74.09488076' WHERE id=605; -- La Macarena / Meta
      UPDATE sip_municipio SET latitud='3.614714873', longitud='-74.09628467' WHERE id=696; -- Lejanías / Meta
      UPDATE sip_municipio SET latitud='3.117523361', longitud='-71.93805692' WHERE id=584; -- Mapiripán / Meta
      UPDATE sip_municipio SET latitud='3.154771201', longitud='-74.12454824' WHERE id=589; -- Mesetas / Meta
      UPDATE sip_municipio SET latitud='2.752260112', longitud='-72.7210941' WHERE id=771; -- Puerto Concordia / Meta
      UPDATE sip_municipio SET latitud='4.005034467', longitud='-71.63157429' WHERE id=941; -- Puerto Gaitán / Meta
      UPDATE sip_municipio SET latitud='3.193092925', longitud='-73.23671436' WHERE id=960; -- Puerto Lleras / Meta
      UPDATE sip_municipio SET latitud='4.014298921', longitud='-72.64570499' WHERE id=954; -- Puerto López / Meta
      UPDATE sip_municipio SET latitud='2.758083657', longitud='-73.13780171' WHERE id=974; -- Puerto Rico / Meta
      UPDATE sip_municipio SET latitud='4.204310977', longitud='-73.50226037' WHERE id=1018; -- Restrepo / Meta
      UPDATE sip_municipio SET latitud='3.84761678', longitud='-73.27583401' WHERE id=1118; -- San Carlos De Guaroa / Meta
      UPDATE sip_municipio SET latitud='3.289851171', longitud='-73.81635243' WHERE id=1124; -- San Juan De Arama / Meta
      UPDATE sip_municipio SET latitud='4.471346322', longitud='-73.66041355' WHERE id=1130; -- San Juanito / Meta
      UPDATE sip_municipio SET latitud='3.515860962', longitud='-72.65672742' WHERE id=1139; -- San Martín / Meta
      UPDATE sip_municipio SET latitud='3.047726858', longitud='-74.43066134' WHERE id=630; -- Uribe / Meta
      UPDATE sip_municipio SET latitud='4.09166877', longitud='-73.49291595' WHERE id=57; -- Villavicencio / Meta
      UPDATE sip_municipio SET latitud='2.811616698', longitud='-73.66652234' WHERE id=1182; -- Vistahermosa / Meta
      UPDATE sip_municipio SET latitud='1.469854084', longitud='-77.06880947' WHERE id=287; -- Albán / Nariño
      UPDATE sip_municipio SET latitud='0.913431916', longitud='-77.69538731' WHERE id=371; -- Aldana / Nariño
      UPDATE sip_municipio SET latitud='1.245254077', longitud='-77.53115777' WHERE id=614; -- Ancuya / Nariño
      UPDATE sip_municipio SET latitud='1.480051172', longitud='-77.12985001' WHERE id=861; -- Arboleda / Nariño
      UPDATE sip_municipio SET latitud='1.44563774', longitud='-78.15621072' WHERE id=1270; -- Barbacoas / Nariño
      UPDATE sip_municipio SET latitud='1.593645287', longitud='-77.01999366' WHERE id=1341; -- Belén / Nariño
      UPDATE sip_municipio SET latitud='1.315215636', longitud='-77.1163664' WHERE id=109; -- Buesaco / Nariño
      UPDATE sip_municipio SET latitud='1.386497844', longitud='-77.26969022' WHERE id=415; -- Chachagüí / Nariño
      UPDATE sip_municipio SET latitud='1.636334379', longitud='-77.0473156' WHERE id=336; -- Colón / Nariño
      UPDATE sip_municipio SET latitud='1.209066732', longitud='-77.44063921' WHERE id=346; -- Consacá / Nariño
      UPDATE sip_municipio SET latitud='0.932667458', longitud='-77.52808731' WHERE id=356; -- Contadero / Nariño
      UPDATE sip_municipio SET latitud='0.78274688', longitud='-77.36805903' WHERE id=366; -- Córdoba / Nariño
      UPDATE sip_municipio SET latitud='0.875426999', longitud='-77.73591601' WHERE id=383; -- Cuaspud Carlosama / Nariño
      UPDATE sip_municipio SET latitud='0.944223274', longitud='-77.95958446' WHERE id=390; -- Cumbal / Nariño
      UPDATE sip_municipio SET latitud='1.72559011', longitud='-77.59281637' WHERE id=400; -- Cumbitara / Nariño
      UPDATE sip_municipio SET latitud='2.216382295', longitud='-77.99533234' WHERE id=437; -- El Charco / Nariño
      UPDATE sip_municipio SET latitud='1.512283967', longitud='-77.43050934' WHERE id=445; -- El Peñol / Nariño
      UPDATE sip_municipio SET latitud='1.887689437', longitud='-77.48319589' WHERE id=448; -- El Rosario / Nariño
      UPDATE sip_municipio SET latitud='1.409430207', longitud='-76.98526959' WHERE id=452; -- El Tablón De Gómez / Nariño
      UPDATE sip_municipio SET latitud='1.43026376', longitud='-77.38311597' WHERE id=457; -- El Tambo / Nariño
      UPDATE sip_municipio SET latitud='2.088531925', longitud='-78.59193099' WHERE id=879; -- Francisco Pizarro / Nariño
      UPDATE sip_municipio SET latitud='0.957786429', longitud='-77.39532781' WHERE id=491; -- Funes / Nariño
      UPDATE sip_municipio SET latitud='0.975037904', longitud='-77.73758941' WHERE id=561; -- Guachucal / Nariño
      UPDATE sip_municipio SET latitud='1.151366658', longitud='-77.53011336' WHERE id=574; -- Guaitarilla / Nariño
      UPDATE sip_municipio SET latitud='0.928642623', longitud='-77.58261883' WHERE id=580; -- Gualmatán / Nariño
      UPDATE sip_municipio SET latitud='0.980534037', longitud='-77.5186573' WHERE id=607; -- Iles / Nariño
      UPDATE sip_municipio SET latitud='1.07287697', longitud='-77.50150864' WHERE id=609; -- Imués / Nariño
      UPDATE sip_municipio SET latitud='0.497708465', longitud='-77.24047625' WHERE id=611; -- Ipiales / Nariño
      UPDATE sip_municipio SET latitud='1.584175998', longitud='-76.92335262' WHERE id=642; -- La Cruz / Nariño
      UPDATE sip_municipio SET latitud='1.338034371', longitud='-77.42293041' WHERE id=647; -- La Florida / Nariño
      UPDATE sip_municipio SET latitud='1.541847847', longitud='-77.61781608' WHERE id=651; -- La Llanada / Nariño
      UPDATE sip_municipio SET latitud='2.56027333', longitud='-78.23506694' WHERE id=656; -- La Tola / Nariño
      UPDATE sip_municipio SET latitud='1.619697376', longitud='-77.14284622' WHERE id=664; -- La Unión / Nariño
      UPDATE sip_municipio SET latitud='1.900862361', longitud='-77.31220073' WHERE id=704; -- Leiva / Nariño
      UPDATE sip_municipio SET latitud='1.395173084', longitud='-77.52093774' WHERE id=715; -- Linares / Nariño
      UPDATE sip_municipio SET latitud='1.672601269', longitud='-77.71054449' WHERE id=719; -- Los Andes / Nariño
      UPDATE sip_municipio SET latitud='1.906858429', longitud='-78.04473644' WHERE id=735; -- Magüí / Nariño
      UPDATE sip_municipio SET latitud='1.155947016', longitud='-77.84664646' WHERE id=748; -- Mallama / Nariño
      UPDATE sip_municipio SET latitud='2.442493698', longitud='-78.438827' WHERE id=795; -- Mosquera / Nariño
      UPDATE sip_municipio SET latitud='1.286775273', longitud='-77.35220367' WHERE id=802; -- Nariño / Nariño
      UPDATE sip_municipio SET latitud='2.287856547', longitud='-78.31219024' WHERE id=813; -- Olaya Herrera / Nariño
      UPDATE sip_municipio SET latitud='1.029815854', longitud='-77.55234944' WHERE id=856; -- Ospina / Nariño
      UPDATE sip_municipio SET latitud='1.083605497', longitud='-77.20610074' WHERE id=44; -- Pasto / Nariño
      UPDATE sip_municipio SET latitud='1.735354202', longitud='-77.48134359' WHERE id=906; -- Policarpa / Nariño
      UPDATE sip_municipio SET latitud='0.785841088', longitud='-77.52870407' WHERE id=935; -- Potosí / Nariño
      UPDATE sip_municipio SET latitud='1.232864821', longitud='-77.59844212' WHERE id=939; -- Providencia / Nariño
      UPDATE sip_municipio SET latitud='0.854351651', longitud='-77.35032523' WHERE id=951; -- Puerres / Nariño
      UPDATE sip_municipio SET latitud='0.916769831', longitud='-77.63336954' WHERE id=969; -- Pupiales / Nariño
      UPDATE sip_municipio SET latitud='1.147671848', longitud='-78.05811118' WHERE id=1023; -- Ricaurte / Nariño
      UPDATE sip_municipio SET latitud='1.897581156', longitud='-78.3811163' WHERE id=1036; -- Roberto Payán / Nariño
      UPDATE sip_municipio SET latitud='1.430555262', longitud='-77.69179559' WHERE id=1111; -- Samaniego / Nariño
      UPDATE sip_municipio SET latitud='1.574550638', longitud='-78.61540963' WHERE id=1345; -- San Andrés De Tumaco / Nariño
      UPDATE sip_municipio SET latitud='1.529782485', longitud='-77.02070663' WHERE id=1128; -- San Bernardo / Nariño
      UPDATE sip_municipio SET latitud='1.542139582', longitud='-77.21872693' WHERE id=1136; -- San Lorenzo / Nariño
      UPDATE sip_municipio SET latitud='1.681576627', longitud='-76.97527979' WHERE id=1145; -- San Pablo / Nariño
      UPDATE sip_municipio SET latitud='1.536823494', longitud='-77.10140325' WHERE id=1148; -- San Pedro De Cartago / Nariño
      UPDATE sip_municipio SET latitud='1.288105409', longitud='-77.45670068' WHERE id=1125; -- Sandoná / Nariño
      UPDATE sip_municipio SET latitud='2.494420411', longitud='-77.98256461' WHERE id=1149; -- Santa Bárbara / Nariño
      UPDATE sip_municipio SET latitud='1.285179376', longitud='-77.7445744' WHERE id=1153; -- Santacruz / Nariño
      UPDATE sip_municipio SET latitud='1.045287475', longitud='-77.71810954' WHERE id=1188; -- Sapuyes / Nariño
      UPDATE sip_municipio SET latitud='1.591661392', longitud='-77.32525316' WHERE id=1265; -- Taminango / Nariño
      UPDATE sip_municipio SET latitud='1.064078111', longitud='-77.35063491' WHERE id=1268; -- Tangua / Nariño
      UPDATE sip_municipio SET latitud='1.134440523', longitud='-77.63073238' WHERE id=1351; -- Túquerres / Nariño
      UPDATE sip_municipio SET latitud='1.125547916', longitud='-77.42467569' WHERE id=1411; -- Yacuanquer / Nariño
      UPDATE sip_municipio SET latitud='8.019834481', longitud='-73.15850485' WHERE id=533; -- Ábrego / Norte de Santander
      UPDATE sip_municipio SET latitud='7.586048164', longitud='-72.91705315' WHERE id=862; -- Arboledas / Norte de Santander
      UPDATE sip_municipio SET latitud='7.608509339', longitud='-72.65951909' WHERE id=1463; -- Bochalema / Norte de Santander
      UPDATE sip_municipio SET latitud='8.079802239', longitud='-72.92919926' WHERE id=85; -- Bucarasica / Norte de Santander
      UPDATE sip_municipio SET latitud='7.684188896', longitud='-73.12939481' WHERE id=144; -- Cáchira / Norte de Santander
      UPDATE sip_municipio SET latitud='7.270560088', longitud='-72.65212153' WHERE id=140; -- Cácota / Norte de Santander
      UPDATE sip_municipio SET latitud='7.583353136', longitud='-72.58390978' WHERE id=258; -- Chinácota / Norte de Santander
      UPDATE sip_municipio SET latitud='7.05161677', longitud='-72.52544746' WHERE id=260; -- Chitagá / Norte de Santander
      UPDATE sip_municipio SET latitud='8.873159895', longitud='-73.20007769' WHERE id=344; -- Convención / Norte de Santander
      UPDATE sip_municipio SET latitud='7.502182366', longitud='-72.79703447' WHERE id=382; -- Cucutilla / Norte de Santander
      UPDATE sip_municipio SET latitud='7.746993206', longitud='-72.67208072' WHERE id=411; -- Durania / Norte de Santander
      UPDATE sip_municipio SET latitud='8.867990035', longitud='-73.34585922' WHERE id=424; -- El Carmen / Norte de Santander
      UPDATE sip_municipio SET latitud='8.678263671', longitud='-73.0317597' WHERE id=442; -- El Tarra / Norte de Santander
      UPDATE sip_municipio SET latitud='8.081200092', longitud='-72.63152118' WHERE id=458; -- El Zulia / Norte de Santander
      UPDATE sip_municipio SET latitud='7.906522991', longitud='-72.80705582' WHERE id=554; -- Gramalote / Norte de Santander
      UPDATE sip_municipio SET latitud='8.361831987', longitud='-73.0782633' WHERE id=595; -- Hacarí / Norte de Santander
      UPDATE sip_municipio SET latitud='7.493955781', longitud='-72.49269998' WHERE id=598; -- Herrán / Norte de Santander
      UPDATE sip_municipio SET latitud='7.695233593', longitud='-73.36139672' WHERE id=650; -- La Esperanza / Norte de Santander
      UPDATE sip_municipio SET latitud='8.256757875', longitud='-73.18789327' WHERE id=663; -- La Playa / Norte de Santander
      UPDATE sip_municipio SET latitud='7.218372474', longitud='-72.48281514' WHERE id=638; -- Labateca / Norte de Santander
      UPDATE sip_municipio SET latitud='7.742291094', longitud='-72.52680784' WHERE id=705; -- Los Patios / Norte de Santander
      UPDATE sip_municipio SET latitud='7.963712759', longitud='-72.8467029' WHERE id=722; -- Lourdes / Norte de Santander
      UPDATE sip_municipio SET latitud='7.31694997', longitud='-72.76834584' WHERE id=800; -- Mutiscua / Norte de Santander
      UPDATE sip_municipio SET latitud='8.206637527', longitud='-73.33765033' WHERE id=823; -- Ocaña / Norte de Santander
      UPDATE sip_municipio SET latitud='7.379057623', longitud='-72.67590348' WHERE id=877; -- Pamplona / Norte de Santander
      UPDATE sip_municipio SET latitud='7.48287886', longitud='-72.63515401' WHERE id=883; -- Pamplonita / Norte de Santander
      UPDATE sip_municipio SET latitud='8.329138642', longitud='-72.41119066' WHERE id=928; -- Puerto Santander / Norte de Santander
      UPDATE sip_municipio SET latitud='7.595355974', longitud='-72.50756622' WHERE id=984; -- Ragonvalia / Norte de Santander
      UPDATE sip_municipio SET latitud='7.772747824', longitud='-72.86769959' WHERE id=1073; -- Salazar / Norte de Santander
      UPDATE sip_municipio SET latitud='8.414441404', longitud='-73.2176038' WHERE id=1094; -- San Calixto / Norte de Santander
      UPDATE sip_municipio SET latitud='7.847872195', longitud='-72.60971203' WHERE id=1101; -- San Cayetano / Norte de Santander
      UPDATE sip_municipio SET latitud='8.112041811', longitud='-72.48862641' WHERE id=32; -- San José De Cúcuta / Norte de Santander
      UPDATE sip_municipio SET latitud='7.889234454', longitud='-72.7182541' WHERE id=1119; -- Santiago / Norte de Santander
      UPDATE sip_municipio SET latitud='8.215080767', longitud='-72.79580961' WHERE id=1189; -- Sardinata / Norte de Santander
      UPDATE sip_municipio SET latitud='7.180991879', longitud='-72.78617884' WHERE id=1201; -- Silos / Norte de Santander
      UPDATE sip_municipio SET latitud='8.760013794', longitud='-73.15714097' WHERE id=1306; -- Teorama / Norte de Santander
      UPDATE sip_municipio SET latitud='8.713507237', longitud='-72.79925855' WHERE id=1320; -- Tibú / Norte de Santander
      UPDATE sip_municipio SET latitud='7.225864961', longitud='-72.30593418' WHERE id=1330; -- Toledo / Norte de Santander
      UPDATE sip_municipio SET latitud='7.936293173', longitud='-72.98759418' WHERE id=1388; -- Villa Caro / Norte de Santander
      UPDATE sip_municipio SET latitud='7.718635863', longitud='-72.48361176' WHERE id=1397; -- Villa Del Rosario / Norte de Santander
      UPDATE sip_municipio SET latitud='1.204815876', longitud='-76.97376805' WHERE id=370; -- Colón / Putumayo
      UPDATE sip_municipio SET latitud='1.26070915', longitud='-76.66584349' WHERE id=40; -- Mocoa / Putumayo
      UPDATE sip_municipio SET latitud='0.673756323', longitud='-76.94313923' WHERE id=575; -- Orito / Putumayo
      UPDATE sip_municipio SET latitud='0.433884539', longitud='-76.52158203' WHERE id=940; -- Puerto Asís / Putumayo
      UPDATE sip_municipio SET latitud='0.70416861', longitud='-76.49864415' WHERE id=942; -- Puerto Caicedo / Putumayo
      UPDATE sip_municipio SET latitud='0.746432215', longitud='-75.88022979' WHERE id=946; -- Puerto Guzmán / Putumayo
      UPDATE sip_municipio SET latitud='0.05947197', longitud='-75.06479327' WHERE id=953; -- Puerto Leguízamo / Putumayo
      UPDATE sip_municipio SET latitud='1.136071096', longitud='-76.84726661' WHERE id=1217; -- San Francisco / Putumayo
      UPDATE sip_municipio SET latitud='0.272449048', longitud='-76.84510459' WHERE id=1222; -- San Miguel / Putumayo
      UPDATE sip_municipio SET latitud='1.036021482', longitud='-76.97751684' WHERE id=1228; -- Santiago / Putumayo
      UPDATE sip_municipio SET latitud='1.228746922', longitud='-76.91307585' WHERE id=1209; -- Sibundoy / Putumayo
      UPDATE sip_municipio SET latitud='0.42012589', longitud='-76.77067026' WHERE id=1381; -- Valle Del Guamuez / Putumayo
      UPDATE sip_municipio SET latitud='0.911149515', longitud='-76.74495447' WHERE id=1409; -- Villagarzón / Putumayo
      UPDATE sip_municipio SET latitud='4.499501128', longitud='-75.72489985' WHERE id=19; -- Armenia / Quindío
      UPDATE sip_municipio SET latitud='4.366632382', longitud='-75.74403734' WHERE id=111; -- Buenavista / Quindío
      UPDATE sip_municipio SET latitud='4.467879428', longitud='-75.65674719' WHERE id=165; -- Calarcá / Quindío
      UPDATE sip_municipio SET latitud='4.604845344', longitud='-75.66688449' WHERE id=297; -- Circasia / Quindío
      UPDATE sip_municipio SET latitud='4.395975176', longitud='-75.65132308' WHERE id=362; -- Córdoba / Quindío
      UPDATE sip_municipio SET latitud='4.669325347', longitud='-75.67146941' WHERE id=475; -- Filandia / Quindío
      UPDATE sip_municipio SET latitud='4.180107773', longitud='-75.76056695' WHERE id=543; -- Génova / Quindío
      UPDATE sip_municipio SET latitud='4.426884849', longitud='-75.81927335' WHERE id=698; -- La Tebaida / Quindío
      UPDATE sip_municipio SET latitud='4.521890945', longitud='-75.81806594' WHERE id=790; -- Montenegro / Quindío
      UPDATE sip_municipio SET latitud='4.30397934', longitud='-75.68330417' WHERE id=917; -- Pijao / Quindío
      UPDATE sip_municipio SET latitud='4.610273497', longitud='-75.79205087' WHERE id=980; -- Quimbaya / Quindío
      UPDATE sip_municipio SET latitud='4.611314654', longitud='-75.53092112' WHERE id=1141; -- Salento / Quindío
      UPDATE sip_municipio SET latitud='5.139635357', longitud='-75.95353871' WHERE id=767; -- Apía / Risaralda
      UPDATE sip_municipio SET latitud='4.918349676', longitud='-75.94275386' WHERE id=1212; -- Balboa / Risaralda
      UPDATE sip_municipio SET latitud='5.200398696', longitud='-75.86793893' WHERE id=1405; -- Belén De Umbría / Risaralda
      UPDATE sip_municipio SET latitud='4.842021144', longitud='-75.66993655' WHERE id=255; -- Dosquebradas / Risaralda
      UPDATE sip_municipio SET latitud='5.320295966', longitud='-75.80436659' WHERE id=568; -- Guática / Risaralda
      UPDATE sip_municipio SET latitud='4.988127679', longitud='-76.00822678' WHERE id=648; -- La Celia / Risaralda
      UPDATE sip_municipio SET latitud='4.904704187', longitud='-75.85208162' WHERE id=695; -- La Virginia / Risaralda
      UPDATE sip_municipio SET latitud='4.942936185', longitud='-75.7532139' WHERE id=755; -- Marsella / Risaralda
      UPDATE sip_municipio SET latitud='5.414078141', longitud='-75.96135387' WHERE id=774; -- Mistrató / Risaralda
      UPDATE sip_municipio SET latitud='4.803662773', longitud='-75.79579093' WHERE id=45; -- Pereira / Risaralda
      UPDATE sip_municipio SET latitud='5.286295408', longitud='-76.07359421' WHERE id=947; -- Pueblo Rico / Risaralda
      UPDATE sip_municipio SET latitud='5.323906864', longitud='-75.71339683' WHERE id=981; -- Quinchía / Risaralda
      UPDATE sip_municipio SET latitud='4.833789828', longitud='-75.54950174' WHERE id=1123; -- Santa Rosa De Cabal / Risaralda
      UPDATE sip_municipio SET latitud='5.076100313', longitud='-76.02286946' WHERE id=1137; -- Santuario / Risaralda
      UPDATE sip_municipio SET latitud='6.182208476', longitud='-73.53038541' WHERE id=147; -- Aguada / Santander
      UPDATE sip_municipio SET latitud='5.788190519', longitud='-73.79236929' WHERE id=324; -- Albania / Santander
      UPDATE sip_municipio SET latitud='6.716766585', longitud='-73.01162697' WHERE id=860; -- Aratoca / Santander
      UPDATE sip_municipio SET latitud='5.955617327', longitud='-73.62345229' WHERE id=1238; -- Barbosa / Santander
      UPDATE sip_municipio SET latitud='6.647062543', longitud='-73.21518466' WHERE id=1272; -- Barichara / Santander
      UPDATE sip_municipio SET latitud='7.054074558', longitud='-73.78211646' WHERE id=1319; -- Barrancabermeja / Santander
      UPDATE sip_municipio SET latitud='7.033255886', longitud='-73.37872388' WHERE id=1454; -- Betulia / Santander
      UPDATE sip_municipio SET latitud='6.181715586', longitud='-73.92065703' WHERE id=80; -- Bolívar / Santander
      UPDATE sip_municipio SET latitud='7.155833544', longitud='-73.11156997' WHERE id=27; -- Bucaramanga / Santander
      UPDATE sip_municipio SET latitud='6.562543673', longitud='-73.25034892' WHERE id=133; -- Cabrera / Santander
      UPDATE sip_municipio SET latitud='7.331565443', longitud='-72.95131825' WHERE id=168; -- California / Santander
      UPDATE sip_municipio SET latitud='6.520200095', longitud='-72.67435203' WHERE id=195; -- Capitanejo / Santander
      UPDATE sip_municipio SET latitud='6.659675274', longitud='-72.56968434' WHERE id=219; -- Carcasí / Santander
      UPDATE sip_municipio SET latitud='6.752465533', longitud='-72.92924629' WHERE id=233; -- Cepitá / Santander
      UPDATE sip_municipio SET latitud='6.903923173', longitud='-72.64536324' WHERE id=239; -- Cerrito / Santander
      UPDATE sip_municipio SET latitud='6.35099819', longitud='-73.06101382' WHERE id=241; -- Charalá / Santander
      UPDATE sip_municipio SET latitud='7.282973001', longitud='-72.97829057' WHERE id=245; -- Charta / Santander
      UPDATE sip_municipio SET latitud='6.361627641', longitud='-73.40172144' WHERE id=263; -- Chima / Santander
      UPDATE sip_municipio SET latitud='6.067944658', longitud='-73.63239132' WHERE id=267; -- Chipatá / Santander
      UPDATE sip_municipio SET latitud='6.40972961', longitud='-74.17030427' WHERE id=296; -- Cimitarra / Santander
      UPDATE sip_municipio SET latitud='6.76062337', longitud='-72.61815735' WHERE id=345; -- Concepción / Santander
      UPDATE sip_municipio SET latitud='6.342314443', longitud='-73.25014013' WHERE id=348; -- Confines / Santander
      UPDATE sip_municipio SET latitud='6.303116611', longitud='-73.50211527' WHERE id=357; -- Contratación / Santander
      UPDATE sip_municipio SET latitud='6.234735779', longitud='-72.98176803' WHERE id=367; -- Coromoro / Santander
      UPDATE sip_municipio SET latitud='6.608966483', longitud='-73.05897888' WHERE id=392; -- Curití / Santander
      UPDATE sip_municipio SET latitud='6.664260002', longitud='-73.56475288' WHERE id=404; -- El Carmen De Chucurí / Santander
      UPDATE sip_municipio SET latitud='6.236115743', longitud='-73.4977605' WHERE id=426; -- El Guacamayo / Santander
      UPDATE sip_municipio SET latitud='6.123389691', longitud='-74.00040397' WHERE id=441; -- El Peñón / Santander
      UPDATE sip_municipio SET latitud='7.524284721', longitud='-73.18158192' WHERE id=446; -- El Playón / Santander
      UPDATE sip_municipio SET latitud='6.079061224', longitud='-73.06206665' WHERE id=461; -- Encino / Santander
      UPDATE sip_municipio SET latitud='6.65824115', longitud='-72.68027939' WHERE id=464; -- Enciso / Santander
      UPDATE sip_municipio SET latitud='5.801106291', longitud='-73.95524931' WHERE id=473; -- Florián / Santander
      UPDATE sip_municipio SET latitud='7.079704598', longitud='-73.0679925' WHERE id=480; -- Floridablanca / Santander
      UPDATE sip_municipio SET latitud='6.671810994', longitud='-73.32467124' WHERE id=503; -- Galán / Santander
      UPDATE sip_municipio SET latitud='5.924383558', longitud='-73.31939934' WHERE id=507; -- Gámbita / Santander
      UPDATE sip_municipio SET latitud='6.976734127', longitud='-73.205267' WHERE id=548; -- Girón / Santander
      UPDATE sip_municipio SET latitud='6.9434341', longitud='-72.82369873' WHERE id=562; -- Guaca / Santander
      UPDATE sip_municipio SET latitud='6.233278248', longitud='-73.40977445' WHERE id=572; -- Guadalupe / Santander
      UPDATE sip_municipio SET latitud='6.319299865', longitud='-73.33115275' WHERE id=577; -- Guapotá / Santander
      UPDATE sip_municipio SET latitud='5.944894844', longitud='-73.72173671' WHERE id=582; -- Guavatá / Santander
      UPDATE sip_municipio SET latitud='6.04656148', longitud='-73.57847854' WHERE id=587; -- Güepsa / Santander
      UPDATE sip_municipio SET latitud='6.559878299', longitud='-73.36178841' WHERE id=596; -- Hato / Santander
      UPDATE sip_municipio SET latitud='5.872705896', longitud='-73.78997419' WHERE id=628; -- Jesús María / Santander
      UPDATE sip_municipio SET latitud='6.710814846', longitud='-73.1211236' WHERE id=629; -- Jordán / Santander
      UPDATE sip_municipio SET latitud='5.895724341', longitud='-74.04676575' WHERE id=635; -- La Belleza / Santander
      UPDATE sip_municipio SET latitud='6.21737437', longitud='-73.62977195' WHERE id=660; -- La Paz / Santander
      UPDATE sip_municipio SET latitud='6.385234814', longitud='-73.78760899' WHERE id=652; -- Landázuri / Santander
      UPDATE sip_municipio SET latitud='7.204060063', longitud='-73.29138097' WHERE id=706; -- Lebrija / Santander
      UPDATE sip_municipio SET latitud='6.812162934', longitud='-73.10785086' WHERE id=721; -- Los Santos / Santander
      UPDATE sip_municipio SET latitud='6.513745303', longitud='-72.58536492' WHERE id=731; -- Macaravita / Santander
      UPDATE sip_municipio SET latitud='6.720222349', longitud='-72.73841091' WHERE id=744; -- Málaga / Santander
      UPDATE sip_municipio SET latitud='7.348778319', longitud='-73.05438997' WHERE id=763; -- Matanza / Santander
      UPDATE sip_municipio SET latitud='6.492532315', longitud='-72.95834772' WHERE id=780; -- Mogotes / Santander
      UPDATE sip_municipio SET latitud='6.643290559', longitud='-72.81916274' WHERE id=786; -- Molagavita / Santander
      UPDATE sip_municipio SET latitud='6.355368858', longitud='-73.12211833' WHERE id=822; -- Ocamonte / Santander
      UPDATE sip_municipio SET latitud='6.225596216', longitud='-73.27961515' WHERE id=850; -- Oiba / Santander
      UPDATE sip_municipio SET latitud='6.335194548', longitud='-72.81205838' WHERE id=853; -- Onzaga / Santander
      UPDATE sip_municipio SET latitud='6.525876964', longitud='-73.28247337' WHERE id=884; -- Palmar / Santander
      UPDATE sip_municipio SET latitud='6.391750107', longitud='-73.28273174' WHERE id=890; -- Palmas Del Socorro / Santander
      UPDATE sip_municipio SET latitud='6.416631131', longitud='-73.17148232' WHERE id=901; -- Páramo / Santander
      UPDATE sip_municipio SET latitud='6.97082104', longitud='-73.01481196' WHERE id=914; -- Piedecuesta / Santander
      UPDATE sip_municipio SET latitud='6.513892626', longitud='-73.17570986' WHERE id=919; -- Pinchote / Santander
      UPDATE sip_municipio SET latitud='5.831129906', longitud='-73.67841815' WHERE id=948; -- Puente Nacional / Santander
      UPDATE sip_municipio SET latitud='6.685278856', longitud='-73.95761256' WHERE id=955; -- Puerto Parra / Santander
      UPDATE sip_municipio SET latitud='7.398198257', longitud='-73.8354696' WHERE id=958; -- Puerto Wilches / Santander
      UPDATE sip_municipio SET latitud='7.474226085', longitud='-73.37246417' WHERE id=1027; -- Rionegro / Santander
      UPDATE sip_municipio SET latitud='7.4065422', longitud='-73.57131807' WHERE id=1063; -- Sabana De Torres / Santander
      UPDATE sip_municipio SET latitud='6.796483063', longitud='-72.81613202' WHERE id=1090; -- San Andrés / Santander
      UPDATE sip_municipio SET latitud='6.076525355', longitud='-73.55295302' WHERE id=1100; -- San Benito / Santander
      UPDATE sip_municipio SET latitud='6.550778765', longitud='-73.11887911' WHERE id=1115; -- San Gil / Santander
      UPDATE sip_municipio SET latitud='6.459879823', longitud='-72.85471883' WHERE id=1121; -- San Joaquín / Santander
      UPDATE sip_municipio SET latitud='6.629400185', longitud='-72.73976423' WHERE id=1127; -- San José De Miranda / Santander
      UPDATE sip_municipio SET latitud='6.568121541', longitud='-72.64322497' WHERE id=1131; -- San Miguel / Santander
      UPDATE sip_municipio SET latitud='6.894292346', longitud='-73.53900334' WHERE id=1140; -- San Vicente De Chucurí / Santander
      UPDATE sip_municipio SET latitud='6.988084711', longitud='-72.89608933' WHERE id=1178; -- Santa Bárbara / Santander
      UPDATE sip_municipio SET latitud='6.40890734', longitud='-73.58206609' WHERE id=1187; -- Santa Helena Del Opón / Santander
      UPDATE sip_municipio SET latitud='6.494231551', longitud='-73.45910992' WHERE id=1205; -- Simacota / Santander
      UPDATE sip_municipio SET latitud='6.462088241', longitud='-73.24436001' WHERE id=1218; -- Socorro / Santander
      UPDATE sip_municipio SET latitud='6.101499739', longitud='-73.36225795' WHERE id=1240; -- Suaita / Santander
      UPDATE sip_municipio SET latitud='5.983203734', longitud='-73.95936235' WHERE id=1247; -- Sucre / Santander
      UPDATE sip_municipio SET latitud='7.475402063', longitud='-72.98779966' WHERE id=1258; -- Suratá / Santander
      UPDATE sip_municipio SET latitud='7.170891099', longitud='-72.93970443' WHERE id=1332; -- Tona / Santander
      UPDATE sip_municipio SET latitud='6.434578919', longitud='-73.10997171' WHERE id=1369; -- Valle De San José / Santander
      UPDATE sip_municipio SET latitud='6.00741043', longitud='-73.69057256' WHERE id=1378; -- Vélez / Santander
      UPDATE sip_municipio SET latitud='7.322219563', longitud='-72.88156901' WHERE id=1382; -- Vetas / Santander
      UPDATE sip_municipio SET latitud='6.685867326', longitud='-73.16396916' WHERE id=1390; -- Villanueva / Santander
      UPDATE sip_municipio SET latitud='6.813725566', longitud='-73.30975044' WHERE id=1425; -- Zapatoca / Santander
      UPDATE sip_municipio SET latitud='9.314972282', longitud='-74.98014057' WHERE id=107; -- Buenavista / Sucre
      UPDATE sip_municipio SET latitud='8.792311599', longitud='-75.13191063' WHERE id=137; -- Caimito / Sucre
      UPDATE sip_municipio SET latitud='9.569584598', longitud='-75.32420908' WHERE id=396; -- Chalán / Sucre
      UPDATE sip_municipio SET latitud='9.494043427', longitud='-75.34528693' WHERE id=337; -- Colosó / Sucre
      UPDATE sip_municipio SET latitud='9.160624283', longitud='-75.23858178' WHERE id=364; -- Corozal / Sucre
      UPDATE sip_municipio SET latitud='9.394449802', longitud='-75.6574915' WHERE id=378; -- Coveñas / Sucre
      UPDATE sip_municipio SET latitud='9.036231591', longitud='-75.14575038' WHERE id=402; -- El Roble / Sucre
      UPDATE sip_municipio SET latitud='9.135169096', longitud='-74.98134706' WHERE id=405; -- Galeras / Sucre
      UPDATE sip_municipio SET latitud='8.337828523', longitud='-74.68734926' WHERE id=463; -- Guaranda / Sucre
      UPDATE sip_municipio SET latitud='8.811997799', longitud='-75.28322212' WHERE id=693; -- La Unión / Sucre
      UPDATE sip_municipio SET latitud='9.422380117', longitud='-75.21302191' WHERE id=720; -- Los Palmitos / Sucre
      UPDATE sip_municipio SET latitud='8.546148134', longitud='-74.71037883' WHERE id=736; -- Majagual / Sucre
      UPDATE sip_municipio SET latitud='9.392496685', longitud='-75.32718744' WHERE id=793; -- Morroa / Sucre
      UPDATE sip_municipio SET latitud='9.549655271', longitud='-75.18855916' WHERE id=859; -- Ovejas / Sucre
      UPDATE sip_municipio SET latitud='9.334940293', longitud='-75.56199027' WHERE id=886; -- Palmito / Sucre
      UPDATE sip_municipio SET latitud='9.165188649', longitud='-75.36027422' WHERE id=1092; -- Sampués / Sucre
      UPDATE sip_municipio SET latitud='8.835634919', longitud='-74.96469398' WHERE id=1112; -- San Benito Abad / Sucre
      UPDATE sip_municipio SET latitud='9.490297716', longitud='-75.44451115' WHERE id=1336; -- San José De Toluviejo / Sucre
      UPDATE sip_municipio SET latitud='9.292019071', longitud='-75.21363579' WHERE id=1176; -- San Juan De Betulia / Sucre
      UPDATE sip_municipio SET latitud='9.256299047', longitud='-75.09397089' WHERE id=1200; -- San Luis De Sincé / Sucre
      UPDATE sip_municipio SET latitud='8.589220102', longitud='-75.17249955' WHERE id=1180; -- San Marcos / Sucre
      UPDATE sip_municipio SET latitud='9.814599536', longitud='-75.50522919' WHERE id=1183; -- San Onofre / Sucre
      UPDATE sip_municipio SET latitud='9.396835638', longitud='-75.03741815' WHERE id=1184; -- San Pedro / Sucre
      UPDATE sip_municipio SET latitud='9.533810567', longitud='-75.53543469' WHERE id=1331; -- Santiago De Tolú / Sucre
      UPDATE sip_municipio SET latitud='9.316673928', longitud='-75.43174967' WHERE id=53; -- Sincelejo / Sucre
      UPDATE sip_municipio SET latitud='8.814333477', longitud='-74.74753131' WHERE id=1244; -- Sucre / Sucre
      UPDATE sip_municipio SET latitud='3.390015064', longitud='-74.94078233' WHERE id=412; -- Alpujarra / Tolima
      UPDATE sip_municipio SET latitud='4.582625784', longitud='-74.98630686' WHERE id=454; -- Alvarado / Tolima
      UPDATE sip_municipio SET latitud='4.803365246', longitud='-74.80998676' WHERE id=537; -- Ambalema / Tolima
      UPDATE sip_municipio SET latitud='4.623390454', longitud='-75.20165423' WHERE id=737; -- Anzoátegui / Tolima
      UPDATE sip_municipio SET latitud='5.006758956', longitud='-74.84750095' WHERE id=923; -- Armero / Tolima
      UPDATE sip_municipio SET latitud='3.37749064', longitud='-75.61373257' WHERE id=1091; -- Ataco / Tolima
      UPDATE sip_municipio SET latitud='4.406971283', longitud='-75.49745918' WHERE id=138; -- Cajamarca / Tolima
      UPDATE sip_municipio SET latitud='4.123416795', longitud='-74.74700246' WHERE id=199; -- Carmen De Apicalá / Tolima
      UPDATE sip_municipio SET latitud='5.007003948', longitud='-75.19457703' WHERE id=220; -- Casabianca / Tolima
      UPDATE sip_municipio SET latitud='3.743693084', longitud='-75.58986634' WHERE id=243; -- Chaparral / Tolima
      UPDATE sip_municipio SET latitud='4.315603867', longitud='-74.91470256' WHERE id=333; -- Coello / Tolima
      UPDATE sip_municipio SET latitud='3.775490271', longitud='-75.14720213' WHERE id=368; -- Coyaima / Tolima
      UPDATE sip_municipio SET latitud='3.98252395', longitud='-74.68936908' WHERE id=388; -- Cunday / Tolima
      UPDATE sip_municipio SET latitud='3.597863274', longitud='-74.80256674' WHERE id=407; -- Dolores / Tolima
      UPDATE sip_municipio SET latitud='4.166476969', longitud='-74.89352941' WHERE id=468; -- Espinal / Tolima
      UPDATE sip_municipio SET latitud='5.079256598', longitud='-74.95703372' WHERE id=472; -- Falan / Tolima
      UPDATE sip_municipio SET latitud='4.242813257', longitud='-74.83708638' WHERE id=477; -- Flandes / Tolima
      UPDATE sip_municipio SET latitud='5.186694812', longitud='-75.05228995' WHERE id=487; -- Fresno / Tolima
      UPDATE sip_municipio SET latitud='4.076501341', longitud='-74.97657287' WHERE id=570; -- Guamo / Tolima
      UPDATE sip_municipio SET latitud='5.068553783', longitud='-75.24322959' WHERE id=599; -- Herveo / Tolima
      UPDATE sip_municipio SET latitud='5.179416561', longitud='-74.78303094' WHERE id=601; -- Honda / Tolima
      UPDATE sip_municipio SET latitud='4.451921427', longitud='-75.252591' WHERE id=34; -- Ibagué / Tolima
      UPDATE sip_municipio SET latitud='4.133276369', longitud='-74.53964257' WHERE id=606; -- Icononzo / Tolima
      UPDATE sip_municipio SET latitud='4.866034592', longitud='-74.92337178' WHERE id=710; -- Lérida / Tolima
      UPDATE sip_municipio SET latitud='4.877936755', longitud='-75.04763076' WHERE id=716; -- Líbano / Tolima
      UPDATE sip_municipio SET latitud='4.193215498', longitud='-74.60517497' WHERE id=765; -- Melgar / Tolima
      UPDATE sip_municipio SET latitud='4.826734468', longitud='-75.21993987' WHERE id=779; -- Murillo / Tolima
      UPDATE sip_municipio SET latitud='3.540518203', longitud='-75.12200999' WHERE id=805; -- Natagaima / Tolima
      UPDATE sip_municipio SET latitud='3.937793962', longitud='-75.27824314' WHERE id=855; -- Ortega / Tolima
      UPDATE sip_municipio SET latitud='5.094035737', longitud='-75.0184505' WHERE id=882; -- Palocabildo / Tolima
      UPDATE sip_municipio SET latitud='4.433764446', longitud='-74.99879938' WHERE id=915; -- Piedras / Tolima
      UPDATE sip_municipio SET latitud='3.09897343', longitud='-75.81684413' WHERE id=929; -- Planadas / Tolima
      UPDATE sip_municipio SET latitud='3.729166649', longitud='-74.87247706' WHERE id=937; -- Prado / Tolima
      UPDATE sip_municipio SET latitud='3.854281614', longitud='-74.87451155' WHERE id=971; -- Purificación / Tolima
      UPDATE sip_municipio SET latitud='3.468077548', longitud='-75.85481103' WHERE id=1030; -- Rioblanco / Tolima
      UPDATE sip_municipio SET latitud='4.097861181', longitud='-75.59428027' WHERE id=1039; -- Roncesvalles / Tolima
      UPDATE sip_municipio SET latitud='4.216730954', longitud='-75.34758364' WHERE id=1041; -- Rovira / Tolima
      UPDATE sip_municipio SET latitud='3.912542787', longitud='-75.01859762' WHERE id=1098; -- Saldaña / Tolima
      UPDATE sip_municipio SET latitud='3.926088268', longitud='-75.50991004' WHERE id=1106; -- San Antonio / Tolima
      UPDATE sip_municipio SET latitud='4.057271684', longitud='-75.16320806' WHERE id=1114; -- San Luis / Tolima
      UPDATE sip_municipio SET latitud='5.235322593', longitud='-74.90668089' WHERE id=761; -- San Sebastián De Mariquita / Tolima
      UPDATE sip_municipio SET latitud='4.740827622', longitud='-75.20069946' WHERE id=1133; -- Santa Isabel / Tolima
      UPDATE sip_municipio SET latitud='3.969210629', longitud='-74.84448738' WHERE id=1243; -- Suárez / Tolima
      UPDATE sip_municipio SET latitud='4.182125647', longitud='-75.17148237' WHERE id=1366; -- Valle De San Juan / Tolima
      UPDATE sip_municipio SET latitud='4.70988172', longitud='-74.92089886' WHERE id=1375; -- Venadillo / Tolima
      UPDATE sip_municipio SET latitud='4.965753461', longitud='-75.15592969' WHERE id=1387; -- Villahermosa / Tolima
      UPDATE sip_municipio SET latitud='3.854384097', longitud='-74.61896623' WHERE id=1396; -- Villarrica / Tolima
      UPDATE sip_municipio SET latitud='4.6788971', longitud='-75.78297932' WHERE id=325; -- Alcalá / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.153314228', longitud='-76.16063341' WHERE id=615; -- Andalucía / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.795927292', longitud='-76.02963049' WHERE id=711; -- Ansermanuevo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.704287864', longitud='-76.14164999' WHERE id=905; -- Argelia / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.393118861', longitud='-76.34982039' WHERE id=78; -- Bolívar / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.493340766', longitud='-77.11872832' WHERE id=86; -- Buenaventura / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.196852991', longitud='-76.0896103' WHERE id=113; -- Bugalagrande / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.308997973', longitud='-75.83672567' WHERE id=134; -- Caicedonia / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.399043723', longitud='-76.57649259' WHERE id=28; -- Cali / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.923271619', longitud='-76.64260484' WHERE id=143; -- Calima / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.382091564', longitud='-76.38317663' WHERE id=166; -- Candelaria / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.70684716', longitud='-75.91790846' WHERE id=197; -- Cartago / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.649822218', longitud='-76.72039347' WHERE id=401; -- Dagua / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.917562873', longitud='-76.06601001' WHERE id=417; -- El Águila / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.756063701', longitud='-76.21502826' WHERE id=427; -- El Cairo / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.656072873', longitud='-76.30841784' WHERE id=429; -- El Cerrito / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.539979729', longitud='-76.28762701' WHERE id=438; -- El Dovio / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.304104295', longitud='-76.16477307' WHERE id=478; -- Florida / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.74410441', longitud='-76.19082004' WHERE id=545; -- Ginebra / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.759414991', longitud='-76.34518277' WHERE id=563; -- Guacarí / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.819854318', longitud='-75.98312419' WHERE id=112; -- Guadalajara De Buga / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.213892389', longitud='-76.62760418' WHERE id=622; -- Jamundí / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.694303106', longitud='-76.58989905' WHERE id=637; -- La Cumbre / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.537937391', longitud='-76.10328983' WHERE id=694; -- La Unión / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.483511142', longitud='-75.96677303' WHERE id=702; -- La Victoria / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.597588666', longitud='-75.9491997' WHERE id=821; -- Obando / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.558392876', longitud='-76.22779972' WHERE id=881; -- Palmira / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.42063665', longitud='-76.17841841' WHERE id=936; -- Pradera / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.806494973', longitud='-76.53489853' WHERE id=1019; -- Restrepo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.109500298', longitud='-76.37105443' WHERE id=1031; -- Riofrío / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.443571848', longitud='-76.16824249' WHERE id=1038; -- Roldanillo / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.98143244', longitud='-76.20836168' WHERE id=1096; -- San Pedro / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.193411919', longitud='-75.88818163' WHERE id=1196; -- Sevilla / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.638421279', longitud='-76.08106176' WHERE id=1338; -- Toro / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.233268116', longitud='-76.34292699' WHERE id=1340; -- Trujillo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.02840797', longitud='-76.03250379' WHERE id=1344; -- Tuluá / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.707718947', longitud='-75.77835903' WHERE id=1358; -- Ulloa / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.644242641', longitud='-76.25924483' WHERE id=1380; -- Versalles / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.74365889', longitud='-76.47064718' WHERE id=1385; -- Vijes / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.904130354', longitud='-76.39080435' WHERE id=1421; -- Yotoco / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.595913669', longitud='-76.5109879' WHERE id=1422; -- Yumbo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.35359875', longitud='-76.05065336' WHERE id=1427; -- Zarzal / Valle del Cauca
      UPDATE sip_municipio SET latitud='1.052762314', longitud='-71.33093035' WHERE id=235; -- Carurú / Vaupés
      UPDATE sip_municipio SET latitud='1.06148231', longitud='-70.46688401' WHERE id=39; -- Mitú / Vaupés
      UPDATE sip_municipio SET latitud='-0.00834364', longitud='-70.5433061' WHERE id=866; -- Pacoa / Vaupés
      UPDATE sip_municipio SET latitud='1.569312273', longitud='-70.91166315' WHERE id=1250; -- Papunahua / Vaupés
      UPDATE sip_municipio SET latitud='-0.719822209', longitud='-69.90776202' WHERE id=1084; -- Taraira / Vaupés
      UPDATE sip_municipio SET latitud='0.833312241', longitud='-69.61867754' WHERE id=1418; -- Yavaraté / Vaupés
      UPDATE sip_municipio SET latitud='4.262454746', longitud='-69.52140484' WHERE id=1246; -- Cumaribo / Vichada
      UPDATE sip_municipio SET latitud='5.517593607', longitud='-69.62044054' WHERE id=887; -- La Primavera / Vichada
      UPDATE sip_municipio SET latitud='5.836529669', longitud='-68.14122234' WHERE id=47; -- Puerto Carreño / Vichada
      UPDATE sip_municipio SET latitud='4.968581012', longitud='-70.65997097' WHERE id=1042; -- Santa Rosalía / Vichada


      -- Centros poblados que se deshabilitan

      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='6913'; -- 5284012 JENGAMECODA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14093'; -- 5591010 EL ALTO DEL POLLO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14096'; -- 5604011 CHORRO DE LAGRIMAS
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14126'; -- 5660015 MONTELORO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPM. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='7608'; -- 5893004 CUATRO BOCAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12529'; -- 8560007 CASCAJAL
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14176'; -- 11001016 SANTO DOMINGO
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14177'; -- 11001017 TIERRA NUEVA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14185'; -- 13052007 CONDOMINIO HACIENDA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='793'; -- 13688019 SANTA ISABEL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14364'; -- 20517007 MATA DE BARRO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14380'; -- 23068016 SEHEVE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='3602'; -- 23300002 LOS GÓMEZ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='3786'; -- 23555029 SAN JERÓNIMO (GOLERO)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14421'; -- 23678017 CAROLINA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='4052'; -- 23807001 CALLEJAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='4807'; -- 25793002 ROMA (TAUSA VIEJO)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='4968'; -- 27001036 GITRADO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='4957'; -- 27001037 MOJAUDO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5022'; -- 27025010 YUCAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5019'; -- 27025012 BELLA VISTA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5018'; -- 27025018 IRUTO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5034'; -- 27025025 NUNCIDÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5050'; -- 27025028 SANTA MARIA DE CONDOTO
      
      
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5077'; -- 27073003 DABAIBE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5079'; -- 27073007 SAN MARINO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5097'; -- 27077022 PUNTA DE IGUA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5156'; -- 27150001 BRISAS
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14526'; -- 27150017 CHINTADO MEDIO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5163'; -- 27160001 LA TOMA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5166'; -- 27160003 PAREDES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5173'; -- 27205006 MANDINGA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14533'; -- 27245009 EL 21
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5222'; -- 27250004 CORRIENTE PALO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5223'; -- 27250007 CHARAMBIRÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5207'; -- 27250009 DESCOLGADERO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5195'; -- 27250023 PAPAYO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5220'; -- 27250025 CARRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5206'; -- 27250028 QUEBRADA DE PICHIMÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5203'; -- 27250035 TROJITA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5226'; -- 27250036 VENADO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5294'; -- 27413004 LAS HAMACAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5284'; -- 27413009 NIPORDU
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14547'; -- 27413019 SAN JORGE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5323'; -- 27430004 BELLA VISTA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5317'; -- 27430005 BERIGUADÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5308'; -- 27430007 PUERTO PLATANARES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5328'; -- 27450002 BOCA DE SURUCO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5333'; -- 27450003 CHIQUICHOQUI
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5327'; -- 27450004 DIPURDÚ EL GUASIMO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5334'; -- 27450005 EL GUAMO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5330'; -- 27450012 SAN MIGUEL
      
      
      
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5360'; -- 27491003 IRABUBÚ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5349'; -- 27491008 URABARÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5359'; -- 27491009 CURUNDÓ
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14562'; -- 27491018 TORRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5375'; -- 27580001 ALTO CHATO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14566'; -- 27580007 CHARA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14568'; -- 27580009 LA GUAMA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14569'; -- 27580010 TODOSITICO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14570'; -- 27580011 VIRO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5395'; -- 27615012 TRUANDÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5402'; -- 27615019 LA RAYA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5406'; -- 27615024 LA ISLETA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5456'; -- 27745004 TAPARAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14577'; -- 27745016 BARRANCON
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14578'; -- 27745017 BARRANCONCITO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14579'; -- 27745018 CHARCO HONDO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14580'; -- 27745019 CHARCO LARGO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5497'; -- 27800012 EL ROTO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5997'; -- 44430013 YOTOJOROY
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='6017'; -- 44650015 LA PEÑA DE LOS INDIOS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='6021'; -- 44650020 POTRERITO
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='7776'; -- 50330004 MIRADOR
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='8123'; -- 52227002 MAYASQUER
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='8521'; -- 52520014 VUELTA DEL GALLO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='8645'; -- 52683024 20 DE JULIO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='8906'; -- 52835189 EL PROGRESO - SANTO DOMINGO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='8808'; -- 52835199 LA BRAVA
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9169'; -- 54206008 SOLEDAD
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9208'; -- 54245003 LA CULEBRITA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. Nombre de DIVIPOLA 2019, el anterior era BELLA VISTA (NUEVA GRANADA). Nombre de DIVIPOLA 2019, el anterior era BELLA VISTA (NUEVA GRANADA). No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9219'; -- 54250001 BELLA VISTA
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14790'; -- 54250008 LA MOTILANDIA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9422'; -- 54810001 BARCO LA SILLA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14856'; -- 66170025 GAITAN LA PLAYA
      
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14933'; -- 70001028 SANTA CRUZ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='10659'; -- 70110002 CALIFORNIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='14969'; -- 70429030 TOTUMAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='10906'; -- 70702002 HATO VIEJO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='11411'; -- 73555003 LA ESTRELLA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='11688'; -- 76109008 CISNEROS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPM. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='11722'; -- 76109066 LA DELFINA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15049'; -- 76109117 BETANIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15051'; -- 76109119 EL CREDO
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15052'; -- 76109120 EL EDEN
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15058'; -- 76109126 PLAYA LARGA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='11851'; -- 76126003 JIGUALES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='11847'; -- 76126013 PUENTE TIERRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12022'; -- 76250005 LA CABAÑA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPD. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12013'; -- 76250012 PLAYA RICA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15099'; -- 81300004 MATECAÑA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12670'; -- 81736005 PUENTE DE BOJABÁ
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15110'; -- 81736019 TINAJAS
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12739'; -- 85125001 CORRALITO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12746'; -- 85125004 MANARE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12737'; -- 85125012 SANTA BÁRBARA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12733'; -- 85125014 EL GUAFAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12748'; -- 85125015 LAS CAMELIAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12923'; -- 86573008 LA VICTORIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. Nombre de DIVIPOLA 2019, el anterior era MINITAS. Nombre de DIVIPOLA 2019, el anterior era MINITAS. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15176'; -- 94343004 MINITAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13070'; -- 94884001 SEJAL (MAHIMACHI)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13076'; -- 94887001 BOCAS DE YARI
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15190'; -- 95015002 LA UNION
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15192'; -- 95025008 LA CRISTALINA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15193'; -- 95025009 LA NUEVA PRIMAVERA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='15201'; -- 97001007 MANDÍ
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13139'; -- 97889001 PAPURÍ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP. No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13165'; -- 99773021 EL TUPARRO

      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='7225'; -- 5631008 PAN DE AZÚCAR
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5041'; -- 27025032 GUINEO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5015'; -- 27025034 PLAYITA
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5028'; -- 27025039 PUNTO CAIMINTO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5335'; -- 27450014 ISLA DE CRUZ
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5342'; -- 27450016 MACEDONIA
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5341'; -- 27450018 SAN JERÓNIMO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5332'; -- 27450019 UNIÓN WAUNAÁN
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='5357'; -- 27491013 CARMEN DE SURAMA
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='7693'; -- 50001025 CONDOMINIO SANTA BÁRBARA
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='7868'; -- 50711020 EL TRIUNFO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9163'; -- 54174008 CARRILLO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='9222'; -- 54250006 LAS TORRES
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='10648'; -- 70001010 LAS HUERTAS
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='10647'; -- 70001018 LAS PALMAS
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='12674'; -- 81794023 LA ARENOSA
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13112'; -- 95025007 MIROLINDO
      UPDATE sip_clase SET observaciones='No está en DIVIPOLA 2022.',  fechadeshabilitacion='2022-07-21'   WHERE id='13135'; -- 97666001 COMUNIDAD DE CURUPIRA

    SQL
  end

  def down
    execute <<-SQL

      -- Deshabilitados

      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='7225'; -- 5631008 PAN DE AZÚCAR                                      
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5041'; -- 27025032 GUINEO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5015'; -- 27025034 PLAYITA
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5028'; -- 27025039 PUNTO CAIMINTO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5335'; -- 27450014 ISLA DE CRUZ
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5342'; -- 27450016 MACEDONIA
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5341'; -- 27450018 SAN JERÓNIMO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5332'; -- 27450019 UNIÓN WAUNAÁN
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='5357'; -- 27491013 CARMEN DE SURAMA
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='7693'; -- 50001025 CONDOMINIO SANTA BÁRBARA
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='7868'; -- 50711020 EL TRIUNFO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='9163'; -- 54174008 CARRILLO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='9222'; -- 54250006 LAS TORRES
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='10648'; -- 70001010 LAS HUERTAS
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='10647'; -- 70001018 LAS PALMAS
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='12674'; -- 81794023 LA ARENOSA
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='13112'; -- 95025007 MIROLINDO
      UPDATE sip_clase SET observaciones=NULL,  fechadeshabilitacion=NULL   WHERE id='13135'; -- 97666001 COMUNIDAD DE CURUPIRA

      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='6913'; -- 5284012 JENGAMECODA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14093'; -- 5591010 EL ALTO DEL POLLO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14096'; -- 5604011 CHORRO DE LAGRIMAS
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14126'; -- 5660015 MONTELORO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPM.',  fechadeshabilitacion=NULL   WHERE id='7608'; -- 5893004 CUATRO BOCAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='12529'; -- 8560007 CASCAJAL
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14176'; -- 11001016 SANTO DOMINGO
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14177'; -- 11001017 TIERRA NUEVA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14185'; -- 13052007 CONDOMINIO HACIENDA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='793'; -- 13688019 SANTA ISABEL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14364'; -- 20517007 MATA DE BARRO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14380'; -- 23068016 SEHEVE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='3602'; -- 23300002 LOS GÓMEZ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='3786'; -- 23555029 SAN JERÓNIMO (GOLERO)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14421'; -- 23678017 CAROLINA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='4052'; -- 23807001 CALLEJAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='4807'; -- 25793002 ROMA (TAUSA VIEJO)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='4968'; -- 27001036 GITRADO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='4957'; -- 27001037 MOJAUDO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5022'; -- 27025010 YUCAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5019'; -- 27025012 BELLA VISTA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5018'; -- 27025018 IRUTO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5034'; -- 27025025 NUNCIDÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5050'; -- 27025028 SANTA MARIA DE CONDOTO
      
      
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5077'; -- 27073003 DABAIBE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='5079'; -- 27073007 SAN MARINO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5097'; -- 27077022 PUNTA DE IGUA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5156'; -- 27150001 BRISAS
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14526'; -- 27150017 CHINTADO MEDIO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5163'; -- 27160001 LA TOMA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5166'; -- 27160003 PAREDES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='5173'; -- 27205006 MANDINGA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14533'; -- 27245009 EL 21
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5222'; -- 27250004 CORRIENTE PALO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5223'; -- 27250007 CHARAMBIRÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5207'; -- 27250009 DESCOLGADERO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5195'; -- 27250023 PAPAYO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5220'; -- 27250025 CARRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5206'; -- 27250028 QUEBRADA DE PICHIMÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5203'; -- 27250035 TROJITA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5226'; -- 27250036 VENADO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5294'; -- 27413004 LAS HAMACAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5284'; -- 27413009 NIPORDU
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='14547'; -- 27413019 SAN JORGE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5323'; -- 27430004 BELLA VISTA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5317'; -- 27430005 BERIGUADÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5308'; -- 27430007 PUERTO PLATANARES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5328'; -- 27450002 BOCA DE SURUCO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5333'; -- 27450003 CHIQUICHOQUI
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5327'; -- 27450004 DIPURDÚ EL GUASIMO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5334'; -- 27450005 EL GUAMO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5330'; -- 27450012 SAN MIGUEL
      
      
      
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5360'; -- 27491003 IRABUBÚ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5349'; -- 27491008 URABARÁ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5359'; -- 27491009 CURUNDÓ
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='14562'; -- 27491018 TORRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5375'; -- 27580001 ALTO CHATO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14566'; -- 27580007 CHARA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14568'; -- 27580009 LA GUAMA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14569'; -- 27580010 TODOSITICO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14570'; -- 27580011 VIRO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5395'; -- 27615012 TRUANDÓ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='5402'; -- 27615019 LA RAYA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='5406'; -- 27615024 LA ISLETA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='5456'; -- 27745004 TAPARAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='14577'; -- 27745016 BARRANCON
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='14578'; -- 27745017 BARRANCONCITO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14579'; -- 27745018 CHARCO HONDO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14580'; -- 27745019 CHARCO LARGO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='5497'; -- 27800012 EL ROTO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='5997'; -- 44430013 YOTOJOROY
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='6017'; -- 44650015 LA PEÑA DE LOS INDIOS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='6021'; -- 44650020 POTRERITO
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='7776'; -- 50330004 MIRADOR
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='8123'; -- 52227002 MAYASQUER
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='8521'; -- 52520014 VUELTA DEL GALLO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='8645'; -- 52683024 20 DE JULIO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='8906'; -- 52835189 EL PROGRESO - SANTO DOMINGO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='8808'; -- 52835199 LA BRAVA
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='9169'; -- 54206008 SOLEDAD
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='9208'; -- 54245003 LA CULEBRITA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IPD. Nombre de DIVIPOLA 2019, el anterior era BELLA VISTA (NUEVA GRANADA). Nombre de DIVIPOLA 2019, el anterior era BELLA VISTA (NUEVA GRANADA).',  fechadeshabilitacion=NULL   WHERE id='9219'; -- 54250001 BELLA VISTA
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14790'; -- 54250008 LA MOTILANDIA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='9422'; -- 54810001 BARCO LA SILLA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='14856'; -- 66170025 GAITAN LA PLAYA
      
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14933'; -- 70001028 SANTA CRUZ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='10659'; -- 70110002 CALIFORNIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='14969'; -- 70429030 TOTUMAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='10906'; -- 70702002 HATO VIEJO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era CAS.',  fechadeshabilitacion=NULL   WHERE id='11411'; -- 73555003 LA ESTRELLA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='11688'; -- 76109008 CISNEROS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPM.',  fechadeshabilitacion=NULL   WHERE id='11722'; -- 76109066 LA DELFINA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15049'; -- 76109117 BETANIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15051'; -- 76109119 EL CREDO
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15052'; -- 76109120 EL EDEN
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15058'; -- 76109126 PLAYA LARGA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='11851'; -- 76126003 JIGUALES
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='11847'; -- 76126013 PUENTE TIERRA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='12022'; -- 76250005 LA CABAÑA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2018. Antes era IPD.',  fechadeshabilitacion=NULL   WHERE id='12013'; -- 76250012 PLAYA RICA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15099'; -- 81300004 MATECAÑA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12670'; -- 81736005 PUENTE DE BOJABÁ
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15110'; -- 81736019 TINAJAS
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era C.',  fechadeshabilitacion=NULL   WHERE id='12739'; -- 85125001 CORRALITO
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12746'; -- 85125004 MANARE
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12737'; -- 85125012 SANTA BÁRBARA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12733'; -- 85125014 EL GUAFAL
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12748'; -- 85125015 LAS CAMELIAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='12923'; -- 86573008 LA VICTORIA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018. Nombre de DIVIPOLA 2019, el anterior era MINITAS. Nombre de DIVIPOLA 2019, el anterior era MINITAS.',  fechadeshabilitacion=NULL   WHERE id='15176'; -- 94343004 MINITAS
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='13070'; -- 94884001 SEJAL (MAHIMACHI)
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='13076'; -- 94887001 BOCAS DE YARI
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='15190'; -- 95015002 LA UNION
      
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15192'; -- 95025008 LA CRISTALINA
      UPDATE sip_clase SET observaciones='Aparece en DIVIPOLA 2018.',  fechadeshabilitacion=NULL   WHERE id='15193'; -- 95025009 LA NUEVA PRIMAVERA
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='15201'; -- 97001007 MANDÍ
      
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='13139'; -- 97889001 PAPURÍ
      UPDATE sip_clase SET observaciones='Tipo de centro cambiado por DIVIPOLA 2019. Antes era IP.',  fechadeshabilitacion=NULL   WHERE id='13165'; -- 99773021 EL TUPARRO



      UPDATE sip_municipio SET latitud='-1.9963', longitud='-72.68959' WHERE id=459; -- El Encanto / Amazonas
      UPDATE sip_municipio SET latitud='-1.28237', longitud='-72.6390548' WHERE id=703; -- La Chorrera / Amazonas
      UPDATE sip_municipio SET latitud='-1.32238', longitud='-69.57839' WHERE id=707; -- La Pedrera / Amazonas
      UPDATE sip_municipio SET latitud='-0.12072', longitud='-71.082951' WHERE id=738; -- La Victoria / Amazonas
      UPDATE sip_municipio SET latitud='-4.2152778', longitud='-69.9405556' WHERE id=36; -- Leticia / Amazonas
      UPDATE sip_municipio SET latitud='-0.73143', longitud='-71.24642' WHERE id=777; -- Mirití - Paraná / Amazonas
      UPDATE sip_municipio SET latitud='-0.95046', longitud='-73.84126' WHERE id=896; -- Puerto Alegría / Amazonas
      UPDATE sip_municipio SET latitud='-1.9336', longitud='-71.2454' WHERE id=903; -- Puerto Arica / Amazonas
      UPDATE sip_municipio SET latitud='-3.7702778', longitud='-70.3830556' WHERE id=907; -- Puerto Nariño / Amazonas
      UPDATE sip_municipio SET latitud='-1.0778', longitud='-72.1847' WHERE id=1089; -- Puerto Santander / Amazonas
      UPDATE sip_municipio SET latitud='-2.60706', longitud='-69.934028' WHERE id=1282; -- Tarapacá / Amazonas
      UPDATE sip_municipio SET latitud='5.75', longitud='-75.4166667' WHERE id=300; -- Abejorral / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-76.0833333' WHERE id=665; -- Abriaquí / Antioquia
      UPDATE sip_municipio SET latitud='6.3666667', longitud='-75.0833333' WHERE id=349; -- Alejandría / Antioquia
      UPDATE sip_municipio SET latitud='6.05', longitud='-75.7' WHERE id=536; -- Amagá / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-74.9166667' WHERE id=550; -- Amalfi / Antioquia
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-75.9166667' WHERE id=593; -- Andes / Antioquia
      UPDATE sip_municipio SET latitud='6.1333333', longitud='-75.7' WHERE id=616; -- Angelópolis / Antioquia
      UPDATE sip_municipio SET latitud='6.8666667', longitud='-75.3333333' WHERE id=643; -- Angostura / Antioquia
      UPDATE sip_municipio SET latitud='7.1666667', longitud='-75.0833333' WHERE id=690; -- Anorí / Antioquia
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-75.9166667' WHERE id=752; -- Anzá / Antioquia
      UPDATE sip_municipio SET latitud='7.8855556', longitud='-76.6347222' WHERE id=766; -- Apartadó / Antioquia
      UPDATE sip_municipio SET latitud='8.5', longitud='-76.4166667' WHERE id=863; -- Arboletes / Antioquia
      UPDATE sip_municipio SET latitud='5.7341667', longitud='-75.1463889' WHERE id=922; -- Argelia / Antioquia
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-75.8333333' WHERE id=973; -- Armenia / Antioquia
      UPDATE sip_municipio SET latitud='6.45', longitud='-75.3333333' WHERE id=1271; -- Barbosa / Antioquia
      UPDATE sip_municipio SET latitud='6.3388889', longitud='-75.5622222' WHERE id=1404; -- Bello / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-75.6666667' WHERE id=1372; -- Belmira / Antioquia
      UPDATE sip_municipio SET latitud='5.75', longitud='-75.9666667' WHERE id=1453; -- Betania / Antioquia
      UPDATE sip_municipio SET latitud='6.2', longitud='-75.9166667' WHERE id=1456; -- Betulia / Antioquia
      UPDATE sip_municipio SET latitud='7.1122222', longitud='-75.5541667' WHERE id=83; -- Briceño / Antioquia
      UPDATE sip_municipio SET latitud='6.75', longitud='-75.9166667' WHERE id=114; -- Buriticá / Antioquia
      UPDATE sip_municipio SET latitud='7.6666667', longitud='-75.3333333' WHERE id=132; -- Cáceres / Antioquia
      UPDATE sip_municipio SET latitud='6.45', longitud='-75.9666667' WHERE id=139; -- Caicedo / Antioquia
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-75.6333333' WHERE id=145; -- Caldas / Antioquia
      UPDATE sip_municipio SET latitud='7.0833333', longitud='-75.25' WHERE id=170; -- Campamento / Antioquia
      UPDATE sip_municipio SET latitud='6.75', longitud='-76' WHERE id=176; -- Cañasgordas / Antioquia
      UPDATE sip_municipio SET latitud='6.4119444', longitud='-74.7605556' WHERE id=193; -- Caracolí / Antioquia
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-75.5833333' WHERE id=194; -- Caramanta / Antioquia
      UPDATE sip_municipio SET latitud='7.7663889', longitud='-76.6611111' WHERE id=196; -- Carepa / Antioquia
      UPDATE sip_municipio SET latitud='6.8', longitud='-75.25' WHERE id=214; -- Carolina / Antioquia
      UPDATE sip_municipio SET latitud='7.9166667', longitud='-75' WHERE id=222; -- Caucasia / Antioquia
      UPDATE sip_municipio SET latitud='7.6666667', longitud='-76.6666667' WHERE id=256; -- Chigorodó / Antioquia
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-75.0833333' WHERE id=298; -- Cisneros / Antioquia
      UPDATE sip_municipio SET latitud='5.843155', longitud='-76.021099' WHERE id=79; -- Ciudad Bolívar / Antioquia
      UPDATE sip_municipio SET latitud='6', longitud='-75' WHERE id=299; -- Cocorná / Antioquia
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-75.25' WHERE id=343; -- Concepción / Antioquia
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-75.9166667' WHERE id=347; -- Concordia / Antioquia
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-75.5' WHERE id=358; -- Copacabana / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-76.25' WHERE id=403; -- Dabeiba / Antioquia
      UPDATE sip_municipio SET latitud='6.502', longitud='-75.3948' WHERE id=408; -- Donmatías / Antioquia
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-75.75' WHERE id=416; -- Ebéjico / Antioquia
      UPDATE sip_municipio SET latitud='7.5941667', longitud='-74.8119444' WHERE id=436; -- El Bagre / Antioquia
      UPDATE sip_municipio SET latitud='6.0838', longitud='-75.336' WHERE id=200; -- El Carmen De Viboral / Antioquia
      UPDATE sip_municipio SET latitud='6.12327', longitud='-75.26518' WHERE id=1151; -- El Santuario / Antioquia
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-75.5833333' WHERE id=462; -- Entrerríos / Antioquia
      UPDATE sip_municipio SET latitud='6.1730556', longitud='-75.5638889' WHERE id=465; -- Envigado / Antioquia
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-75.6666667' WHERE id=486; -- Fredonia / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-76.3333333' WHERE id=488; -- Frontino / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-75.9166667' WHERE id=546; -- Giraldo / Antioquia
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-75.45' WHERE id=549; -- Girardota / Antioquia
      UPDATE sip_municipio SET latitud='6.75', longitud='-75.8333333' WHERE id=552; -- Gómez Plata / Antioquia
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-75.1333333' WHERE id=555; -- Granada / Antioquia
      UPDATE sip_municipio SET latitud='6.8175', longitud='-75.2441667' WHERE id=557; -- Guadalupe / Antioquia
      UPDATE sip_municipio SET latitud='6.25', longitud='-75.4166667' WHERE id=567; -- Guarne / Antioquia
      UPDATE sip_municipio SET latitud='6.25', longitud='-75.1666667' WHERE id=576; -- Guatapé / Antioquia
      UPDATE sip_municipio SET latitud='6.2333333', longitud='-75.75' WHERE id=597; -- Heliconia / Antioquia
      UPDATE sip_municipio SET latitud='5.8025', longitud='-75.9116667' WHERE id=608; -- Hispania / Antioquia
      UPDATE sip_municipio SET latitud='5.98212', longitud='-75.26084' WHERE id=617; -- Itagüí / Antioquia
      UPDATE sip_municipio SET latitud='7.25', longitud='-76' WHERE id=619; -- Ituango / Antioquia
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-75.8333333' WHERE id=623; -- Jardín / Antioquia
      UPDATE sip_municipio SET latitud='5.75', longitud='-75.75' WHERE id=626; -- Jericó / Antioquia
      UPDATE sip_municipio SET latitud='6', longitud='-75.4166667' WHERE id=634; -- La Ceja / Antioquia
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-75.6666667' WHERE id=646; -- La Estrella / Antioquia
      UPDATE sip_municipio SET latitud='5.75', longitud='-75.6' WHERE id=655; -- La Pintada / Antioquia
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-75.3333333' WHERE id=692; -- La Unión / Antioquia
      UPDATE sip_municipio SET latitud='6.75', longitud='-75.75' WHERE id=714; -- Liborina / Antioquia
      UPDATE sip_municipio SET latitud='6.5', longitud='-74.75' WHERE id=732; -- Maceo / Antioquia
      UPDATE sip_municipio SET latitud='6.2', longitud='-75.3' WHERE id=754; -- Marinilla / Antioquia
      UPDATE sip_municipio SET latitud='6.2913889', longitud='-75.5361111' WHERE id=38; -- Medellín / Antioquia
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-75.5' WHERE id=785; -- Montebello / Antioquia
      UPDATE sip_municipio SET latitud='6.8', longitud='-76.8' WHERE id=796; -- Murindó / Antioquia
      UPDATE sip_municipio SET latitud='7.3333333', longitud='-76.5' WHERE id=799; -- Mutatá / Antioquia
      UPDATE sip_municipio SET latitud='5.6', longitud='-75.1666667' WHERE id=804; -- Nariño / Antioquia
      UPDATE sip_municipio SET latitud='8.0963889', longitud='-74.7758333' WHERE id=818; -- Nechí / Antioquia
      UPDATE sip_municipio SET latitud='8.4238889', longitud='-76.7911111' WHERE id=811; -- Necoclí / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-75.75' WHERE id=852; -- Olaya / Antioquia
      UPDATE sip_municipio SET latitud='6.25', longitud='-75.25' WHERE id=910; -- Peñol / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-75.8333333' WHERE id=912; -- Peque / Antioquia
      UPDATE sip_municipio SET latitud='5.8', longitud='-75.85' WHERE id=959; -- Pueblorrico / Antioquia
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-74.5' WHERE id=961; -- Puerto Berrío / Antioquia
      UPDATE sip_municipio SET latitud='6.1916667', longitud='-74.5866667' WHERE id=968; -- Puerto Nare / Antioquia
      UPDATE sip_municipio SET latitud='5.8708333', longitud='-74.6455556' WHERE id=976; -- Puerto Triunfo / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-74.4166667' WHERE id=1015; -- Remedios / Antioquia
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-75.5' WHERE id=1020; -- Retiro / Antioquia
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-75.4166667' WHERE id=1026; -- Rionegro / Antioquia
      UPDATE sip_municipio SET latitud='6.9166667', longitud='-75.8' WHERE id=1043; -- Sabanalarga / Antioquia
      UPDATE sip_municipio SET latitud='6.15', longitud='-75.6' WHERE id=1044; -- Sabaneta / Antioquia
      UPDATE sip_municipio SET latitud='6', longitud='-76' WHERE id=1049; -- Salgar / Antioquia
      UPDATE sip_municipio SET latitud='6.906', longitud='-75.659' WHERE id=1052; -- San Andrés De Cuerquía / Antioquia
      UPDATE sip_municipio SET latitud='6.2', longitud='-74.9166667' WHERE id=1055; -- San Carlos / Antioquia
      UPDATE sip_municipio SET latitud='6.1166667', longitud='-75.9833333' WHERE id=1059; -- San Francisco / Antioquia
      UPDATE sip_municipio SET latitud='6.45', longitud='-75.7' WHERE id=1065; -- San Jerónimo / Antioquia
      UPDATE sip_municipio SET latitud='6.8502778', longitud='-75.6833333' WHERE id=1068; -- San José De La Montaña / Antioquia
      UPDATE sip_municipio SET latitud='8.7630556', longitud='-76.53' WHERE id=1069; -- San Juan De Urabá / Antioquia
      UPDATE sip_municipio SET latitud='6', longitud='-74.8333333' WHERE id=1076; -- San Luis / Antioquia
      UPDATE sip_municipio SET latitud='6.45436', longitud='-75.57573' WHERE id=1081; -- San Pedro De Los Milagros / Antioquia
      UPDATE sip_municipio SET latitud='8.2761111', longitud='-76.3786111' WHERE id=1083; -- San Pedro De Urabá / Antioquia
      UPDATE sip_municipio SET latitud='6.3', longitud='-75' WHERE id=1087; -- San Rafael / Antioquia
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-74.8333333' WHERE id=1097; -- San Roque / Antioquia
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-75.3333333' WHERE id=1104; -- San Vicente Ferrer / Antioquia
      UPDATE sip_municipio SET latitud='5.8666667', longitud='-75.5833333' WHERE id=1116; -- Santa Bárbara / Antioquia
      UPDATE sip_municipio SET latitud='6.5597222', longitud='-75.8280556' WHERE id=727; -- Santa Fé De Antioquia / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-75.4166667' WHERE id=1134; -- Santa Rosa De Osos / Antioquia
      UPDATE sip_municipio SET latitud='6.4722222', longitud='-75.1647222' WHERE id=1143; -- Santo Domingo / Antioquia
      UPDATE sip_municipio SET latitud='7.25', longitud='-74.75' WHERE id=1194; -- Segovia / Antioquia
      UPDATE sip_municipio SET latitud='5.75', longitud='-75' WHERE id=1221; -- Sonsón / Antioquia
      UPDATE sip_municipio SET latitud='6.5', longitud='-75.75' WHERE id=1232; -- Sopetrán / Antioquia
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-75.6666667' WHERE id=1269; -- Támesis / Antioquia
      UPDATE sip_municipio SET latitud='7.5833333', longitud='-75.35' WHERE id=1274; -- Tarazá / Antioquia
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-75.8333333' WHERE id=1277; -- Tarso / Antioquia
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-75.8' WHERE id=1318; -- Titiribí / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-75.7' WHERE id=1329; -- Toledo / Antioquia
      UPDATE sip_municipio SET latitud='8', longitud='-76.5833333' WHERE id=1348; -- Turbo / Antioquia
      UPDATE sip_municipio SET latitud='6.8994444', longitud='-76.1741667' WHERE id=1355; -- Uramita / Antioquia
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-76.4166667' WHERE id=1362; -- Urrao / Antioquia
      UPDATE sip_municipio SET latitud='7.3333333', longitud='-75.3333333' WHERE id=1365; -- Valdivia / Antioquia
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-75.5833333' WHERE id=1370; -- Valparaíso / Antioquia
      UPDATE sip_municipio SET latitud='6.7730556', longitud='-74.8016667' WHERE id=1371; -- Vegachí / Antioquia
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-75.75' WHERE id=1376; -- Venecia / Antioquia
      UPDATE sip_municipio SET latitud='6.5919444', longitud='-76.8986111' WHERE id=1392; -- Vigía Del Fuerte / Antioquia
      UPDATE sip_municipio SET latitud='6.8333333', longitud='-74.75' WHERE id=1413; -- Yalí / Antioquia
      UPDATE sip_municipio SET latitud='7', longitud='-75.5' WHERE id=1416; -- Yarumal / Antioquia
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-75' WHERE id=1420; -- Yolombó / Antioquia
      UPDATE sip_municipio SET latitud='7.0077778', longitud='-73.9141667' WHERE id=1423; -- Yondó / Antioquia
      UPDATE sip_municipio SET latitud='7.75', longitud='-74.75' WHERE id=1426; -- Zaragoza / Antioquia
      UPDATE sip_municipio SET latitud='7.0902778', longitud='-70.7616667' WHERE id=18; -- Arauca / Arauca
      UPDATE sip_municipio SET latitud='6.8219444', longitud='-71.3236111' WHERE id=1056; -- Arauquita / Arauca
      UPDATE sip_municipio SET latitud='6.3030556', longitud='-70.2016667' WHERE id=377; -- Cravo Norte / Arauca
      UPDATE sip_municipio SET latitud='6.7461111', longitud='-71.8566667' WHERE id=539; -- Fortul / Arauca
      UPDATE sip_municipio SET latitud='6.2780556', longitud='-71.1' WHERE id=975; -- Puerto Rondón / Arauca
      UPDATE sip_municipio SET latitud='6.9205556', longitud='-71.8533333' WHERE id=1193; -- Saravena / Arauca
      UPDATE sip_municipio SET latitud='6.4641667', longitud='-71.7288889' WHERE id=1279; -- Tame / Arauca
      UPDATE sip_municipio SET latitud='13.3560819', longitud='-81.3733811' WHERE id=938; -- Providencia / Archipiélago de San Andrés, Providencia y Santa Catalina
      UPDATE sip_municipio SET latitud='10.4055', longitud='-63.9383' WHERE id=50; -- San Andrés / Archipiélago de San Andrés, Providencia y Santa Catalina
      UPDATE sip_municipio SET latitud='10.8', longitud='-74.9166667' WHERE id=1255; -- Baranoa / Atlántico
      UPDATE sip_municipio SET latitud='10.9638889', longitud='-74.7963889' WHERE id=22; -- Barranquilla / Atlántico
      UPDATE sip_municipio SET latitud='10.4166667', longitud='-74.9166667' WHERE id=175; -- Campo De La Cruz / Atlántico
      UPDATE sip_municipio SET latitud='10.5', longitud='-74.8333333' WHERE id=191; -- Candelaria / Atlántico
      UPDATE sip_municipio SET latitud='10.9166667', longitud='-74.8333333' WHERE id=502; -- Galapa / Atlántico
      UPDATE sip_municipio SET latitud='10.82649', longitud='-75.08635' WHERE id=631; -- Juan De Acosta / Atlántico
      UPDATE sip_municipio SET latitud='10.6141667', longitud='-75.1461111' WHERE id=729; -- Luruaco / Atlántico
      UPDATE sip_municipio SET latitud='10.8588889', longitud='-74.7730556' WHERE id=746; -- Malambo / Atlántico
      UPDATE sip_municipio SET latitud='10.5', longitud='-75' WHERE id=749; -- Manatí / Atlántico
      UPDATE sip_municipio SET latitud='10.7466667', longitud='-74.7555556' WHERE id=880; -- Palmar De Varela / Atlántico
      UPDATE sip_municipio SET latitud='10.75', longitud='-75.1333333' WHERE id=921; -- Piojó / Atlántico
      UPDATE sip_municipio SET latitud='10.75', longitud='-74.7833333' WHERE id=932; -- Polonuevo / Atlántico
      UPDATE sip_municipio SET latitud='10.6436111', longitud='-74.7544444' WHERE id=934; -- Ponedera / Atlántico
      UPDATE sip_municipio SET latitud='11.0166667', longitud='-74.8833333' WHERE id=952; -- Puerto Colombia / Atlántico
      UPDATE sip_municipio SET latitud='10.55', longitud='-75.1333333' WHERE id=1017; -- Repelón / Atlántico
      UPDATE sip_municipio SET latitud='10.8', longitud='-74.75' WHERE id=1046; -- Sabanagrande / Atlántico
      UPDATE sip_municipio SET latitud='10.6333333', longitud='-74.8333333' WHERE id=1047; -- Sabanalarga / Atlántico
      UPDATE sip_municipio SET latitud='10.3286111', longitud='-74.9644444' WHERE id=1108; -- Santa Lucía / Atlántico
      UPDATE sip_municipio SET latitud='10.75', longitud='-74.8333333' WHERE id=1129; -- Santo Tomás / Atlántico
      UPDATE sip_municipio SET latitud='10.9172222', longitud='-74.7666667' WHERE id=1224; -- Soledad / Atlántico
      UPDATE sip_municipio SET latitud='10.3333333', longitud='-74.9166667' WHERE id=1241; -- Suan / Atlántico
      UPDATE sip_municipio SET latitud='10.9166667', longitud='-74.95' WHERE id=1342; -- Tubará / Atlántico
      UPDATE sip_municipio SET latitud='10.75', longitud='-74.9666667' WHERE id=1363; -- Usiacurí / Atlántico
      UPDATE sip_municipio SET latitud='4.555206', longitud='-74.098663' WHERE id=24; -- Bogotá, D.C. / Bogotá, D.C.
      UPDATE sip_municipio SET latitud='8.25', longitud='-74.5' WHERE id=989; -- Achí / Bolívar
      UPDATE sip_municipio SET latitud='8.7944444', longitud='-74.1658333' WHERE id=535; -- Altos Del Rosario / Bolívar
      UPDATE sip_municipio SET latitud='8.4666667', longitud='-73.95' WHERE id=726; -- Arenal / Bolívar
      UPDATE sip_municipio SET latitud='10.1666667', longitud='-75.3333333' WHERE id=878; -- Arjona / Bolívar
      UPDATE sip_municipio SET latitud='10.2497222', longitud='-75.0113889' WHERE id=1033; -- Arroyohondo / Bolívar
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-74.1666667' WHERE id=1197; -- Barranco De Loba / Bolívar
      UPDATE sip_municipio SET latitud='10.25', longitud='-75' WHERE id=190; -- Calamar / Bolívar
      UPDATE sip_municipio SET latitud='7.3791667', longitud='-73.9180556' WHERE id=232; -- Cantagallo / Bolívar
      UPDATE sip_municipio SET latitud='10.3997222', longitud='-75.5144444' WHERE id=31; -- Cartagena De Indias / Bolívar
      UPDATE sip_municipio SET latitud='9.4166667', longitud='-74.7333333' WHERE id=283; -- Cicuco / Bolívar
      UPDATE sip_municipio SET latitud='10.5891667', longitud='-75.3341667' WHERE id=379; -- Clemencia / Bolívar
      UPDATE sip_municipio SET latitud='9.5', longitud='-74.9166667' WHERE id=361; -- Córdoba / Bolívar
      UPDATE sip_municipio SET latitud='9.75', longitud='-75.1666667' WHERE id=418; -- El Carmen De Bolívar / Bolívar
      UPDATE sip_municipio SET latitud='10.0833333', longitud='-74.9166667' WHERE id=431; -- El Guamo / Bolívar
      UPDATE sip_municipio SET latitud='8.9833333', longitud='-73.95' WHERE id=466; -- El Peñón / Bolívar
      UPDATE sip_municipio SET latitud='8.9586111', longitud='-74.0808333' WHERE id=541; -- Hatillo De Loba / Bolívar
      UPDATE sip_municipio SET latitud='9.2413889', longitud='-74.7533333' WHERE id=740; -- Magangué / Bolívar
      UPDATE sip_municipio SET latitud='10.1666667', longitud='-75.1666667' WHERE id=745; -- Mahates / Bolívar
      UPDATE sip_municipio SET latitud='9.0833333', longitud='-74.2' WHERE id=753; -- Margarita / Bolívar
      UPDATE sip_municipio SET latitud='10', longitud='-75.3333333' WHERE id=759; -- María La Baja / Bolívar
      UPDATE sip_municipio SET latitud='8.2994444', longitud='-74.4755556' WHERE id=775; -- Montecristo / Bolívar
      UPDATE sip_municipio SET latitud='8.4166667', longitud='-74' WHERE id=791; -- Morales / Bolívar
      UPDATE sip_municipio SET latitud='8.5333333', longitud='-74.0333333' WHERE id=812; -- Norosí / Bolívar
      UPDATE sip_municipio SET latitud='8.9172222', longitud='-74.4663889' WHERE id=920; -- Pinillos / Bolívar
      UPDATE sip_municipio SET latitud='8.6666667', longitud='-73.8333333' WHERE id=966; -- Regidor / Bolívar
      UPDATE sip_municipio SET latitud='8.59', longitud='-73.8436111' WHERE id=1014; -- Río Viejo / Bolívar
      UPDATE sip_municipio SET latitud='9.8833333', longitud='-75.25' WHERE id=1034; -- San Cristóbal / Bolívar
      UPDATE sip_municipio SET latitud='10.3983333', longitud='-75.1511111' WHERE id=1053; -- San Estanislao / Bolívar
      UPDATE sip_municipio SET latitud='9.0833333', longitud='-74.3333333' WHERE id=1057; -- San Fernando / Bolívar
      UPDATE sip_municipio SET latitud='9.8333333', longitud='-75.0833333' WHERE id=1062; -- San Jacinto / Bolívar
      UPDATE sip_municipio SET latitud='9.8316667', longitud='-75.1263889' WHERE id=1064; -- San Jacinto Del Cauca / Bolívar
      UPDATE sip_municipio SET latitud='9.9566667', longitud='-75.0866667' WHERE id=1066; -- San Juan Nepomuceno / Bolívar
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-73.9166667' WHERE id=1086; -- San Martín De Loba / Bolívar
      UPDATE sip_municipio SET latitud='10.0527778', longitud='-75.2680556' WHERE id=1095; -- San Pablo / Bolívar
      UPDATE sip_municipio SET latitud='10.5833333', longitud='-75.25' WHERE id=1103; -- Santa Catalina / Bolívar
      UPDATE sip_municipio SET latitud='9.25', longitud='-74.5833333' WHERE id=787; -- Santa Cruz De Mompox / Bolívar
      UPDATE sip_municipio SET latitud='10.45', longitud='-75.3333333' WHERE id=1126; -- Santa Rosa / Bolívar
      UPDATE sip_municipio SET latitud='7.9644444', longitud='-74.0544444' WHERE id=1138; -- Santa Rosa Del Sur / Bolívar
      UPDATE sip_municipio SET latitud='7.5833333', longitud='-74.1666667' WHERE id=1204; -- Simití / Bolívar
      UPDATE sip_municipio SET latitud='10.3333333', longitud='-75.1' WHERE id=1229; -- Soplaviento / Bolívar
      UPDATE sip_municipio SET latitud='9.3069444', longitud='-74.5686111' WHERE id=1260; -- Talaigua Nuevo / Bolívar
      UPDATE sip_municipio SET latitud='8.5597222', longitud='-74.2669444' WHERE id=1322; -- Tiquisio / Bolívar
      UPDATE sip_municipio SET latitud='10.35', longitud='-75.3333333' WHERE id=1347; -- Turbaco / Bolívar
      UPDATE sip_municipio SET latitud='10.25', longitud='-75.4166667' WHERE id=1350; -- Turbaná / Bolívar
      UPDATE sip_municipio SET latitud='10.45', longitud='-75.25' WHERE id=1394; -- Villanueva / Bolívar
      UPDATE sip_municipio SET latitud='9.75', longitud='-74.8333333' WHERE id=1424; -- Zambrano / Bolívar
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-73.3333333' WHERE id=373; -- Almeida / Boyacá
      UPDATE sip_municipio SET latitud='5.5197222', longitud='-72.8875' WHERE id=789; -- Aquitania / Boyacá
      UPDATE sip_municipio SET latitud='5.8', longitud='-73.3833333' WHERE id=864; -- Arcabuco / Boyacá
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-72.9166667' WHERE id=1386; -- Belén / Boyacá
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-73' WHERE id=1450; -- Berbeo / Boyacá
      UPDATE sip_municipio SET latitud='6', longitud='-72.8333333' WHERE id=1455; -- Betéitiva / Boyacá
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-72.5833333' WHERE id=1460; -- Boavita / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-72.5' WHERE id=81; -- Boyacá / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.8333333' WHERE id=82; -- Briceño / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-73.9666667' WHERE id=87; -- Buenavista / Boyacá
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-72.85' WHERE id=115; -- Busbanzá / Boyacá
      UPDATE sip_municipio SET latitud='5.55', longitud='-73.8833333' WHERE id=167; -- Caldas / Boyacá
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73' WHERE id=171; -- Campohermoso / Boyacá
      UPDATE sip_municipio SET latitud='6', longitud='-72.9166667' WHERE id=238; -- Cerinza / Boyacá
      UPDATE sip_municipio SET latitud='5.25', longitud='-73.3333333' WHERE id=257; -- Chinavita / Boyacá
      UPDATE sip_municipio SET latitud='5.6333333', longitud='-73.75' WHERE id=264; -- Chiquinquirá / Boyacá
      UPDATE sip_municipio SET latitud='5.6083333', longitud='-73.4886111' WHERE id=398; -- Chíquiza / Boyacá
      UPDATE sip_municipio SET latitud='6.75', longitud='-72.3333333' WHERE id=276; -- Chiscas / Boyacá
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-72.4166667' WHERE id=279; -- Chita / Boyacá
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-73.3666667' WHERE id=281; -- Chitaraque / Boyacá
      UPDATE sip_municipio SET latitud='5.5333333', longitud='-73.2666667' WHERE id=282; -- Chivatá / Boyacá
      UPDATE sip_municipio SET latitud='4.8855556', longitud='-73.3688889' WHERE id=406; -- Chivor / Boyacá
      UPDATE sip_municipio SET latitud='5.4666667', longitud='-73.25' WHERE id=286; -- Ciénega / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.25' WHERE id=338; -- Cómbita / Boyacá
      UPDATE sip_municipio SET latitud='5.4333333', longitud='-74.0333333' WHERE id=359; -- Coper / Boyacá
      UPDATE sip_municipio SET latitud='5.8666667', longitud='-72.8333333' WHERE id=365; -- Corrales / Boyacá
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-72.7' WHERE id=369; -- Covarachía / Boyacá
      UPDATE sip_municipio SET latitud='7.0411111', longitud='-72.0608333' WHERE id=381; -- Cubará / Boyacá
      UPDATE sip_municipio SET latitud='5.5333333', longitud='-73.4666667' WHERE id=384; -- Cucaita / Boyacá
      UPDATE sip_municipio SET latitud='5.65', longitud='-72.9166667' WHERE id=389; -- Cuítiva / Boyacá
      UPDATE sip_municipio SET latitud='5.8269444', longitud='-73.0202778' WHERE id=409; -- Duitama / Boyacá
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-72.4166667' WHERE id=419; -- El Cocuy / Boyacá
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-72.4166667' WHERE id=430; -- El Espino / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-72.9666667' WHERE id=476; -- Firavitoba / Boyacá
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-72.9166667' WHERE id=479; -- Floresta / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.5' WHERE id=499; -- Gachantivá / Boyacá
      UPDATE sip_municipio SET latitud='5.85', longitud='-72.75' WHERE id=504; -- Gámeza / Boyacá
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-73.3' WHERE id=509; -- Garagoa / Boyacá
      UPDATE sip_municipio SET latitud='6.5', longitud='-72.5' WHERE id=559; -- Guacamayas / Boyacá
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73.5' WHERE id=579; -- Guateque / Boyacá
      UPDATE sip_municipio SET latitud='5', longitud='-73.5' WHERE id=583; -- Guayatá / Boyacá
      UPDATE sip_municipio SET latitud='6.75', longitud='-72.1666667' WHERE id=590; -- Güicán De La Sierra / Boyacá
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-72.9166667' WHERE id=620; -- Iza / Boyacá
      UPDATE sip_municipio SET latitud='5.3888889', longitud='-73.3680556' WHERE id=624; -- Jenesano / Boyacá
      UPDATE sip_municipio SET latitud='6.2', longitud='-72.5833333' WHERE id=625; -- Jericó / Boyacá
      UPDATE sip_municipio SET latitud='5.15', longitud='-73.45' WHERE id=644; -- La Capilla / Boyacá
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-72.5' WHERE id=701; -- La Uvita / Boyacá
      UPDATE sip_municipio SET latitud='5.5258333', longitud='-74.2361111' WHERE id=699; -- La Victoria / Boyacá
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-72.5833333' WHERE id=639; -- Labranzagrande / Boyacá
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-73.25' WHERE id=730; -- Macanal / Boyacá
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-74' WHERE id=757; -- Maripí / Boyacá
      UPDATE sip_municipio SET latitud='5.25', longitud='-73.1666667' WHERE id=772; -- Miraflores / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-72.6666667' WHERE id=782; -- Mongua / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-72.8333333' WHERE id=783; -- Monguí / Boyacá
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-73.5' WHERE id=788; -- Moniquirá / Boyacá
      UPDATE sip_municipio SET latitud='5.5797222', longitud='-73.3713889' WHERE id=797; -- Motavita / Boyacá
      UPDATE sip_municipio SET latitud='5.5166667', longitud='-74.1166667' WHERE id=801; -- Muzo / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-72.9166667' WHERE id=814; -- Nobsa / Boyacá
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.4166667' WHERE id=817; -- Nuevo Colón / Boyacá
      UPDATE sip_municipio SET latitud='5.6', longitud='-73.3166667' WHERE id=851; -- Oicatá / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-74.25' WHERE id=858; -- Otanche / Boyacá
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-73.4' WHERE id=865; -- Pachavita / Boyacá
      UPDATE sip_municipio SET latitud='5.1044444', longitud='-73.0555556' WHERE id=870; -- Páez / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-73.1' WHERE id=871; -- Paipa / Boyacá
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-72.6666667' WHERE id=876; -- Pajarito / Boyacá
      UPDATE sip_municipio SET latitud='6.5', longitud='-72.4166667' WHERE id=885; -- Panqueba / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.9166667' WHERE id=897; -- Pauna / Boyacá
      UPDATE sip_municipio SET latitud='5.6535', longitud='-72.3756' WHERE id=899; -- Paya / Boyacá
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-72.75' WHERE id=904; -- Paz De Río / Boyacá
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-73.05' WHERE id=911; -- Pesca / Boyacá
      UPDATE sip_municipio SET latitud='5.7427778', longitud='-72.4894444' WHERE id=925; -- Pisba / Boyacá
      UPDATE sip_municipio SET latitud='5.9780556', longitud='-74.5897222' WHERE id=949; -- Puerto Boyacá / Boyacá
      UPDATE sip_municipio SET latitud='5.5222222', longitud='-74.1808333' WHERE id=965; -- Quípama / Boyacá
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.3333333' WHERE id=985; -- Ramiriquí / Boyacá
      UPDATE sip_municipio SET latitud='5.6166667', longitud='-73.6333333' WHERE id=1013; -- Ráquira / Boyacá
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.1666667' WHERE id=1037; -- Rondón / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.7' WHERE id=1045; -- Saboyá / Boyacá
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-73.5' WHERE id=1048; -- Sáchica / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-73.5' WHERE id=1051; -- Samacá / Boyacá
      UPDATE sip_municipio SET latitud='5.2166667', longitud='-73.1333333' WHERE id=1074; -- San Eduardo / Boyacá
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-73.4666667' WHERE id=1080; -- San José De Pare / Boyacá
      UPDATE sip_municipio SET latitud='4.8213889', longitud='-73.1675' WHERE id=1085; -- San Luis De Gaceno / Boyacá
      UPDATE sip_municipio SET latitud='6.5', longitud='-72.5' WHERE id=1102; -- San Mateo / Boyacá
      UPDATE sip_municipio SET latitud='5.55', longitud='-73.75' WHERE id=1109; -- San Miguel De Sema / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-74.0833333' WHERE id=1120; -- San Pablo De Borbur / Boyacá
      UPDATE sip_municipio SET latitud='4.8616667', longitud='-73.2641667' WHERE id=1142; -- Santa María / Boyacá
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-73' WHERE id=1147; -- Santa Rosa De Viterbo / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.5833333' WHERE id=1150; -- Santa Sofía / Boyacá
      UPDATE sip_municipio SET latitud='6.0572222', longitud='-73.4822222' WHERE id=1135; -- Santana / Boyacá
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-72.6666667' WHERE id=1190; -- Sativanorte / Boyacá
      UPDATE sip_municipio SET latitud='6.1333333', longitud='-72.6666667' WHERE id=1191; -- Sativasur / Boyacá
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-73.1666667' WHERE id=1198; -- Siachoque / Boyacá
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-72.6666667' WHERE id=1215; -- Soatá / Boyacá
      UPDATE sip_municipio SET latitud='6', longitud='-72.6666667' WHERE id=1223; -- Socha / Boyacá
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-72.5833333' WHERE id=1219; -- Socotá / Boyacá
      UPDATE sip_municipio SET latitud='5.7205556', longitud='-72.9297222' WHERE id=1226; -- Sogamoso / Boyacá
      UPDATE sip_municipio SET latitud='4.9877778', longitud='-73.4361111' WHERE id=1231; -- Somondoco / Boyacá
      UPDATE sip_municipio SET latitud='5.5666667', longitud='-73.4333333' WHERE id=1233; -- Sora / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-73.3166667' WHERE id=1235; -- Soracá / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-73.25' WHERE id=1234; -- Sotaquirá / Boyacá
      UPDATE sip_municipio SET latitud='6.2666667', longitud='-72.6666667' WHERE id=1248; -- Susacón / Boyacá
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-73.5833333' WHERE id=1249; -- Sutamarchán / Boyacá
      UPDATE sip_municipio SET latitud='5.0166667', longitud='-73.45' WHERE id=1253; -- Sutatenza / Boyacá
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-72.7' WHERE id=1275; -- Tasco / Boyacá
      UPDATE sip_municipio SET latitud='5.15', longitud='-73.45' WHERE id=1284; -- Tenza / Boyacá
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-73.3833333' WHERE id=1309; -- Tibaná / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-72.9666667' WHERE id=1311; -- Tibasosa / Boyacá
      UPDATE sip_municipio SET latitud='5.6333333', longitud='-73.65' WHERE id=1316; -- Tinjacá / Boyacá
      UPDATE sip_municipio SET latitud='6.4233333', longitud='-72.6952778' WHERE id=1321; -- Tipacoque / Boyacá
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-73.1666667' WHERE id=1324; -- Toca / Boyacá
      UPDATE sip_municipio SET latitud='5.95', longitud='-73.4166667' WHERE id=1327; -- Togüí / Boyacá
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-72.8333333' WHERE id=1333; -- Tópaga / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-73' WHERE id=1335; -- Tota / Boyacá
      UPDATE sip_municipio SET latitud='5.5352778', longitud='-73.3677778' WHERE id=54; -- Tunja / Boyacá
      UPDATE sip_municipio SET latitud='5.7333333', longitud='-73.9333333' WHERE id=1343; -- Tununguá / Boyacá
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-73.5' WHERE id=1346; -- Turmequé / Boyacá
      UPDATE sip_municipio SET latitud='5.75', longitud='-73.1666667' WHERE id=1349; -- Tuta / Boyacá
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-72.8333333' WHERE id=1352; -- Tutazá / Boyacá
      UPDATE sip_municipio SET latitud='5.2333333', longitud='-73.45' WHERE id=1356; -- Úmbita / Boyacá
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.5' WHERE id=1377; -- Ventaquemada / Boyacá
      UPDATE sip_municipio SET latitud='5.6333333', longitud='-73.5333333' WHERE id=709; -- Villa De Leyva / Boyacá
      UPDATE sip_municipio SET latitud='5.5', longitud='-73.25' WHERE id=1402; -- Viracachá / Boyacá
      UPDATE sip_municipio SET latitud='5.35', longitud='-73.1666667' WHERE id=1428; -- Zetaquira / Boyacá
      UPDATE sip_municipio SET latitud='5.6333333', longitud='-75.4166667' WHERE id=148; -- Aguadas / Caldas
      UPDATE sip_municipio SET latitud='5.25', longitud='-75.75' WHERE id=725; -- Anserma / Caldas
      UPDATE sip_municipio SET latitud='5.3', longitud='-75.45' WHERE id=846; -- Aranzazu / Caldas
      UPDATE sip_municipio SET latitud='5', longitud='-75.8333333' WHERE id=1403; -- Belalcázar / Caldas
      UPDATE sip_municipio SET latitud='5', longitud='-75.6666667' WHERE id=259; -- Chinchiná / Caldas
      UPDATE sip_municipio SET latitud='5.3', longitud='-75.6' WHERE id=474; -- Filadelfia / Caldas
      UPDATE sip_municipio SET latitud='5.5333333', longitud='-74.7' WHERE id=645; -- La Dorada / Caldas
      UPDATE sip_municipio SET latitud='5.4019444', longitud='-75.8847222' WHERE id=654; -- La Merced / Caldas
      UPDATE sip_municipio SET latitud='5.07', longitud='-75.5205556' WHERE id=37; -- Manizales / Caldas
      UPDATE sip_municipio SET latitud='5.25', longitud='-75.1666667' WHERE id=747; -- Manzanares / Caldas
      UPDATE sip_municipio SET latitud='5.5', longitud='-75.5833333' WHERE id=758; -- Marmato / Caldas
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-75' WHERE id=762; -- Marquetalia / Caldas
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-75.25' WHERE id=764; -- Marulanda / Caldas
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-75.5' WHERE id=807; -- Neira / Caldas
      UPDATE sip_municipio SET latitud='5.5666667', longitud='-74.8833333' WHERE id=819; -- Norcasia / Caldas
      UPDATE sip_municipio SET latitud='5.5', longitud='-75.5' WHERE id=869; -- Pácora / Caldas
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-75.6666667' WHERE id=889; -- Palestina / Caldas
      UPDATE sip_municipio SET latitud='5.5', longitud='-75.0833333' WHERE id=909; -- Pensilvania / Caldas
      UPDATE sip_municipio SET latitud='5.3791667', longitud='-75.6161111' WHERE id=1024; -- Riosucio / Caldas
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-75.75' WHERE id=1032; -- Risaralda / Caldas
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-75.4166667' WHERE id=1060; -- Salamina / Caldas
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-74.9166667' WHERE id=1077; -- Samaná / Caldas
      UPDATE sip_municipio SET latitud='5.0858333', longitud='-75.7883333' WHERE id=1082; -- San José / Caldas
      UPDATE sip_municipio SET latitud='5.5', longitud='-75.6333333' WHERE id=1252; -- Supía / Caldas
      UPDATE sip_municipio SET latitud='4.5238889', longitud='-76.0411111' WHERE id=1384; -- Victoria / Caldas
      UPDATE sip_municipio SET latitud='5', longitud='-75.5' WHERE id=1393; -- Villamaría / Caldas
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-75.8666667' WHERE id=1400; -- Viterbo / Caldas
      UPDATE sip_municipio SET latitud='1.3316667', longitud='-75.8822222' WHERE id=494; -- Albania / Caquetá
      UPDATE sip_municipio SET latitud='1.4166667', longitud='-75.9166667' WHERE id=1457; -- Belén De Los Andaquíes / Caquetá
      UPDATE sip_municipio SET latitud='1.35', longitud='-74.84' WHERE id=215; -- Cartagena Del Chairá / Caquetá
      UPDATE sip_municipio SET latitud='1.0352778', longitud='-75.9247222' WHERE id=341; -- Curillo / Caquetá
      UPDATE sip_municipio SET latitud='1.6794444', longitud='-75.2791667' WHERE id=428; -- El Doncello / Caquetá
      UPDATE sip_municipio SET latitud='1.564', longitud='-75.332' WHERE id=447; -- El Paujíl / Caquetá
      UPDATE sip_municipio SET latitud='1.6175', longitud='-75.6175' WHERE id=33; -- Florencia / Caquetá
      UPDATE sip_municipio SET latitud='1.5833333', longitud='-75.25' WHERE id=712; -- La Montañita / Caquetá
      UPDATE sip_municipio SET latitud='1.3483333', longitud='-75.5116667' WHERE id=776; -- Milán / Caquetá
      UPDATE sip_municipio SET latitud='1.4875', longitud='-75.725' WHERE id=798; -- Morelia / Caquetá
      UPDATE sip_municipio SET latitud='1.9141667', longitud='-75.145' WHERE id=977; -- Puerto Rico / Caquetá
      UPDATE sip_municipio SET latitud='1.3611111', longitud='-75.9883333' WHERE id=1021; -- San José Del Fragua / Caquetá
      UPDATE sip_municipio SET latitud='2.1525', longitud='-74.7888889' WHERE id=1214; -- San Vicente Del Caguán / Caquetá
      UPDATE sip_municipio SET latitud='0.7976478', longitud='-74.458598' WHERE id=1220; -- Solano / Caquetá
      UPDATE sip_municipio SET latitud='0.9', longitud='-75.623' WHERE id=1262; -- Solita / Caquetá
      UPDATE sip_municipio SET latitud='1.1991667', longitud='-75.7097222' WHERE id=1374; -- Valparaíso / Caquetá
      UPDATE sip_municipio SET latitud='5.1730556', longitud='-72.5547222' WHERE id=59; -- Aguazul / Casanare
      UPDATE sip_municipio SET latitud='5', longitud='-72.75' WHERE id=202; -- Chámeza / Casanare
      UPDATE sip_municipio SET latitud='6.1555556', longitud='-71.7655556' WHERE id=141; -- Hato Corozal / Casanare
      UPDATE sip_municipio SET latitud='6.1852778', longitud='-72.3444444' WHERE id=173; -- La Salina / Casanare
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-72.3333333' WHERE id=177; -- Maní / Casanare
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-72.8333333' WHERE id=240; -- Monterrey / Casanare
      UPDATE sip_municipio SET latitud='5.6405556', longitud='-72.1986111' WHERE id=386; -- Nunchía / Casanare
      UPDATE sip_municipio SET latitud='4.7941667', longitud='-71.34' WHERE id=397; -- Orocué / Casanare
      UPDATE sip_municipio SET latitud='5.8833333', longitud='-71.9' WHERE id=443; -- Paz De Ariporo / Casanare
      UPDATE sip_municipio SET latitud='5.6708333', longitud='-71.93' WHERE id=460; -- Pore / Casanare
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-72.75' WHERE id=483; -- Recetor / Casanare
      UPDATE sip_municipio SET latitud='4.8536111', longitud='-73.0430556' WHERE id=542; -- Sabanalarga / Casanare
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-72.0833333' WHERE id=558; -- Sácama / Casanare
      UPDATE sip_municipio SET latitud='5.2805556', longitud='-71.5819444' WHERE id=585; -- San Luis De Palenque / Casanare
      UPDATE sip_municipio SET latitud='5.8297222', longitud='-72.1633333' WHERE id=697; -- Támara / Casanare
      UPDATE sip_municipio SET latitud='5.0186111', longitud='-72.7552778' WHERE id=713; -- Tauramena / Casanare
      UPDATE sip_municipio SET latitud='5.4305556', longitud='-71.6311111' WHERE id=743; -- Trinidad / Casanare
      UPDATE sip_municipio SET latitud='5.2833333', longitud='-71.9666667' WHERE id=756; -- Villanueva / Casanare
      UPDATE sip_municipio SET latitud='5.3394444', longitud='-72.3941667' WHERE id=58; -- Yopal / Casanare
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-76.8333333' WHERE id=372; -- Almaguer / Cauca
      UPDATE sip_municipio SET latitud='2.2666667', longitud='-77.25' WHERE id=847; -- Argelia / Cauca
      UPDATE sip_municipio SET latitud='2.1', longitud='-77.2' WHERE id=1211; -- Balboa / Cauca
      UPDATE sip_municipio SET latitud='1.8333333', longitud='-76.9166667' WHERE id=77; -- Bolívar / Cauca
      UPDATE sip_municipio SET latitud='2.9166667', longitud='-76.6666667' WHERE id=108; -- Buenos Aires / Cauca
      UPDATE sip_municipio SET latitud='2.6666667', longitud='-76.6666667' WHERE id=164; -- Cajibío / Cauca
      UPDATE sip_municipio SET latitud='2.8333333', longitud='-76.4166667' WHERE id=174; -- Caldono / Cauca
      UPDATE sip_municipio SET latitud='3.0833333', longitud='-76.3333333' WHERE id=192; -- Caloto / Cauca
      UPDATE sip_municipio SET latitud='3.1666667', longitud='-76.2' WHERE id=360; -- Corinto / Cauca
      UPDATE sip_municipio SET latitud='2.5', longitud='-77' WHERE id=449; -- El Tambo / Cauca
      UPDATE sip_municipio SET latitud='1.6944444', longitud='-77.0758333' WHERE id=496; -- Florencia / Cauca
      UPDATE sip_municipio SET latitud='3.1333333', longitud='-76.3833333' WHERE id=540; -- Guachené / Cauca
      UPDATE sip_municipio SET latitud='2.4166667', longitud='-77.6' WHERE id=566; -- Guapi / Cauca
      UPDATE sip_municipio SET latitud='2.6666667', longitud='-76.0833333' WHERE id=610; -- Inzá / Cauca
      UPDATE sip_municipio SET latitud='2.85', longitud='-76.3166667' WHERE id=621; -- Jambaló / Cauca
      UPDATE sip_municipio SET latitud='2.25', longitud='-76.8333333' WHERE id=657; -- La Sierra / Cauca
      UPDATE sip_municipio SET latitud='2.0833333', longitud='-76.8333333' WHERE id=661; -- La Vega / Cauca
      UPDATE sip_municipio SET latitud='2.4333333', longitud='-76.8' WHERE id=723; -- López De Micay / Cauca
      UPDATE sip_municipio SET latitud='1.75', longitud='-77.1666667' WHERE id=770; -- Mercaderes / Cauca
      UPDATE sip_municipio SET latitud='3.25', longitud='-76.25' WHERE id=773; -- Miranda / Cauca
      UPDATE sip_municipio SET latitud='2.8', longitud='-76.6666667' WHERE id=792; -- Morales / Cauca
      UPDATE sip_municipio SET latitud='3.0666667', longitud='-76.3166667' WHERE id=868; -- Padilla / Cauca
      UPDATE sip_municipio SET latitud='5.1044444', longitud='-73.0555556' WHERE id=873; -- Páez / Cauca
      UPDATE sip_municipio SET latitud='2.1155556', longitud='-76.9891667' WHERE id=898; -- Patía / Cauca
      UPDATE sip_municipio SET latitud='7.7833333', longitud='-75.2' WHERE id=900; -- Piamonte / Cauca
      UPDATE sip_municipio SET latitud='2.75', longitud='-76.5' WHERE id=916; -- Piendamó - Tunía / Cauca
      UPDATE sip_municipio SET latitud='3.2775', longitud='-75.6213889' WHERE id=46; -- Popayán / Cauca
      UPDATE sip_municipio SET latitud='3.25', longitud='-76.4166667' WHERE id=956; -- Puerto Tejada / Cauca
      UPDATE sip_municipio SET latitud='2.3480556', longitud='-76.5008333' WHERE id=970; -- Puracé / Cauca
      UPDATE sip_municipio SET latitud='2.3333333', longitud='-76.75' WHERE id=1040; -- Rosas / Cauca
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-76.6666667' WHERE id=1146; -- San Sebastián / Cauca
      UPDATE sip_municipio SET latitud='1.5', longitud='-76.5' WHERE id=1175; -- Santa Rosa / Cauca
      UPDATE sip_municipio SET latitud='3.0130556', longitud='-76.4866667' WHERE id=1152; -- Santander De Quilichao / Cauca
      UPDATE sip_municipio SET latitud='2.75', longitud='-76.3333333' WHERE id=1203; -- Silvia / Cauca
      UPDATE sip_municipio SET latitud='2.2566667', longitud='-76.6186111' WHERE id=1230; -- Sotará - Paispamba / Cauca
      UPDATE sip_municipio SET latitud='2.9588889', longitud='-76.6952778' WHERE id=1259; -- Suárez / Cauca
      UPDATE sip_municipio SET latitud='2.0333333', longitud='-76.9166667' WHERE id=1263; -- Sucre / Cauca
      UPDATE sip_municipio SET latitud='2.4166667', longitud='-76.75' WHERE id=1315; -- Timbío / Cauca
      UPDATE sip_municipio SET latitud='2.75', longitud='-77.5833333' WHERE id=1317; -- Timbiquí / Cauca
      UPDATE sip_municipio SET latitud='3', longitud='-76.1666667' WHERE id=1334; -- Toribío / Cauca
      UPDATE sip_municipio SET latitud='2.5833333', longitud='-76.3333333' WHERE id=1339; -- Totoró / Cauca
      UPDATE sip_municipio SET latitud='2.5136111', longitud='-76.8477778' WHERE id=1360; -- Villa Rica / Cauca
      UPDATE sip_municipio SET latitud='8.3333333', longitud='-73.5833333' WHERE id=88; -- Aguachica / Cesar
      UPDATE sip_municipio SET latitud='9.9166667', longitud='-73.25' WHERE id=149; -- Agustín Codazzi / Cesar
      UPDATE sip_municipio SET latitud='9.5011111', longitud='-73.9802778' WHERE id=571; -- Astrea / Cesar
      UPDATE sip_municipio SET latitud='9.705', longitud='-73.2847222' WHERE id=768; -- Becerril / Cesar
      UPDATE sip_municipio SET latitud='9.9761111', longitud='-73.8902778' WHERE id=1011; -- Bosconia / Cesar
      UPDATE sip_municipio SET latitud='9.2577778', longitud='-73.8177778' WHERE id=261; -- Chimichagua / Cesar
      UPDATE sip_municipio SET latitud='9.5', longitud='-73.4166667' WHERE id=266; -- Chiriguaná / Cesar
      UPDATE sip_municipio SET latitud='9.2041667', longitud='-73.5486111' WHERE id=391; -- Curumaní / Cesar
      UPDATE sip_municipio SET latitud='10.1505556', longitud='-73.965' WHERE id=410; -- El Copey / Cesar
      UPDATE sip_municipio SET latitud='9.6622222', longitud='-73.7519444' WHERE id=440; -- El Paso / Cesar
      UPDATE sip_municipio SET latitud='8.3333333', longitud='-73.6666667' WHERE id=501; -- Gamarra / Cesar
      UPDATE sip_municipio SET latitud='8.4', longitud='-73.3333333' WHERE id=551; -- González / Cesar
      UPDATE sip_municipio SET latitud='8.5833333', longitud='-73.5833333' WHERE id=649; -- La Gloria / Cesar
      UPDATE sip_municipio SET latitud='9.5641667', longitud='-73.3375' WHERE id=691; -- La Jagua De Ibirico / Cesar
      UPDATE sip_municipio SET latitud='10.1666667', longitud='-73.25' WHERE id=1035; -- La Paz / Cesar
      UPDATE sip_municipio SET latitud='10.385', longitud='-73.0287' WHERE id=760; -- Manaure Balcón Del Cesar / Cesar
      UPDATE sip_municipio SET latitud='8.9661111', longitud='-73.6316667' WHERE id=872; -- Pailitas / Cesar
      UPDATE sip_municipio SET latitud='8.6916667', longitud='-73.6663889' WHERE id=924; -- Pelaya / Cesar
      UPDATE sip_municipio SET latitud='10.3666667', longitud='-73.6333333' WHERE id=943; -- Pueblo Bello / Cesar
      UPDATE sip_municipio SET latitud='8', longitud='-73.5' WHERE id=1025; -- Río De Oro / Cesar
      UPDATE sip_municipio SET latitud='7.7525', longitud='-73.3891667' WHERE id=1181; -- San Alberto / Cesar
      UPDATE sip_municipio SET latitud='10.3375', longitud='-73.1825' WHERE id=1213; -- San Diego / Cesar
      UPDATE sip_municipio SET latitud='8.0047222', longitud='-73.5152778' WHERE id=1239; -- San Martín / Cesar
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-73.5833333' WHERE id=1267; -- Tamalameque / Cesar
      UPDATE sip_municipio SET latitud='10.4769444', longitud='-73.2505556' WHERE id=55; -- Valledupar / Cesar
      UPDATE sip_municipio SET latitud='8.3333333', longitud='-77.1666667' WHERE id=987; -- Acandí / Chocó
      UPDATE sip_municipio SET latitud='5.5161', longitud='-76.9747' WHERE id=432; -- Alto Baudó / Chocó
      UPDATE sip_municipio SET latitud='5.5333333', longitud='-76.6333333' WHERE id=848; -- Atrato / Chocó
      UPDATE sip_municipio SET latitud='5.5', longitud='-76.25' WHERE id=1192; -- Bagadó / Chocó
      UPDATE sip_municipio SET latitud='6.2191667', longitud='-77.4077778' WHERE id=1210; -- Bahía Solano / Chocó
      UPDATE sip_municipio SET latitud='5', longitud='-77.083333' WHERE id=1237; -- Bajo Baudó / Chocó
      UPDATE sip_municipio SET latitud='6.5236111', longitud='-76.974444' WHERE id=1465; -- Bojayá / Chocó
      UPDATE sip_municipio SET latitud='7.158', longitud='-76.971' WHERE id=213; -- Carmen Del Darién / Chocó
      UPDATE sip_municipio SET latitud='5.4', longitud='-76.6' WHERE id=234; -- Cértegui / Chocó
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-76.5' WHERE id=340; -- Condoto / Chocó
      UPDATE sip_municipio SET latitud='5.3776', longitud='-76.76199' WHERE id=172; -- El Cantón Del San Pablo / Chocó
      UPDATE sip_municipio SET latitud='6.398', longitud='-77.32538' WHERE id=423; -- El Carmen De Atrato / Chocó
      UPDATE sip_municipio SET latitud='4.2586111', longitud='-77.3675' WHERE id=439; -- El Litoral Del San Juan / Chocó
      UPDATE sip_municipio SET latitud='5.1588889', longitud='-76.6916667' WHERE id=618; -- Istmina / Chocó
      UPDATE sip_municipio SET latitud='7', longitud='-77.6666667' WHERE id=633; -- Juradó / Chocó
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-76.4166667' WHERE id=717; -- Lloró / Chocó
      UPDATE sip_municipio SET latitud='5.9954', longitud='-76.7817' WHERE id=733; -- Medio Atrato / Chocó
      UPDATE sip_municipio SET latitud='5.14907', longitud='-76.986628' WHERE id=742; -- Medio Baudó / Chocó
      UPDATE sip_municipio SET latitud='5.1', longitud='-76.683' WHERE id=769; -- Medio San Juan / Chocó
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-76.5833333' WHERE id=816; -- Nóvita / Chocó
      UPDATE sip_municipio SET latitud='6', longitud='-77.3333333' WHERE id=820; -- Nuquí / Chocó
      UPDATE sip_municipio SET latitud='5.6947222', longitud='-76.6611111' WHERE id=48; -- Quibdó / Chocó
      UPDATE sip_municipio SET latitud='5.1', longitud='-76.6666667' WHERE id=967; -- Río Iró / Chocó
      UPDATE sip_municipio SET latitud='5.7', longitud='-76.6666667' WHERE id=1012; -- Río Quito / Chocó
      UPDATE sip_municipio SET latitud='7.4166667', longitud='-77.1666667' WHERE id=1028; -- Riosucio / Chocó
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-76.25' WHERE id=1075; -- San José Del Palmar / Chocó
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-76.5' WHERE id=1207; -- Sipí / Chocó
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-76.4166667' WHERE id=1266; -- Tadó / Chocó
      UPDATE sip_municipio SET latitud='8.0430556', longitud='-77.0961111' WHERE id=1307; -- Unguía / Chocó
      UPDATE sip_municipio SET latitud='5.283', longitud='-76.617' WHERE id=1323; -- Unión Panamericana / Chocó
      UPDATE sip_municipio SET latitud='8.25', longitud='-75.25' WHERE id=1117; -- Ayapel / Córdoba
      UPDATE sip_municipio SET latitud='8.7575', longitud='-75.89' WHERE id=1273; -- Buenavista / Córdoba
      UPDATE sip_municipio SET latitud='8.6761111', longitud='-76.2041667' WHERE id=1451; -- Canalete / Córdoba
      UPDATE sip_municipio SET latitud='8.9166667', longitud='-76' WHERE id=237; -- Cereté / Córdoba
      UPDATE sip_municipio SET latitud='9.0833333', longitud='-75.6333333' WHERE id=244; -- Chimá / Córdoba
      UPDATE sip_municipio SET latitud='9.0833333', longitud='-75.3333333' WHERE id=278; -- Chinú / Córdoba
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-75.6666667' WHERE id=284; -- Ciénaga De Oro / Córdoba
      UPDATE sip_municipio SET latitud='9.05', longitud='-75.8' WHERE id=538; -- Cotorra / Córdoba
      UPDATE sip_municipio SET latitud='8.04076', longitud='-75.31354' WHERE id=604; -- La Apartada / Córdoba
      UPDATE sip_municipio SET latitud='9.1666667', longitud='-75.8333333' WHERE id=718; -- Lorica / Córdoba
      UPDATE sip_municipio SET latitud='8.9', longitud='-76.3597222' WHERE id=724; -- Los Córdobas / Córdoba
      UPDATE sip_municipio SET latitud='9.2372222', longitud='-75.6780556' WHERE id=781; -- Momil / Córdoba
      UPDATE sip_municipio SET latitud='7.75', longitud='-75.6666667' WHERE id=784; -- Montelíbano / Córdoba
      UPDATE sip_municipio SET latitud='8.7575', longitud='-75.89' WHERE id=41; -- Montería / Córdoba
      UPDATE sip_municipio SET latitud='8.25', longitud='-76.05' WHERE id=849; -- Moñitos / Córdoba
      UPDATE sip_municipio SET latitud='8.3333333', longitud='-75.5833333' WHERE id=930; -- Planeta Rica / Córdoba
      UPDATE sip_municipio SET latitud='8.2333333', longitud='-74.9666667' WHERE id=944; -- Pueblo Nuevo / Córdoba
      UPDATE sip_municipio SET latitud='8.95', longitud='-76.25' WHERE id=957; -- Puerto Escondido / Córdoba
      UPDATE sip_municipio SET latitud='4.6', longitud='-74.1166667' WHERE id=963; -- Puerto Libertador / Córdoba
      UPDATE sip_municipio SET latitud='9.3', longitud='-75.6666667' WHERE id=972; -- Purísima De La Concepción / Córdoba
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-75.4166667' WHERE id=1071; -- Sahagún / Córdoba
      UPDATE sip_municipio SET latitud='9.14522', longitud='-75.509' WHERE id=1093; -- San Andrés De Sotavento / Córdoba
      UPDATE sip_municipio SET latitud='9.35', longitud='-75.75' WHERE id=1099; -- San Antero / Córdoba
      UPDATE sip_municipio SET latitud='9.25', longitud='-76' WHERE id=1107; -- San Bernardo Del Viento / Córdoba
      UPDATE sip_municipio SET latitud='8.7', longitud='-75.7' WHERE id=1113; -- San Carlos / Córdoba
      UPDATE sip_municipio SET latitud='7.767', longitud='-75.517' WHERE id=1122; -- San José De Uré / Córdoba
      UPDATE sip_municipio SET latitud='9', longitud='-75.9166667' WHERE id=1132; -- San Pelayo / Córdoba
      UPDATE sip_municipio SET latitud='8.1736111', longitud='-76.0591667' WHERE id=1313; -- Tierralta / Córdoba
      UPDATE sip_municipio SET latitud='9.1833333', longitud='-75.55' WHERE id=1326; -- Tuchín / Córdoba
      UPDATE sip_municipio SET latitud='8.3', longitud='-76.1666667' WHERE id=1368; -- Valencia / Córdoba
      UPDATE sip_municipio SET latitud='4.4166667', longitud='-74.6666667' WHERE id=6; -- Agua De Dios / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.45' WHERE id=288; -- Albán / Cundinamarca
      UPDATE sip_municipio SET latitud='4.6166667', longitud='-74.55' WHERE id=603; -- Anapoima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-74.5' WHERE id=689; -- Anolaima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.52053', longitud='-74.594' WHERE id=983; -- Apulo / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3', longitud='-74.5833333' WHERE id=893; -- Arbeláez / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8', longitud='-74.75' WHERE id=1373; -- Beltrán / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.55' WHERE id=1458; -- Bituima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-74.3333333' WHERE id=1464; -- Bojacá / Cundinamarca
      UPDATE sip_municipio SET latitud='3.9780556', longitud='-74.4858333' WHERE id=131; -- Cabrera / Cundinamarca
      UPDATE sip_municipio SET latitud='5.2666667', longitud='-74.5666667' WHERE id=135; -- Cachipay / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.05' WHERE id=142; -- Cajicá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-74.5833333' WHERE id=198; -- Caparrapí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.45', longitud='-73.95' WHERE id=217; -- Cáqueza / Cundinamarca
      UPDATE sip_municipio SET latitud='5.3502778', longitud='-73.9052778' WHERE id=221; -- Carmen De Carupa / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.65' WHERE id=242; -- Chaguaní / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.05' WHERE id=262; -- Chía / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5', longitud='-74.0833333' WHERE id=265; -- Chipaque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-73.9166667' WHERE id=277; -- Choachí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-73.6666667' WHERE id=280; -- Chocontá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.15', longitud='-73.9666667' WHERE id=334; -- Cogua / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-74.1333333' WHERE id=363; -- Cota / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-73.75' WHERE id=385; -- Cucunubá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-74.45' WHERE id=425; -- El Colegio / Cundinamarca
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-74.3333333' WHERE id=450; -- El Peñón / Cundinamarca
      UPDATE sip_municipio SET latitud='4.85', longitud='-74.2666667' WHERE id=456; -- El Rosal / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8166667', longitud='-74.3666667' WHERE id=469; -- Facatativá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-73.8333333' WHERE id=482; -- Fómeque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-73.9166667' WHERE id=485; -- Fosca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.7833333', longitud='-74.2' WHERE id=489; -- Funza / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.8' WHERE id=493; -- Fúquene / Cundinamarca
      UPDATE sip_municipio SET latitud='4.4166667', longitud='-74.4' WHERE id=497; -- Fusagasugá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-73.5' WHERE id=498; -- Gachalá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73.8833333' WHERE id=500; -- Gachancipá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-73.6666667' WHERE id=505; -- Gachetá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-73.6' WHERE id=508; -- Gama / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3030556', longitud='-74.8008333' WHERE id=547; -- Girardot / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0666667', longitud='-74.5666667' WHERE id=553; -- Granada / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-73.7' WHERE id=560; -- Guachetá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-74.6666667' WHERE id=573; -- Guaduas / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-73.8333333' WHERE id=578; -- Guasca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-74.8' WHERE id=581; -- Guataquí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9666667', longitud='-73.75' WHERE id=586; -- Guatavita / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8813889', longitud='-74.4702778' WHERE id=588; -- Guayabal De Síquima / Cundinamarca
      UPDATE sip_municipio SET latitud='4.2163889', longitud='-73.8133333' WHERE id=591; -- Guayabetal / Cundinamarca
      UPDATE sip_municipio SET latitud='4.25', longitud='-74' WHERE id=592; -- Gutiérrez / Cundinamarca
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-74.6666667' WHERE id=627; -- Jerusalén / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-73.6666667' WHERE id=632; -- Junín / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-73.9166667' WHERE id=636; -- La Calera / Cundinamarca
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-74.5' WHERE id=653; -- La Mesa / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-74.4166667' WHERE id=658; -- La Palma / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-74.4166667' WHERE id=662; -- La Peña / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.35' WHERE id=700; -- La Vega / Cundinamarca
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-73.6666667' WHERE id=708; -- Lenguazaque / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73.6166667' WHERE id=734; -- Machetá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-74.3' WHERE id=739; -- Madrid / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73.5833333' WHERE id=750; -- Manta / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5', longitud='-73.3333333' WHERE id=751; -- Medina / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-74.3333333' WHERE id=794; -- Mosquera / Cundinamarca
      UPDATE sip_municipio SET latitud='4.45', longitud='-74.8' WHERE id=803; -- Nariño / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-73.9' WHERE id=808; -- Nemocón / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-74.5833333' WHERE id=809; -- Nilo / Cundinamarca
      UPDATE sip_municipio SET latitud='5.2', longitud='-74.4166667' WHERE id=810; -- Nimaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1166667', longitud='-74.4166667' WHERE id=815; -- Nocaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-74.1666667' WHERE id=867; -- Pacho / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-74.1666667' WHERE id=875; -- Paime / Cundinamarca
      UPDATE sip_municipio SET latitud='4.25', longitud='-74.5' WHERE id=891; -- Pandi / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3730556', longitud='-73.2213889' WHERE id=895; -- Paratebueno / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-74.2833333' WHERE id=902; -- Pasca / Cundinamarca
      UPDATE sip_municipio SET latitud='5.5', longitud='-74.5833333' WHERE id=950; -- Puerto Salgar / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-74.6666667' WHERE id=964; -- Pulí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.15', longitud='-74.5' WHERE id=978; -- Quebradanegra / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-73.8333333' WHERE id=979; -- Quetame / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75', longitud='-74.5833333' WHERE id=982; -- Quipile / Cundinamarca
      UPDATE sip_municipio SET latitud='4.2797222', longitud='-74.7761111' WHERE id=1022; -- Ricaurte / Cundinamarca
      UPDATE sip_municipio SET latitud='4.6161', longitud='-74.3521' WHERE id=1050; -- San Antonio Del Tequendama / Cundinamarca
      UPDATE sip_municipio SET latitud='4.2', longitud='-74.3333333' WHERE id=1054; -- San Bernardo / Cundinamarca
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-74.0833333' WHERE id=1061; -- San Cayetano / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.2833333' WHERE id=1067; -- San Francisco / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.6666667' WHERE id=1078; -- San Juan De Rioseco / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.45' WHERE id=1185; -- Sasaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-73.8333333' WHERE id=1195; -- Sesquilé / Cundinamarca
      UPDATE sip_municipio SET latitud='4.4913889', longitud='-74.2605556' WHERE id=1199; -- Sibaté / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5', longitud='-74.3333333' WHERE id=1202; -- Silvania / Cundinamarca
      UPDATE sip_municipio SET latitud='5.5833333', longitud='-73.8333333' WHERE id=1206; -- Simijaca / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5872222', longitud='-74.2213889' WHERE id=1216; -- Soacha / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-73.95' WHERE id=1225; -- Sopó / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.1666667' WHERE id=1236; -- Subachoque / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-73.8333333' WHERE id=1245; -- Suesca / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-74.25' WHERE id=1251; -- Supatá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.5', longitud='-73.8333333' WHERE id=1254; -- Susa / Cundinamarca
      UPDATE sip_municipio SET latitud='5.251', longitud='-73.856' WHERE id=1261; -- Sutatausa / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-74.0833333' WHERE id=1264; -- Tabio / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-73.9166667' WHERE id=1278; -- Tausa / Cundinamarca
      UPDATE sip_municipio SET latitud='4.7', longitud='-74.4166667' WHERE id=1280; -- Tena / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.1666667' WHERE id=1286; -- Tenjo / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3833333', longitud='-74.5' WHERE id=1310; -- Tibacuy / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-73.5333333' WHERE id=1312; -- Tibirita / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5', longitud='-74.6666667' WHERE id=1325; -- Tocaima / Cundinamarca
      UPDATE sip_municipio SET latitud='5', longitud='-73.9166667' WHERE id=1328; -- Tocancipá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-74.3333333' WHERE id=1337; -- Topaipí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-73.5' WHERE id=1353; -- Ubalá / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-74' WHERE id=1354; -- Ubaque / Cundinamarca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-74.0833333' WHERE id=1359; -- Une / Cundinamarca
      UPDATE sip_municipio SET latitud='5.25', longitud='-74.5' WHERE id=1364; -- Útica / Cundinamarca
      UPDATE sip_municipio SET latitud='4.06375', longitud='-74.451536' WHERE id=857; -- Venecia / Cundinamarca
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-74.3333333' WHERE id=1379; -- Vergara / Cundinamarca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.55' WHERE id=1383; -- Vianí / Cundinamarca
      UPDATE sip_municipio SET latitud='5.3071', longitud='-73.81524' WHERE id=1357; -- Villa De San Diego De Ubaté / Cundinamarca
      UPDATE sip_municipio SET latitud='5.2761111', longitud='-74.1988889' WHERE id=1389; -- Villagómez / Cundinamarca
      UPDATE sip_municipio SET latitud='5.2833333', longitud='-73.5833333' WHERE id=1395; -- Villapinzón / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-74.5' WHERE id=1399; -- Villeta / Cundinamarca
      UPDATE sip_municipio SET latitud='4.5', longitud='-74.5' WHERE id=1401; -- Viotá / Cundinamarca
      UPDATE sip_municipio SET latitud='5.6666667', longitud='-74.4166667' WHERE id=1410; -- Yacopí / Cundinamarca
      UPDATE sip_municipio SET latitud='4.75263', longitud='-74.37936' WHERE id=1429; -- Zipacón / Cundinamarca
      UPDATE sip_municipio SET latitud='5.0283333', longitud='-74.0058333' WHERE id=1430; -- Zipaquirá / Cundinamarca
      UPDATE sip_municipio SET latitud='3.90399', longitud='-67.9026' WHERE id=594; -- Barrancominas / Guainía
      UPDATE sip_municipio SET latitud='3.5261', longitud='-67.4126' WHERE id=1414; -- Cacahual / Guainía
      UPDATE sip_municipio SET latitud='3.8652778', longitud='-67.9238889' WHERE id=35; -- Inírida / Guainía
      UPDATE sip_municipio SET latitud='1.24308', longitud='-66.8675' WHERE id=1408; -- La Guadalupe / Guainía
      UPDATE sip_municipio SET latitud='2.2392', longitud='-69.94164' WHERE id=1417; -- Morichal / Guainía
      UPDATE sip_municipio SET latitud='1.8646', longitud='-69.0102' WHERE id=1415; -- Pana Pana / Guainía
      UPDATE sip_municipio SET latitud='2.72704', longitud='-67.56797' WHERE id=1407; -- Puerto Colombia / Guainía
      UPDATE sip_municipio SET latitud='1.89859', longitud='-67.07952' WHERE id=1406; -- San Felipe / Guainía
      UPDATE sip_municipio SET latitud='1.9597222', longitud='-72.6538889' WHERE id=201; -- Calamar / Guaviare
      UPDATE sip_municipio SET latitud='2.3305556', longitud='-72.6277778' WHERE id=433; -- El Retorno / Guaviare
      UPDATE sip_municipio SET latitud='1.3366667', longitud='-71.9511111' WHERE id=335; -- Miraflores / Guaviare
      UPDATE sip_municipio SET latitud='2.5683333', longitud='-72.6416667' WHERE id=51; -- San José Del Guaviare / Guaviare
      UPDATE sip_municipio SET latitud='1.75', longitud='-75.9166667' WHERE id=988; -- Acevedo / Huila
      UPDATE sip_municipio SET latitud='2.3333333', longitud='-75.75' WHERE id=146; -- Agrado / Huila
      UPDATE sip_municipio SET latitud='3.25', longitud='-75.3333333' WHERE id=223; -- Aipe / Huila
      UPDATE sip_municipio SET latitud='2.5833333', longitud='-75.25' WHERE id=326; -- Algeciras / Huila
      UPDATE sip_municipio SET latitud='2.1666667', longitud='-75.8333333' WHERE id=453; -- Altamira / Huila
      UPDATE sip_municipio SET latitud='3.1666667', longitud='-75' WHERE id=1256; -- Baraya / Huila
      UPDATE sip_municipio SET latitud='2.6666667', longitud='-75.3333333' WHERE id=169; -- Campoalegre / Huila
      UPDATE sip_municipio SET latitud='2.5', longitud='-75.75' WHERE id=342; -- Colombia / Huila
      UPDATE sip_municipio SET latitud='2.0833333', longitud='-76' WHERE id=420; -- Elías / Huila
      UPDATE sip_municipio SET latitud='2.25', longitud='-75.5833333' WHERE id=506; -- Garzón / Huila
      UPDATE sip_municipio SET latitud='2.5', longitud='-75.5' WHERE id=544; -- Gigante / Huila
      UPDATE sip_municipio SET latitud='2.0833333', longitud='-75.6666667' WHERE id=569; -- Guadalupe / Huila
      UPDATE sip_municipio SET latitud='2.5833333', longitud='-75.5' WHERE id=600; -- Hobo / Huila
      UPDATE sip_municipio SET latitud='2.75', longitud='-75.75' WHERE id=612; -- Íquira / Huila
      UPDATE sip_municipio SET latitud='2.0833333', longitud='-76.25' WHERE id=613; -- Isnos / Huila
      UPDATE sip_municipio SET latitud='2.25', longitud='-76.1666667' WHERE id=641; -- La Argentina / Huila
      UPDATE sip_municipio SET latitud='2.4166667', longitud='-76.1666667' WHERE id=659; -- La Plata / Huila
      UPDATE sip_municipio SET latitud='2.65', longitud='-75.8' WHERE id=806; -- Nátaga / Huila
      UPDATE sip_municipio SET latitud='2.9305556', longitud='-75.3302778' WHERE id=42; -- Neiva / Huila
      UPDATE sip_municipio SET latitud='2.0833333', longitud='-76.0166667' WHERE id=854; -- Oporapa / Huila
      UPDATE sip_municipio SET latitud='2.45', longitud='-75.75' WHERE id=874; -- Paicol / Huila
      UPDATE sip_municipio SET latitud='3', longitud='-75.5' WHERE id=888; -- Palermo / Huila
      UPDATE sip_municipio SET latitud='1.75', longitud='-76.0666667' WHERE id=894; -- Palestina / Huila
      UPDATE sip_municipio SET latitud='2.3333333', longitud='-75.8333333' WHERE id=918; -- Pital / Huila
      UPDATE sip_municipio SET latitud='1.75', longitud='-76.1666667' WHERE id=926; -- Pitalito / Huila
      UPDATE sip_municipio SET latitud='2.8333333', longitud='-75.1666667' WHERE id=1029; -- Rivera / Huila
      UPDATE sip_municipio SET latitud='2.0144444', longitud='-76.0502778' WHERE id=1072; -- Saladoblanco / Huila
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-76.3333333' WHERE id=1088; -- San Agustín / Huila
      UPDATE sip_municipio SET latitud='3', longitud='-75.7' WHERE id=1110; -- Santa María / Huila
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-75.8333333' WHERE id=1242; -- Suaza / Huila
      UPDATE sip_municipio SET latitud='2.1666667', longitud='-75.9166667' WHERE id=1276; -- Tarqui / Huila
      UPDATE sip_municipio SET latitud='3.0833333', longitud='-75.0833333' WHERE id=1285; -- Tello / Huila
      UPDATE sip_municipio SET latitud='2.9166667', longitud='-75.6666667' WHERE id=1308; -- Teruel / Huila
      UPDATE sip_municipio SET latitud='2.6666667', longitud='-75.75' WHERE id=1281; -- Tesalia / Huila
      UPDATE sip_municipio SET latitud='2', longitud='-75.9166667' WHERE id=1314; -- Timaná / Huila
      UPDATE sip_municipio SET latitud='3.3333333', longitud='-75.1666667' WHERE id=1391; -- Villavieja / Huila
      UPDATE sip_municipio SET latitud='2.6666667', longitud='-75.5833333' WHERE id=1412; -- Yaguará / Huila
      UPDATE sip_municipio SET latitud='11.1597222', longitud='-72.5855556' WHERE id=602; -- Albania / La Guajira
      UPDATE sip_municipio SET latitud='11', longitud='-72.75' WHERE id=1257; -- Barrancas / La Guajira
      UPDATE sip_municipio SET latitud='11.2722222', longitud='-73.3055556' WHERE id=1452; -- Dibulla / La Guajira
      UPDATE sip_municipio SET latitud='10.8977778', longitud='-72.8869444' WHERE id=1461; -- Distracción / La Guajira
      UPDATE sip_municipio SET latitud='10.6533333', longitud='-72.9241667' WHERE id=110; -- El Molino / La Guajira
      UPDATE sip_municipio SET latitud='10.8333333', longitud='-72.8333333' WHERE id=481; -- Fonseca / La Guajira
      UPDATE sip_municipio SET latitud='11.0694444', longitud='-72.7669444' WHERE id=640; -- Hatonuevo / La Guajira
      UPDATE sip_municipio SET latitud='10.5166667', longitud='-73.0833333' WHERE id=728; -- La Jagua Del Pilar / La Guajira
      UPDATE sip_municipio SET latitud='11.3841667', longitud='-72.2441667' WHERE id=741; -- Maicao / La Guajira
      UPDATE sip_municipio SET latitud='11.7791667', longitud='-72.4494444' WHERE id=933; -- Manaure / La Guajira
      UPDATE sip_municipio SET latitud='11.5444444', longitud='-72.9072222' WHERE id=49; -- Riohacha / La Guajira
      UPDATE sip_municipio SET latitud='10.8333333', longitud='-73.0833333' WHERE id=1058; -- San Juan Del Cesar / La Guajira
      UPDATE sip_municipio SET latitud='11.9166667', longitud='-72' WHERE id=1361; -- Uribia / La Guajira
      UPDATE sip_municipio SET latitud='10.5666667', longitud='-73.0166667' WHERE id=1367; -- Urumita / La Guajira
      UPDATE sip_municipio SET latitud='10.5833333', longitud='-73' WHERE id=1398; -- Villanueva / La Guajira
      UPDATE sip_municipio SET latitud='10.1869444', longitud='-74.5752778' WHERE id=534; -- Algarrobo / Magdalena
      UPDATE sip_municipio SET latitud='10.5833333', longitud='-74' WHERE id=892; -- Aracataca / Magdalena
      UPDATE sip_municipio SET latitud='10.25', longitud='-74' WHERE id=962; -- Ariguaní / Magdalena
      UPDATE sip_municipio SET latitud='10.2912', longitud='-74.8071' WHERE id=236; -- Cerro De San Antonio / Magdalena
      UPDATE sip_municipio SET latitud='10.0280556', longitud='-74.6436111' WHERE id=254; -- Chivolo / Magdalena
      UPDATE sip_municipio SET latitud='10.8333333', longitud='-74.0833333' WHERE id=285; -- Ciénaga / Magdalena
      UPDATE sip_municipio SET latitud='9.8402778', longitud='-74.4447222' WHERE id=339; -- Concordia / Magdalena
      UPDATE sip_municipio SET latitud='9.0455556', longitud='-73.9747222' WHERE id=421; -- El Banco / Magdalena
      UPDATE sip_municipio SET latitud='10.3333333', longitud='-74.6666667' WHERE id=451; -- El Piñón / Magdalena
      UPDATE sip_municipio SET latitud='10.6166667', longitud='-74.2666667' WHERE id=467; -- El Retén / Magdalena
      UPDATE sip_municipio SET latitud='10.4166667', longitud='-73.9166667' WHERE id=492; -- Fundación / Magdalena
      UPDATE sip_municipio SET latitud='9.25', longitud='-74.1666667' WHERE id=564; -- Guamal / Magdalena
      UPDATE sip_municipio SET latitud='9.8030556', longitud='-74.3902778' WHERE id=778; -- Nueva Granada / Magdalena
      UPDATE sip_municipio SET latitud='10.1489', longitud='-74.8379' WHERE id=908; -- Pedraza / Magdalena
      UPDATE sip_municipio SET latitud='9.51708', longitud='-74.193938' WHERE id=913; -- Pijiño Del Carmen / Magdalena
      UPDATE sip_municipio SET latitud='10.4166667', longitud='-74.3333333' WHERE id=927; -- Pivijay / Magdalena
      UPDATE sip_municipio SET latitud='9.8333333', longitud='-74.3333333' WHERE id=931; -- Plato / Magdalena
      UPDATE sip_municipio SET latitud='10.9833333', longitud='-74.3333333' WHERE id=945; -- Puebloviejo / Magdalena
      UPDATE sip_municipio SET latitud='10.6666667', longitud='-74.5833333' WHERE id=1016; -- Remolino / Magdalena
      UPDATE sip_municipio SET latitud='10.033', longitud='-74.217' WHERE id=1070; -- Sabanas De San Ángel / Magdalena
      UPDATE sip_municipio SET latitud='10.5', longitud='-74.7' WHERE id=1105; -- Salamina / Magdalena
      UPDATE sip_municipio SET latitud='9.3333333', longitud='-74.3333333' WHERE id=1144; -- San Sebastián De Buenavista / Magdalena
      UPDATE sip_municipio SET latitud='9.3333333', longitud='-74.3' WHERE id=1177; -- San Zenón / Magdalena
      UPDATE sip_municipio SET latitud='9.3166667', longitud='-74.5833333' WHERE id=1179; -- Santa Ana / Magdalena
      UPDATE sip_municipio SET latitud='10.6', longitud='-74.167' WHERE id=1186; -- Santa Bárbara De Pinto / Magdalena
      UPDATE sip_municipio SET latitud='11.2472222', longitud='-74.2016667' WHERE id=52; -- Santa Marta / Magdalena
      UPDATE sip_municipio SET latitud='10.9166667', longitud='-74.5833333' WHERE id=1208; -- Sitionuevo / Magdalena
      UPDATE sip_municipio SET latitud='10', longitud='-74.6666667' WHERE id=1283; -- Tenerife / Magdalena
      UPDATE sip_municipio SET latitud='10.171', longitud='-74.719' WHERE id=1459; -- Zapayán / Magdalena
      UPDATE sip_municipio SET latitud='10.7654', longitud='-74.1387' WHERE id=1462; -- Zona Bananera / Magdalena
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-73.8333333' WHERE id=986; -- Acacías / Meta
      UPDATE sip_municipio SET latitud='4.5755556', longitud='-72.9611111' WHERE id=106; -- Barranca De Upía / Meta
      UPDATE sip_municipio SET latitud='4.2902778', longitud='-72.7905556' WHERE id=136; -- Cabuyaro / Meta
      UPDATE sip_municipio SET latitud='3.8', longitud='-73.5833333' WHERE id=216; -- Castilla La Nueva / Meta
      UPDATE sip_municipio SET latitud='3.7926072', longitud='-73.8392945' WHERE id=380; -- Cubarral / Meta
      UPDATE sip_municipio SET latitud='4.25', longitud='-73.3333333' WHERE id=387; -- Cumaral / Meta
      UPDATE sip_municipio SET latitud='4.4166667', longitud='-73.6666667' WHERE id=422; -- El Calvario / Meta
      UPDATE sip_municipio SET latitud='3.5680556', longitud='-73.7838889' WHERE id=444; -- El Castillo / Meta
      UPDATE sip_municipio SET latitud='2.7791667', longitud='-72.8719444' WHERE id=471; -- El Dorado / Meta
      UPDATE sip_municipio SET latitud='3.4594444', longitud='-73.6127778' WHERE id=490; -- Fuente De Oro / Meta
      UPDATE sip_municipio SET latitud='3.5386111', longitud='-73.7005556' WHERE id=556; -- Granada / Meta
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-74' WHERE id=565; -- Guamal / Meta
      UPDATE sip_municipio SET latitud='2.8536111', longitud='-73.9436111' WHERE id=605; -- La Macarena / Meta
      UPDATE sip_municipio SET latitud='3.5136111', longitud='-74.0516667' WHERE id=696; -- Lejanías / Meta
      UPDATE sip_municipio SET latitud='2.8911111', longitud='-72.1322222' WHERE id=584; -- Mapiripán / Meta
      UPDATE sip_municipio SET latitud='3.3780556', longitud='-74.0447222' WHERE id=589; -- Mesetas / Meta
      UPDATE sip_municipio SET latitud='2.6794444', longitud='-72.7608333' WHERE id=771; -- Puerto Concordia / Meta
      UPDATE sip_municipio SET latitud='4.3141667', longitud='-72.0825' WHERE id=941; -- Puerto Gaitán / Meta
      UPDATE sip_municipio SET latitud='3', longitud='-72.5' WHERE id=960; -- Puerto Lleras / Meta
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-72.9666667' WHERE id=954; -- Puerto López / Meta
      UPDATE sip_municipio SET latitud='2.9383333', longitud='-73.2083333' WHERE id=974; -- Puerto Rico / Meta
      UPDATE sip_municipio SET latitud='4.1666667', longitud='-73.4166667' WHERE id=1018; -- Restrepo / Meta
      UPDATE sip_municipio SET latitud='3.7122222', longitud='-73.2436111' WHERE id=1118; -- San Carlos De Guaroa / Meta
      UPDATE sip_municipio SET latitud='3.3463889', longitud='-73.8894444' WHERE id=1124; -- San Juan De Arama / Meta
      UPDATE sip_municipio SET latitud='4.4586111', longitud='-73.6730556' WHERE id=1130; -- San Juanito / Meta
      UPDATE sip_municipio SET latitud='3.7', longitud='-73.7' WHERE id=1139; -- San Martín / Meta
      UPDATE sip_municipio SET latitud='3.2012021', longitud='-74.3836594' WHERE id=630; -- Uribe / Meta
      UPDATE sip_municipio SET latitud='4.1533333', longitud='-73.635' WHERE id=57; -- Villavicencio / Meta
      UPDATE sip_municipio SET latitud='3.0863889', longitud='-73.7513889' WHERE id=1182; -- Vistahermosa / Meta
      UPDATE sip_municipio SET latitud='1.0963', longitud='-77.5686' WHERE id=287; -- Albán / Nariño
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-77.6833333' WHERE id=371; -- Aldana / Nariño
      UPDATE sip_municipio SET latitud='1.25', longitud='-77.5' WHERE id=614; -- Ancuya / Nariño
      UPDATE sip_municipio SET latitud='1.5033333', longitud='-77.0877778' WHERE id=861; -- Arboleda / Nariño
      UPDATE sip_municipio SET latitud='1.5833333', longitud='-78' WHERE id=1270; -- Barbacoas / Nariño
      UPDATE sip_municipio SET latitud='1.5975', longitud='-77.0175' WHERE id=1341; -- Belén / Nariño
      UPDATE sip_municipio SET latitud='1.25', longitud='-77.0833333' WHERE id=109; -- Buesaco / Nariño
      UPDATE sip_municipio SET latitud='1.35943053925138', longitud='-77.2836685180664' WHERE id=415; -- Chachagüí / Nariño
      UPDATE sip_municipio SET latitud='1.5833333', longitud='-77' WHERE id=336; -- Colón / Nariño
      UPDATE sip_municipio SET latitud='1.20840649727186', longitud='-77.4632263183594' WHERE id=346; -- Consacá / Nariño
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-77.5333333' WHERE id=356; -- Contadero / Nariño
      UPDATE sip_municipio SET latitud='0.7833333', longitud='-77.3333333' WHERE id=366; -- Córdoba / Nariño
      UPDATE sip_municipio SET latitud='0.8658333', longitud='-77.7294444' WHERE id=383; -- Cuaspud Carlosama / Nariño
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-77.9166667' WHERE id=390; -- Cumbal / Nariño
      UPDATE sip_municipio SET latitud='1.6533333', longitud='-77.5833333' WHERE id=400; -- Cumbitara / Nariño
      UPDATE sip_municipio SET latitud='2.3333333', longitud='-78.35' WHERE id=437; -- El Charco / Nariño
      UPDATE sip_municipio SET latitud='1.4333333', longitud='-77.4333333' WHERE id=445; -- El Peñol / Nariño
      UPDATE sip_municipio SET latitud='1.8333333', longitud='-77.3333333' WHERE id=448; -- El Rosario / Nariño
      UPDATE sip_municipio SET latitud='1.2991', longitud='-77.47585' WHERE id=452; -- El Tablón De Gómez / Nariño
      UPDATE sip_municipio SET latitud='1.4', longitud='-77.3333333' WHERE id=457; -- El Tambo / Nariño
      UPDATE sip_municipio SET latitud='2.1019444', longitud='-78.7216667' WHERE id=879; -- Francisco Pizarro / Nariño
      UPDATE sip_municipio SET latitud='0.95', longitud='-77.3333333' WHERE id=491; -- Funes / Nariño
      UPDATE sip_municipio SET latitud='1', longitud='-77.75' WHERE id=561; -- Guachucal / Nariño
      UPDATE sip_municipio SET latitud='1.15', longitud='-77.5' WHERE id=574; -- Guaitarilla / Nariño
      UPDATE sip_municipio SET latitud='0.8333333', longitud='-77.5833333' WHERE id=580; -- Gualmatán / Nariño
      UPDATE sip_municipio SET latitud='0.95', longitud='-77.5333333' WHERE id=607; -- Iles / Nariño
      UPDATE sip_municipio SET latitud='1.05', longitud='-77.5' WHERE id=609; -- Imués / Nariño
      UPDATE sip_municipio SET latitud='0.8302778', longitud='-77.6444444' WHERE id=611; -- Ipiales / Nariño
      UPDATE sip_municipio SET latitud='1.55', longitud='-76.8833333' WHERE id=642; -- La Cruz / Nariño
      UPDATE sip_municipio SET latitud='1.25', longitud='-77.4166667' WHERE id=647; -- La Florida / Nariño
      UPDATE sip_municipio SET latitud='1.4777778', longitud='-77.5838889' WHERE id=651; -- La Llanada / Nariño
      UPDATE sip_municipio SET latitud='2.4108333', longitud='-78.2427778' WHERE id=656; -- La Tola / Nariño
      UPDATE sip_municipio SET latitud='1.5833333', longitud='-77.0833333' WHERE id=664; -- La Unión / Nariño
      UPDATE sip_municipio SET latitud='1.9375', longitud='-77.3080556' WHERE id=704; -- Leiva / Nariño
      UPDATE sip_municipio SET latitud='1.3833333', longitud='-77.45' WHERE id=715; -- Linares / Nariño
      UPDATE sip_municipio SET latitud='1.5155556', longitud='-77.495' WHERE id=719; -- Los Andes / Nariño
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-77.8333333' WHERE id=735; -- Magüí / Nariño
      UPDATE sip_municipio SET latitud='1.0833333', longitud='-77.8166667' WHERE id=748; -- Mallama / Nariño
      UPDATE sip_municipio SET latitud='2.35', longitud='-78.35' WHERE id=795; -- Mosquera / Nariño
      UPDATE sip_municipio SET latitud='1.5', longitud='-78' WHERE id=802; -- Nariño / Nariño
      UPDATE sip_municipio SET latitud='1.2666667', longitud='-77.4833333' WHERE id=813; -- Olaya Herrera / Nariño
      UPDATE sip_municipio SET latitud='1.0333333', longitud='-77.55' WHERE id=856; -- Ospina / Nariño
      UPDATE sip_municipio SET latitud='1.21467073681653', longitud='-77.2786474227905' WHERE id=44; -- Pasto / Nariño
      UPDATE sip_municipio SET latitud='1.6316667', longitud='-77.4616667' WHERE id=906; -- Policarpa / Nariño
      UPDATE sip_municipio SET latitud='0.75', longitud='-77.4166667' WHERE id=935; -- Potosí / Nariño
      UPDATE sip_municipio SET latitud='1.5702778', longitud='-77.4694444' WHERE id=939; -- Providencia / Nariño
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-77.25' WHERE id=951; -- Puerres / Nariño
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-77.6666667' WHERE id=969; -- Pupiales / Nariño
      UPDATE sip_municipio SET latitud='1.1666667', longitud='-78.1666667' WHERE id=1023; -- Ricaurte / Nariño
      UPDATE sip_municipio SET latitud='1.9166667', longitud='-78.3333333' WHERE id=1036; -- Roberto Payán / Nariño
      UPDATE sip_municipio SET latitud='1.4166667', longitud='-77.6666667' WHERE id=1111; -- Samaniego / Nariño
      UPDATE sip_municipio SET latitud='2.42232', longitud='-78.45755' WHERE id=1345; -- San Andrés De Tumaco / Nariño
      UPDATE sip_municipio SET latitud='1.5163889', longitud='-77.0466667' WHERE id=1128; -- San Bernardo / Nariño
      UPDATE sip_municipio SET latitud='1.5', longitud='-77.1666667' WHERE id=1136; -- San Lorenzo / Nariño
      UPDATE sip_municipio SET latitud='1.6666667', longitud='-76.9166667' WHERE id=1145; -- San Pablo / Nariño
      UPDATE sip_municipio SET latitud='1.5613889', longitud='-77.1180556' WHERE id=1148; -- San Pedro De Cartago / Nariño
      UPDATE sip_municipio SET latitud='1.25', longitud='-77.45' WHERE id=1125; -- Sandoná / Nariño
      UPDATE sip_municipio SET latitud='1.26604', longitud='-77.40935' WHERE id=1149; -- Santa Bárbara / Nariño
      UPDATE sip_municipio SET latitud='1.2247222', longitud='-77.68' WHERE id=1153; -- Santacruz / Nariño
      UPDATE sip_municipio SET latitud='1.0333333', longitud='-77.6' WHERE id=1188; -- Sapuyes / Nariño
      UPDATE sip_municipio SET latitud='1.5833333', longitud='-77.25' WHERE id=1265; -- Taminango / Nariño
      UPDATE sip_municipio SET latitud='1.0833333', longitud='-77.3' WHERE id=1268; -- Tangua / Nariño
      UPDATE sip_municipio SET latitud='1.1666667', longitud='-77.5833333' WHERE id=1351; -- Túquerres / Nariño
      UPDATE sip_municipio SET latitud='1.0833333', longitud='-77.4166667' WHERE id=1411; -- Yacuanquer / Nariño
      UPDATE sip_municipio SET latitud='8', longitud='-73.2' WHERE id=533; -- Ábrego / Norte de Santander
      UPDATE sip_municipio SET latitud='7.6666667', longitud='-72.75' WHERE id=862; -- Arboledas / Norte de Santander
      UPDATE sip_municipio SET latitud='7.6666667', longitud='-72.5833333' WHERE id=1463; -- Bochalema / Norte de Santander
      UPDATE sip_municipio SET latitud='8.0833333', longitud='-73' WHERE id=85; -- Bucarasica / Norte de Santander
      UPDATE sip_municipio SET latitud='7.75', longitud='-73.1666667' WHERE id=144; -- Cáchira / Norte de Santander
      UPDATE sip_municipio SET latitud='7.25', longitud='-72.5833333' WHERE id=140; -- Cácota / Norte de Santander
      UPDATE sip_municipio SET latitud='7.75', longitud='-72.55' WHERE id=258; -- Chinácota / Norte de Santander
      UPDATE sip_municipio SET latitud='7.1666667', longitud='-72.5833333' WHERE id=260; -- Chitagá / Norte de Santander
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-73.2' WHERE id=344; -- Convención / Norte de Santander
      UPDATE sip_municipio SET latitud='7.5', longitud='-72.75' WHERE id=382; -- Cucutilla / Norte de Santander
      UPDATE sip_municipio SET latitud='7.75', longitud='-72.6333333' WHERE id=411; -- Durania / Norte de Santander
      UPDATE sip_municipio SET latitud='8.75', longitud='-73.3333333' WHERE id=424; -- El Carmen / Norte de Santander
      UPDATE sip_municipio SET latitud='8.5847222', longitud='-73.0883333' WHERE id=442; -- El Tarra / Norte de Santander
      UPDATE sip_municipio SET latitud='7.9355556', longitud='-72.605' WHERE id=458; -- El Zulia / Norte de Santander
      UPDATE sip_municipio SET latitud='7.9166667', longitud='-72.75' WHERE id=554; -- Gramalote / Norte de Santander
      UPDATE sip_municipio SET latitud='8.5', longitud='-73.0833333' WHERE id=595; -- Hacarí / Norte de Santander
      UPDATE sip_municipio SET latitud='7.5', longitud='-72.4666667' WHERE id=598; -- Herrán / Norte de Santander
      UPDATE sip_municipio SET latitud='8.1666667', longitud='-72.4666667' WHERE id=650; -- La Esperanza / Norte de Santander
      UPDATE sip_municipio SET latitud='8.25', longitud='-73.1666667' WHERE id=663; -- La Playa / Norte de Santander
      UPDATE sip_municipio SET latitud='7.3333333', longitud='-72.5' WHERE id=638; -- Labateca / Norte de Santander
      UPDATE sip_municipio SET latitud='7.8383333', longitud='-72.5133333' WHERE id=705; -- Los Patios / Norte de Santander
      UPDATE sip_municipio SET latitud='7.9666667', longitud='-72.8333333' WHERE id=722; -- Lourdes / Norte de Santander
      UPDATE sip_municipio SET latitud='7.3333333', longitud='-72.7166667' WHERE id=800; -- Mutiscua / Norte de Santander
      UPDATE sip_municipio SET latitud='8.25', longitud='-73.3' WHERE id=823; -- Ocaña / Norte de Santander
      UPDATE sip_municipio SET latitud='7.3780556', longitud='-72.6525' WHERE id=877; -- Pamplona / Norte de Santander
      UPDATE sip_municipio SET latitud='7.5', longitud='-72.5833333' WHERE id=883; -- Pamplonita / Norte de Santander
      UPDATE sip_municipio SET latitud='8.3636111', longitud='-72.4075' WHERE id=928; -- Puerto Santander / Norte de Santander
      UPDATE sip_municipio SET latitud='7.5833333', longitud='-72.5' WHERE id=984; -- Ragonvalia / Norte de Santander
      UPDATE sip_municipio SET latitud='7.8', longitud='-72.8333333' WHERE id=1073; -- Salazar / Norte de Santander
      UPDATE sip_municipio SET latitud='8.75', longitud='-73.0333333' WHERE id=1094; -- San Calixto / Norte de Santander
      UPDATE sip_municipio SET latitud='7.8833333', longitud='-72.5833333' WHERE id=1101; -- San Cayetano / Norte de Santander
      UPDATE sip_municipio SET latitud='7.8833333', longitud='-72.5052778' WHERE id=32; -- San José De Cúcuta / Norte de Santander
      UPDATE sip_municipio SET latitud='7.9166667', longitud='-72.6666667' WHERE id=1119; -- Santiago / Norte de Santander
      UPDATE sip_municipio SET latitud='8.25', longitud='-72.75' WHERE id=1189; -- Sardinata / Norte de Santander
      UPDATE sip_municipio SET latitud='7.2', longitud='-72.75' WHERE id=1201; -- Silos / Norte de Santander
      UPDATE sip_municipio SET latitud='8.75', longitud='-73.1666667' WHERE id=1306; -- Teorama / Norte de Santander
      UPDATE sip_municipio SET latitud='8.6480556', longitud='-72.7394444' WHERE id=1320; -- Tibú / Norte de Santander
      UPDATE sip_municipio SET latitud='7.3', longitud='-72.25' WHERE id=1330; -- Toledo / Norte de Santander
      UPDATE sip_municipio SET latitud='7.9169444', longitud='-72.9763889' WHERE id=1388; -- Villa Caro / Norte de Santander
      UPDATE sip_municipio SET latitud='7.8338889', longitud='-72.4741667' WHERE id=1397; -- Villa Del Rosario / Norte de Santander
      UPDATE sip_municipio SET latitud='1.1936111', longitud='-76.9769444' WHERE id=370; -- Colón / Putumayo
      UPDATE sip_municipio SET latitud='1.1488889', longitud='-76.6477778' WHERE id=40; -- Mocoa / Putumayo
      UPDATE sip_municipio SET latitud='0.6966667', longitud='-76.8747222' WHERE id=575; -- Orito / Putumayo
      UPDATE sip_municipio SET latitud='0.5158333', longitud='-76.495' WHERE id=940; -- Puerto Asís / Putumayo
      UPDATE sip_municipio SET latitud='0.6838889', longitud='-76.5858333' WHERE id=942; -- Puerto Caicedo / Putumayo
      UPDATE sip_municipio SET latitud='0.9702778', longitud='-76.5858333' WHERE id=946; -- Puerto Guzmán / Putumayo
      UPDATE sip_municipio SET latitud='-0.2', longitud='-74.7666667' WHERE id=953; -- Puerto Leguízamo / Putumayo
      UPDATE sip_municipio SET latitud='1.1772222', longitud='-76.8830556' WHERE id=1217; -- San Francisco / Putumayo
      UPDATE sip_municipio SET latitud='0.3394444', longitud='-76.8830556' WHERE id=1222; -- San Miguel / Putumayo
      UPDATE sip_municipio SET latitud='1.1511111', longitud='-77.0075' WHERE id=1228; -- Santiago / Putumayo
      UPDATE sip_municipio SET latitud='1.1833333', longitud='-76.9166667' WHERE id=1209; -- Sibundoy / Putumayo
      UPDATE sip_municipio SET latitud='0.4525', longitud='-76.9191667' WHERE id=1381; -- Valle Del Guamuez / Putumayo
      UPDATE sip_municipio SET latitud='1.038', longitud='-76.627' WHERE id=1409; -- Villagarzón / Putumayo
      UPDATE sip_municipio SET latitud='4.5338889', longitud='-75.6811111' WHERE id=19; -- Armenia / Quindío
      UPDATE sip_municipio SET latitud='4.3622222', longitud='-75.7394444' WHERE id=111; -- Buenavista / Quindío
      UPDATE sip_municipio SET latitud='4.5325', longitud='-75.6436111' WHERE id=165; -- Calarcá / Quindío
      UPDATE sip_municipio SET latitud='4.6166667', longitud='-75.6333333' WHERE id=297; -- Circasia / Quindío
      UPDATE sip_municipio SET latitud='4.3905556', longitud='-75.6888889' WHERE id=362; -- Córdoba / Quindío
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-75.6333333' WHERE id=475; -- Filandia / Quindío
      UPDATE sip_municipio SET latitud='4.25', longitud='-75.6666667' WHERE id=543; -- Génova / Quindío
      UPDATE sip_municipio SET latitud='4.45', longitud='-75.8' WHERE id=698; -- La Tebaida / Quindío
      UPDATE sip_municipio SET latitud='4.5', longitud='-75.8' WHERE id=790; -- Montenegro / Quindío
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-75.6666667' WHERE id=917; -- Pijao / Quindío
      UPDATE sip_municipio SET latitud='4.6333333', longitud='-75.75' WHERE id=980; -- Quimbaya / Quindío
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-75.5' WHERE id=1141; -- Salento / Quindío
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-76' WHERE id=767; -- Apía / Risaralda
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-75.95' WHERE id=1212; -- Balboa / Risaralda
      UPDATE sip_municipio SET latitud='5.25', longitud='-75.9166667' WHERE id=1405; -- Belén De Umbría / Risaralda
      UPDATE sip_municipio SET latitud='4.8347222', longitud='-75.6725' WHERE id=255; -- Dosquebradas / Risaralda
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-75.8333333' WHERE id=568; -- Guática / Risaralda
      UPDATE sip_municipio SET latitud='4.9666667', longitud='-76' WHERE id=648; -- La Celia / Risaralda
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-75.8333333' WHERE id=695; -- La Virginia / Risaralda
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-75.75' WHERE id=755; -- Marsella / Risaralda
      UPDATE sip_municipio SET latitud='5.4166667', longitud='-76' WHERE id=774; -- Mistrató / Risaralda
      UPDATE sip_municipio SET latitud='4.8133333', longitud='-75.6961111' WHERE id=45; -- Pereira / Risaralda
      UPDATE sip_municipio SET latitud='5.25', longitud='-76.1666667' WHERE id=947; -- Pueblo Rico / Risaralda
      UPDATE sip_municipio SET latitud='5.3333333', longitud='-75.6666667' WHERE id=981; -- Quinchía / Risaralda
      UPDATE sip_municipio SET latitud='4.8680556', longitud='-75.6213889' WHERE id=1123; -- Santa Rosa De Cabal / Risaralda
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-76' WHERE id=1137; -- Santuario / Risaralda
      UPDATE sip_municipio SET latitud='6.25', longitud='-73.4666667' WHERE id=147; -- Aguada / Santander
      UPDATE sip_municipio SET latitud='5.8333333', longitud='-73.75' WHERE id=324; -- Albania / Santander
      UPDATE sip_municipio SET latitud='6.8333333', longitud='-72.9666667' WHERE id=860; -- Aratoca / Santander
      UPDATE sip_municipio SET latitud='6', longitud='-73.55' WHERE id=1238; -- Barbosa / Santander
      UPDATE sip_municipio SET latitud='6.75', longitud='-73.1666667' WHERE id=1272; -- Barichara / Santander
      UPDATE sip_municipio SET latitud='7.0652778', longitud='-73.8547222' WHERE id=1319; -- Barrancabermeja / Santander
      UPDATE sip_municipio SET latitud='7.0833333', longitud='-73.3333333' WHERE id=1454; -- Betulia / Santander
      UPDATE sip_municipio SET latitud='6.25', longitud='-74' WHERE id=80; -- Bolívar / Santander
      UPDATE sip_municipio SET latitud='7.1297222', longitud='-73.1258333' WHERE id=27; -- Bucaramanga / Santander
      UPDATE sip_municipio SET latitud='6.6333333', longitud='-73.2' WHERE id=133; -- Cabrera / Santander
      UPDATE sip_municipio SET latitud='7.4166667', longitud='-72.85' WHERE id=168; -- California / Santander
      UPDATE sip_municipio SET latitud='6.6', longitud='-72.6333333' WHERE id=195; -- Capitanejo / Santander
      UPDATE sip_municipio SET latitud='6.8333333', longitud='-72.5' WHERE id=219; -- Carcasí / Santander
      UPDATE sip_municipio SET latitud='6.8333333', longitud='-72.9166667' WHERE id=233; -- Cepitá / Santander
      UPDATE sip_municipio SET latitud='7', longitud='-72.5833333' WHERE id=239; -- Cerrito / Santander
      UPDATE sip_municipio SET latitud='6.25', longitud='-73.0833333' WHERE id=241; -- Charalá / Santander
      UPDATE sip_municipio SET latitud='7.3', longitud='-72.9666667' WHERE id=245; -- Charta / Santander
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-73.3333333' WHERE id=263; -- Chima / Santander
      UPDATE sip_municipio SET latitud='6.1333333', longitud='-73.55' WHERE id=267; -- Chipatá / Santander
      UPDATE sip_municipio SET latitud='6.3161111', longitud='-73.9505556' WHERE id=296; -- Cimitarra / Santander
      UPDATE sip_municipio SET latitud='6.9166667', longitud='-72.5' WHERE id=345; -- Concepción / Santander
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-73.1666667' WHERE id=348; -- Confines / Santander
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-73.4166667' WHERE id=357; -- Contratación / Santander
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-73' WHERE id=367; -- Coromoro / Santander
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-73' WHERE id=392; -- Curití / Santander
      UPDATE sip_municipio SET latitud='6', longitud='-73.511' WHERE id=404; -- El Carmen De Chucurí / Santander
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-73.4666667' WHERE id=426; -- El Guacamayo / Santander
      UPDATE sip_municipio SET latitud='6.55', longitud='-72.8333333' WHERE id=441; -- El Peñón / Santander
      UPDATE sip_municipio SET latitud='7.4766667', longitud='-73.2080556' WHERE id=446; -- El Playón / Santander
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-73' WHERE id=461; -- Encino / Santander
      UPDATE sip_municipio SET latitud='6.75', longitud='-72.6333333' WHERE id=464; -- Enciso / Santander
      UPDATE sip_municipio SET latitud='5.8047222', longitud='-73.9741667' WHERE id=473; -- Florián / Santander
      UPDATE sip_municipio SET latitud='7.0647222', longitud='-73.0897222' WHERE id=480; -- Floridablanca / Santander
      UPDATE sip_municipio SET latitud='6.7', longitud='-73.3' WHERE id=503; -- Galán / Santander
      UPDATE sip_municipio SET latitud='6', longitud='-73.25' WHERE id=507; -- Gámbita / Santander
      UPDATE sip_municipio SET latitud='7.049716', longitud='-73.2906' WHERE id=548; -- Girón / Santander
      UPDATE sip_municipio SET latitud='7', longitud='-72.7666667' WHERE id=562; -- Guaca / Santander
      UPDATE sip_municipio SET latitud='6.3', longitud='-73.3333333' WHERE id=572; -- Guadalupe / Santander
      UPDATE sip_municipio SET latitud='6.3833333', longitud='-73.25' WHERE id=577; -- Guapotá / Santander
      UPDATE sip_municipio SET latitud='6', longitud='-73.65' WHERE id=582; -- Guavatá / Santander
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-73.5' WHERE id=587; -- Güepsa / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-73.3333333' WHERE id=596; -- Hato / Santander
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-73.8333333' WHERE id=628; -- Jesús María / Santander
      UPDATE sip_municipio SET latitud='6.75', longitud='-73.0666667' WHERE id=629; -- Jordán / Santander
      UPDATE sip_municipio SET latitud='5.8613889', longitud='-73.9683333' WHERE id=635; -- La Belleza / Santander
      UPDATE sip_municipio SET latitud='6.25', longitud='-73.4666667' WHERE id=660; -- La Paz / Santander
      UPDATE sip_municipio SET latitud='6.2238889', longitud='-73.8127778' WHERE id=652; -- Landázuri / Santander
      UPDATE sip_municipio SET latitud='7.4166667', longitud='-73.4166667' WHERE id=706; -- Lebrija / Santander
      UPDATE sip_municipio SET latitud='6.9166667', longitud='-73.0833333' WHERE id=721; -- Los Santos / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-72.5333333' WHERE id=731; -- Macaravita / Santander
      UPDATE sip_municipio SET latitud='6.7833333', longitud='-72.6666667' WHERE id=744; -- Málaga / Santander
      UPDATE sip_municipio SET latitud='7.4166667', longitud='-73.0833333' WHERE id=763; -- Matanza / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-72.9166667' WHERE id=780; -- Mogotes / Santander
      UPDATE sip_municipio SET latitud='6.75', longitud='-72.75' WHERE id=786; -- Molagavita / Santander
      UPDATE sip_municipio SET latitud='6.4166667', longitud='-73.0833333' WHERE id=822; -- Ocamonte / Santander
      UPDATE sip_municipio SET latitud='6.3', longitud='-73.25' WHERE id=850; -- Oiba / Santander
      UPDATE sip_municipio SET latitud='6.3333333', longitud='-72.75' WHERE id=853; -- Onzaga / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-73.25' WHERE id=884; -- Palmar / Santander
      UPDATE sip_municipio SET latitud='6.45', longitud='-73.25' WHERE id=890; -- Palmas Del Socorro / Santander
      UPDATE sip_municipio SET latitud='6.5', longitud='-73.1333333' WHERE id=901; -- Páramo / Santander
      UPDATE sip_municipio SET latitud='5.8383333', longitud='-74.0366667' WHERE id=914; -- Piedecuesta / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-73.1666667' WHERE id=919; -- Pinchote / Santander
      UPDATE sip_municipio SET latitud='5.9166667', longitud='-73.5833333' WHERE id=948; -- Puente Nacional / Santander
      UPDATE sip_municipio SET latitud='6.6516667', longitud='-74.0608333' WHERE id=955; -- Puerto Parra / Santander
      UPDATE sip_municipio SET latitud='7.5833333', longitud='-73.6666667' WHERE id=958; -- Puerto Wilches / Santander
      UPDATE sip_municipio SET latitud='7.2191667', longitud='-73.1558333' WHERE id=1027; -- Rionegro / Santander
      UPDATE sip_municipio SET latitud='7.3980556', longitud='-73.4969444' WHERE id=1063; -- Sabana De Torres / Santander
      UPDATE sip_municipio SET latitud='6.8178', longitud='-72.82067' WHERE id=1090; -- San Andrés / Santander
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-73.4666667' WHERE id=1100; -- San Benito / Santander
      UPDATE sip_municipio SET latitud='6.5833333', longitud='-73.0833333' WHERE id=1115; -- San Gil / Santander
      UPDATE sip_municipio SET latitud='6.4333333', longitud='-72.8666667' WHERE id=1121; -- San Joaquín / Santander
      UPDATE sip_municipio SET latitud='6.6666667', longitud='-72.55' WHERE id=1127; -- San José De Miranda / Santander
      UPDATE sip_municipio SET latitud='6.7', longitud='-72.6666667' WHERE id=1131; -- San Miguel / Santander
      UPDATE sip_municipio SET latitud='6.8836111', longitud='-73.4138889' WHERE id=1140; -- San Vicente De Chucurí / Santander
      UPDATE sip_municipio SET latitud='6.9927778', longitud='-72.9102778' WHERE id=1178; -- Santa Bárbara / Santander
      UPDATE sip_municipio SET latitud='6.3375', longitud='-73.5919444' WHERE id=1187; -- Santa Helena Del Opón / Santander
      UPDATE sip_municipio SET latitud='6.4472222', longitud='-73.3413889' WHERE id=1205; -- Simacota / Santander
      UPDATE sip_municipio SET latitud='6.5333333', longitud='-73.2' WHERE id=1218; -- Socorro / Santander
      UPDATE sip_municipio SET latitud='6.1666667', longitud='-73.3' WHERE id=1240; -- Suaita / Santander
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-73.9166667' WHERE id=1247; -- Sucre / Santander
      UPDATE sip_municipio SET latitud='7.5', longitud='-72.9666667' WHERE id=1258; -- Suratá / Santander
      UPDATE sip_municipio SET latitud='7.25', longitud='-72.9' WHERE id=1332; -- Tona / Santander
      UPDATE sip_municipio SET latitud='6.5', longitud='-73.0666667' WHERE id=1369; -- Valle De San José / Santander
      UPDATE sip_municipio SET latitud='6.0833333', longitud='-73.5833333' WHERE id=1378; -- Vélez / Santander
      UPDATE sip_municipio SET latitud='7.3333333', longitud='-72.8666667' WHERE id=1382; -- Vetas / Santander
      UPDATE sip_municipio SET latitud='6.6741667', longitud='-73.1777778' WHERE id=1390; -- Villanueva / Santander
      UPDATE sip_municipio SET latitud='6.8333333', longitud='-73.25' WHERE id=1425; -- Zapatoca / Santander
      UPDATE sip_municipio SET latitud='9.3222222', longitud='-74.9772222' WHERE id=107; -- Buenavista / Sucre
      UPDATE sip_municipio SET latitud='8.8333333', longitud='-75.1666667' WHERE id=137; -- Caimito / Sucre
      UPDATE sip_municipio SET latitud='9.5491667', longitud='-75.3161111' WHERE id=396; -- Chalán / Sucre
      UPDATE sip_municipio SET latitud='9.4966667', longitud='-75.3555556' WHERE id=337; -- Colosó / Sucre
      UPDATE sip_municipio SET latitud='9.3333333', longitud='-75.25' WHERE id=364; -- Corozal / Sucre
      UPDATE sip_municipio SET latitud='9.4166667', longitud='-75.7' WHERE id=378; -- Coveñas / Sucre
      UPDATE sip_municipio SET latitud='9.1', longitud='-75.2' WHERE id=402; -- El Roble / Sucre
      UPDATE sip_municipio SET latitud='9.1630556', longitud='-75.0525' WHERE id=405; -- Galeras / Sucre
      UPDATE sip_municipio SET latitud='8.4697222', longitud='-75.5383333' WHERE id=463; -- Guaranda / Sucre
      UPDATE sip_municipio SET latitud='8.8605556', longitud='-75.2805556' WHERE id=693; -- La Unión / Sucre
      UPDATE sip_municipio SET latitud='9.3811111', longitud='-75.2713889' WHERE id=720; -- Los Palmitos / Sucre
      UPDATE sip_municipio SET latitud='8.5', longitud='-74.6666667' WHERE id=736; -- Majagual / Sucre
      UPDATE sip_municipio SET latitud='9.4166667', longitud='-75.3333333' WHERE id=793; -- Morroa / Sucre
      UPDATE sip_municipio SET latitud='9.5', longitud='-75.1666667' WHERE id=859; -- Ovejas / Sucre
      UPDATE sip_municipio SET latitud='9.3333333', longitud='-75.55' WHERE id=886; -- Palmito / Sucre
      UPDATE sip_municipio SET latitud='9.1666667', longitud='-75.3' WHERE id=1092; -- Sampués / Sucre
      UPDATE sip_municipio SET latitud='8.75', longitud='-74.9166667' WHERE id=1112; -- San Benito Abad / Sucre
      UPDATE sip_municipio SET latitud='9.5034', longitud='-75.45031' WHERE id=1336; -- San José De Toluviejo / Sucre
      UPDATE sip_municipio SET latitud='9.2755556', longitud='-75.2455556' WHERE id=1176; -- San Juan De Betulia / Sucre
      UPDATE sip_municipio SET latitud='9.2513', longitud='-75.07366' WHERE id=1200; -- San Luis De Sincé / Sucre
      UPDATE sip_municipio SET latitud='8.5833333', longitud='-75.1666667' WHERE id=1180; -- San Marcos / Sucre
      UPDATE sip_municipio SET latitud='9.8333333', longitud='-75.5' WHERE id=1183; -- San Onofre / Sucre
      UPDATE sip_municipio SET latitud='9.4166667', longitud='-75' WHERE id=1184; -- San Pedro / Sucre
      UPDATE sip_municipio SET latitud='9.5304', longitud='-75.5303' WHERE id=1331; -- Santiago De Tolú / Sucre
      UPDATE sip_municipio SET latitud='9.3047222', longitud='-75.3977778' WHERE id=53; -- Sincelejo / Sucre
      UPDATE sip_municipio SET latitud='9', longitud='-75' WHERE id=1244; -- Sucre / Sucre
      UPDATE sip_municipio SET latitud='3.4166667', longitud='-74.9166667' WHERE id=412; -- Alpujarra / Tolima
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-75' WHERE id=454; -- Alvarado / Tolima
      UPDATE sip_municipio SET latitud='4.8333333', longitud='-74.8333333' WHERE id=537; -- Ambalema / Tolima
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-75.25' WHERE id=737; -- Anzoátegui / Tolima
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-74.8333333' WHERE id=923; -- Armero / Tolima
      UPDATE sip_municipio SET latitud='3.3333333', longitud='-75.6666667' WHERE id=1091; -- Ataco / Tolima
      UPDATE sip_municipio SET latitud='4.4166667', longitud='-75.5' WHERE id=138; -- Cajamarca / Tolima
      UPDATE sip_municipio SET latitud='4.15', longitud='-74.7333333' WHERE id=199; -- Carmen De Apicalá / Tolima
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-75.1666667' WHERE id=220; -- Casabianca / Tolima
      UPDATE sip_municipio SET latitud='3.75', longitud='-75.5833333' WHERE id=243; -- Chaparral / Tolima
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-74.9166667' WHERE id=333; -- Coello / Tolima
      UPDATE sip_municipio SET latitud='3.8333333', longitud='-75.0833333' WHERE id=368; -- Coyaima / Tolima
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-74.6666667' WHERE id=388; -- Cunday / Tolima
      UPDATE sip_municipio SET latitud='3.6666667', longitud='-74.75' WHERE id=407; -- Dolores / Tolima
      UPDATE sip_municipio SET latitud='4.2', longitud='-74.8333333' WHERE id=468; -- Espinal / Tolima
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-75' WHERE id=472; -- Falan / Tolima
      UPDATE sip_municipio SET latitud='4.25', longitud='-74.8333333' WHERE id=477; -- Flandes / Tolima
      UPDATE sip_municipio SET latitud='5.1666667', longitud='-75.0833333' WHERE id=487; -- Fresno / Tolima
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-74.9166667' WHERE id=570; -- Guamo / Tolima
      UPDATE sip_municipio SET latitud='5.0833333', longitud='-75.1666667' WHERE id=599; -- Herveo / Tolima
      UPDATE sip_municipio SET latitud='5.25', longitud='-74.8333333' WHERE id=601; -- Honda / Tolima
      UPDATE sip_municipio SET latitud='4.4388889', longitud='-75.2322222' WHERE id=34; -- Ibagué / Tolima
      UPDATE sip_municipio SET latitud='4.1666667', longitud='-74.55' WHERE id=606; -- Icononzo / Tolima
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-74.9166667' WHERE id=710; -- Lérida / Tolima
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-75.1666667' WHERE id=716; -- Líbano / Tolima
      UPDATE sip_municipio SET latitud='4.25', longitud='-74.5833333' WHERE id=765; -- Melgar / Tolima
      UPDATE sip_municipio SET latitud='4.8769444', longitud='-75.1738889' WHERE id=779; -- Murillo / Tolima
      UPDATE sip_municipio SET latitud='3.5833333', longitud='-75.0833333' WHERE id=805; -- Natagaima / Tolima
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-75.25' WHERE id=855; -- Ortega / Tolima
      UPDATE sip_municipio SET latitud='5.1333333', longitud='-75.0333333' WHERE id=882; -- Palocabildo / Tolima
      UPDATE sip_municipio SET latitud='4.5', longitud='-74.9166667' WHERE id=915; -- Piedras / Tolima
      UPDATE sip_municipio SET latitud='3.25', longitud='-75.75' WHERE id=929; -- Planadas / Tolima
      UPDATE sip_municipio SET latitud='3.75', longitud='-74.8333333' WHERE id=937; -- Prado / Tolima
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-74.9166667' WHERE id=971; -- Purificación / Tolima
      UPDATE sip_municipio SET latitud='3.5', longitud='-75.8333333' WHERE id=1030; -- Rioblanco / Tolima
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-75.5833333' WHERE id=1039; -- Roncesvalles / Tolima
      UPDATE sip_municipio SET latitud='4.25', longitud='-75.3333333' WHERE id=1041; -- Rovira / Tolima
      UPDATE sip_municipio SET latitud='3.9347222', longitud='-75.0202778' WHERE id=1098; -- Saldaña / Tolima
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-75.5' WHERE id=1106; -- San Antonio / Tolima
      UPDATE sip_municipio SET latitud='4.1666667', longitud='-75.0833333' WHERE id=1114; -- San Luis / Tolima
      UPDATE sip_municipio SET latitud='5.22718', longitud='-74.89832' WHERE id=761; -- San Sebastián De Mariquita / Tolima
      UPDATE sip_municipio SET latitud='4.75', longitud='-75.1666667' WHERE id=1133; -- Santa Isabel / Tolima
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-74.7833333' WHERE id=1243; -- Suárez / Tolima
      UPDATE sip_municipio SET latitud='4.25', longitud='-75.1666667' WHERE id=1366; -- Valle De San Juan / Tolima
      UPDATE sip_municipio SET latitud='4.75', longitud='-74.9166667' WHERE id=1375; -- Venadillo / Tolima
      UPDATE sip_municipio SET latitud='5', longitud='-75.1666667' WHERE id=1387; -- Villahermosa / Tolima
      UPDATE sip_municipio SET latitud='4', longitud='-74.5833333' WHERE id=1396; -- Villarrica / Tolima
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-75.75' WHERE id=325; -- Alcalá / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.1741667', longitud='-76.1702778' WHERE id=615; -- Andalucía / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.7972222', longitud='-75.995' WHERE id=711; -- Ansermanuevo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.7', longitud='-76.1333333' WHERE id=905; -- Argelia / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.3333333', longitud='-76.3333333' WHERE id=78; -- Bolívar / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.8933333', longitud='-77.0697222' WHERE id=86; -- Buenaventura / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.2094444', longitud='-76.1602778' WHERE id=113; -- Bugalagrande / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.33365917459535', longitud='-75.8342456817627' WHERE id=134; -- Caicedonia / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.4372222', longitud='-76.5225' WHERE id=28; -- Cali / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-76.6666667' WHERE id=143; -- Calima / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.4130556', longitud='-76.3511111' WHERE id=166; -- Candelaria / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.7463889', longitud='-75.9116667' WHERE id=197; -- Cartago / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.6602778', longitud='-76.6927778' WHERE id=401; -- Dagua / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.9166667', longitud='-76.0833333' WHERE id=417; -- El Águila / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.75', longitud='-76.25' WHERE id=427; -- El Cairo / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.6666667', longitud='-76.1666667' WHERE id=429; -- El Cerrito / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.5', longitud='-76.25' WHERE id=438; -- El Dovio / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.3275', longitud='-76.2386111' WHERE id=478; -- Florida / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.75', longitud='-76.1666667' WHERE id=545; -- Ginebra / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.7694444', longitud='-76.3380556' WHERE id=563; -- Guacarí / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.9022222', longitud='-76.3027778' WHERE id=112; -- Guadalajara De Buga / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.1666667', longitud='-76.5833333' WHERE id=622; -- Jamundí / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.64952', longitud='-76.56845' WHERE id=637; -- La Cumbre / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.5358333', longitud='-76.1066667' WHERE id=694; -- La Unión / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.5238889', longitud='-76.0411111' WHERE id=702; -- La Victoria / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.5833333', longitud='-75.9166667' WHERE id=821; -- Obando / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.5394444', longitud='-76.3036111' WHERE id=881; -- Palmira / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.4211111', longitud='-76.2447222' WHERE id=936; -- Pradera / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.7833333', longitud='-76.5' WHERE id=1019; -- Restrepo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.0833333', longitud='-76.3333333' WHERE id=1031; -- Riofrío / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.4147222', longitud='-76.1547222' WHERE id=1038; -- Roldanillo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4', longitud='-76.1666667' WHERE id=1096; -- San Pedro / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.2688889', longitud='-75.9361111' WHERE id=1196; -- Sevilla / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.6116667', longitud='-76.0813889' WHERE id=1338; -- Toro / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.25', longitud='-76.3333333' WHERE id=1340; -- Trujillo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.0866667', longitud='-76.2' WHERE id=1344; -- Tuluá / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.7166667', longitud='-75.75' WHERE id=1358; -- Ulloa / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.6666667', longitud='-76.25' WHERE id=1380; -- Versalles / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.6986111', longitud='-76.4491667' WHERE id=1385; -- Vijes / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.9166667', longitud='-76.3333333' WHERE id=1421; -- Yotoco / Valle del Cauca
      UPDATE sip_municipio SET latitud='3.585', longitud='-76.4958333' WHERE id=1422; -- Yumbo / Valle del Cauca
      UPDATE sip_municipio SET latitud='4.3983333', longitud='-76.0772222' WHERE id=1427; -- Zarzal / Valle del Cauca
      UPDATE sip_municipio SET latitud='0.9166667', longitud='-70.7333333' WHERE id=235; -- Carurú / Vaupés
      UPDATE sip_municipio SET latitud='1.1983333', longitud='-70.1733333' WHERE id=39; -- Mitú / Vaupés
      UPDATE sip_municipio SET latitud='-0.1207', longitud='-71.0829' WHERE id=866; -- Pacoa / Vaupés
      UPDATE sip_municipio SET latitud='1.9105', longitud='-70.6095' WHERE id=1250; -- Papunahua / Vaupés
      UPDATE sip_municipio SET latitud='0.4938889', longitud='-69.6669444' WHERE id=1084; -- Taraira / Vaupés
      UPDATE sip_municipio SET latitud='0.61034', longitud='-69.20407' WHERE id=1418; -- Yavaraté / Vaupés
      UPDATE sip_municipio SET latitud='4.4444444', longitud='-69.8002778' WHERE id=1246; -- Cumaribo / Vichada
      UPDATE sip_municipio SET latitud='5.4905556', longitud='-70.4091667' WHERE id=887; -- La Primavera / Vichada
      UPDATE sip_municipio SET latitud='6.1877778', longitud='-67.4730556' WHERE id=47; -- Puerto Carreño / Vichada
      UPDATE sip_municipio SET latitud='5.1261111', longitud='-70.8758333' WHERE id=1042; -- Santa Rosalía / Vichada

      -- Nombre

      DELETE FROM sip_municipio_histvigencia WHERE 
      municipio_id=1230 AND
      vigenciaini='2021-01-01'
      AND vigenciafin='2021-12-31';


      UPDATE sip_municipio SET  nombre='Sotará - Paispamba',
        observaciones = ''
        WHERE id=1230; 


      -- Latitud y Longitud de Departamentos
     UPDATE sip_departamento SET latitud='6.55021133387096', longitud='-75.554003442742' WHERE id=35; -- Antioquia
     UPDATE sip_departamento SET latitud='10.7079512608696', longitud='-74.9011456478261' WHERE id=48; -- Atlántico
     UPDATE sip_departamento SET latitud='4.555206', longitud='-74.098663' WHERE id=4; -- Bogotá, D.C.
     UPDATE sip_departamento SET latitud='9.86604', longitud='-75.130692' WHERE id=7; -- Bolívar
     UPDATE sip_departamento SET latitud='5.70705419918699', longitud='-73.1773897048781' WHERE id=11; -- Boyacá
     UPDATE sip_departamento SET latitud='5.27632715555556', longitud='-75.480895062963' WHERE id=13; -- Caldas
     UPDATE sip_departamento SET latitud='1.42114465625', longitud='-75.43703043125' WHERE id=15; -- Caquetá
     UPDATE sip_departamento SET latitud='2.72219576904762', longitud='-76.5414550309524' WHERE id=17; -- Cauca
     UPDATE sip_departamento SET latitud='9.282755556', longitud='-73.521614668' WHERE id=20; -- Cesar
     UPDATE sip_departamento SET latitud='8.59571969666666', longitud='-75.6912439333333' WHERE id=24; -- Córdoba
     UPDATE sip_departamento SET latitud='4.86646071896552', longitud='-74.1931720534483' WHERE id=27; -- Cundinamarca
     UPDATE sip_departamento SET latitud='5.77861863', longitud='-76.8400002833333' WHERE id=29; -- Chocó
     UPDATE sip_departamento SET latitud='2.45617117027027', longitud='-75.7129879918919' WHERE id=32; -- Huila
     UPDATE sip_departamento SET latitud='11.0673518466667', longitud='-72.7891111066667' WHERE id=33; -- La Guajira
     UPDATE sip_departamento SET latitud='10.1753674833333', longitud='-74.3720305233333' WHERE id=34; -- Magdalena
     UPDATE sip_departamento SET latitud='3.64759304482759', longitud='-73.4262129689655' WHERE id=37; -- Meta
     UPDATE sip_departamento SET latitud='1.37132189020843', longitud='-77.5449470993627' WHERE id=38; -- Nariño
     UPDATE sip_departamento SET latitud='7.9174791675', longitud='-72.76738194' WHERE id=39; -- Norte de Santander
     UPDATE sip_departamento SET latitud='4.49465278333333', longitud='-75.6835879583333' WHERE id=41; -- Quindío
     UPDATE sip_departamento SET latitud='5.15147', longitud='-75.918274' WHERE id=42; -- Risaralda
     UPDATE sip_departamento SET latitud='6.59830477816092', longitud='-73.2261531689655' WHERE id=43; -- Santander
     UPDATE sip_departamento SET latitud='9.20350812307692', longitud='-75.2463821884615' WHERE id=45; -- Sucre
     UPDATE sip_departamento SET latitud='4.33888798723404', longitud='-75.0640008957447' WHERE id=46; -- Tolima
     UPDATE sip_departamento SET latitud='4.11343548272846', longitud='-76.2431594209944' WHERE id=47; -- Valle del Cauca
     UPDATE sip_departamento SET latitud='6.66059525714286', longitud='-71.2608333428572' WHERE id=50; -- Arauca
     UPDATE sip_departamento SET latitud='5.4055409368421', longitud='-72.2273099368421' WHERE id=51; -- Casanare
     UPDATE sip_departamento SET latitud='0.796213669230769', longitud='-76.6284017153846' WHERE id=52; -- Putumayo
     UPDATE sip_departamento SET latitud='12.546186', longitud='-81.719913' WHERE id=53; -- Archipiélago de San Andrés, Providencia y Santa Catalina
     UPDATE sip_departamento SET latitud='-1.8188796', longitud='-71.3423095454545' WHERE id=55; -- Amazonas
     UPDATE sip_departamento SET latitud='2.73215331111111', longitud='-68.2157238777778' WHERE id=56; -- Guainía
     UPDATE sip_departamento SET latitud='2.04881945', longitud='-72.468611125' WHERE id=57; -- Guaviare
     UPDATE sip_departamento SET latitud='0.83483815', longitud='-70.2450135' WHERE id=58; -- Vaupés
     UPDATE sip_departamento SET latitud='5.09897964', longitud='-69.77576368' WHERE id=59; -- Vichada
     SQL
  end
end
