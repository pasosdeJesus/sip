class ActualizaDivipola2015S < ActiveRecord::Migration[4.2]

  def up
    execute <<-SQL
      UPDATE sip_municipio SET nombre = 'ALBÁN', observaciones='ALBAN (SAN JOSÉ)' WHERE id='287';
      UPDATE sip_municipio SET nombre = 'ALTO BAUDÓ', observaciones='ALTO BAUDO (PIE DE PATO)' WHERE id='432';
      UPDATE sip_municipio SET nombre = 'APULO', observaciones='RAFAEL REYES (APULO)' WHERE id='983';
      UPDATE sip_municipio SET nombre = 'ARBOLEDA', observaciones='ARBOLEDA (BERRUECOS)' WHERE id='861';
      UPDATE sip_municipio SET nombre = 'ARIGUANÍ', observaciones='ARIGUANÍ (EL DIFICÍL)' WHERE id='962';
      UPDATE sip_municipio SET nombre = 'ARMERO GUAYABAL', observaciones='ARMERO (GUAYABAL)' WHERE id='923';
      UPDATE sip_municipio SET nombre = 'ATRATO', observaciones='ATRATO (YUTO)' WHERE id='848';
      UPDATE sip_municipio SET nombre = 'BAHÍA SOLANO', observaciones='BAHIA SOLANO (MUTIS)' WHERE id='1210';
      UPDATE sip_municipio SET nombre = 'BAJO BAUDÓ', observaciones='BAJO BAUDO (PIZARRO)' WHERE id='1237';
      UPDATE sip_municipio SET nombre = 'BARRANCO MINAS', observaciones='GUAVIARE (BARRANCO MINAS)' WHERE id='594';
      UPDATE sip_municipio SET nombre = 'BOJAYÁ', observaciones='BOJAYÁ (BELLAVISTA)' WHERE id='1465';
      UPDATE sip_municipio SET nombre = 'CÁCHIRA', observaciones='CACHIRÁ' WHERE id='144';
      UPDATE sip_municipio SET nombre = 'CALIMA', observaciones='CALIMA (DARIEN)' WHERE id='143';
      UPDATE sip_municipio SET nombre = 'CARTAGENA DE INDIAS', observaciones='CARTAGENA' WHERE id='31';
      UPDATE sip_municipio SET nombre = 'CIUDAD BOLÍVAR', observaciones='BOLÍVAR (CIUDAD BOLÍVAR)' WHERE id='79';
      UPDATE sip_municipio SET nombre = 'COLOSÓ', observaciones='COLOSÓ (RICAURTE)' WHERE id='337';
      UPDATE sip_municipio SET nombre = 'CUASPÚD', observaciones='CUASPUD (CARLOSAMA)' WHERE id='383';
      UPDATE sip_municipio SET nombre = 'CURUMANÍ', observaciones='CURUMANI' WHERE id='391';
      UPDATE sip_municipio SET nombre = 'DONMATÍAS', observaciones='DON MATÍAS' WHERE id='408';
      UPDATE sip_municipio SET nombre = 'EL CANTÓN DEL SAN PABLO', observaciones='CANTON DEL SAN PABLO' WHERE id='172';
      UPDATE sip_municipio SET nombre = 'EL CARMEN DE ATRATO', observaciones='EL CARMEN' WHERE id='423';
      UPDATE sip_municipio SET nombre = 'EL CARMEN DE VIBORAL', observaciones='CARMEN DE VIBORAL' WHERE id='200';
      UPDATE sip_municipio SET nombre = 'EL SANTUARIO', observaciones='SANTUARIO' WHERE id='1151';
      UPDATE sip_municipio SET nombre = 'GALERAS', observaciones='GALERAS (NUEVA GRANADA)' WHERE id='405';
      UPDATE sip_municipio SET nombre = 'GUAYABAL DE SÍQUIMA', observaciones='GUAYABAL DE SIQUIMA' WHERE id='588';
      UPDATE sip_municipio SET nombre = 'GÜICÁN DE LA SIERRA', observaciones='GÜICÁN' WHERE id='590';
      UPDATE sip_municipio SET nombre = 'JAMUNDÍ', observaciones='JAMUNDI' WHERE id='622';
      UPDATE sip_municipio SET nombre = 'JORDÁN', observaciones='JORDAN' WHERE id='629';
      UPDATE sip_municipio SET nombre = 'LA APARTADA', observaciones='LA APARTADA (LA FRONTERA)' WHERE id='604';
      UPDATE sip_municipio SET nombre = 'LA PAZ', observaciones='LA PAZ (ROBLES)' WHERE id='1035';
      UPDATE sip_municipio SET nombre = 'LEBRIJA', observaciones='LEBRÍJA' WHERE id='706';
      UPDATE sip_municipio SET nombre = 'LÓPEZ DE MICAY', observaciones='LÓPEZ (MICAY)' WHERE id='723';
      UPDATE sip_municipio SET nombre = 'MAGÜÍ', observaciones='MAGüI (PAYAN)' WHERE id='735';
      UPDATE sip_municipio SET nombre = 'MALLAMA', observaciones='MALLAMA (PIEDRANCHA)' WHERE id='748';
      UPDATE sip_municipio SET nombre = 'MEDIO BAUDÓ', observaciones='MEDIO BAUDO' WHERE id='742';
      UPDATE sip_municipio SET nombre = 'MIRITÍ - PARANÁ', observaciones='MIRITI-PARANÁ' WHERE id='777';
      UPDATE sip_municipio SET nombre = 'MORICHAL', observaciones='MORICHAL (MORICHAL NUEVO)' WHERE id='1417';
      UPDATE sip_municipio SET nombre = 'PÁEZ', observaciones='PÁEZ (BELALCAZAR)' WHERE id='873';
      UPDATE sip_municipio SET nombre = 'PATÍA', observaciones='PATÍA (EL BORDO)' WHERE id='898';
      UPDATE sip_municipio SET nombre = 'PUERTO NARE', observaciones='PUERTO NARE (LA MAGDALENA)' WHERE id='968';
      UPDATE sip_municipio SET nombre = 'PUERTO SANTANDER', observaciones='PTO SANTANDER' WHERE id='1089';
      UPDATE sip_municipio SET nombre = 'PURACÉ', observaciones='PURACE (COCONUCO)' WHERE id='970';
      UPDATE sip_municipio SET nombre = 'PURÍSIMA DE LA CONCEPCIÓN', observaciones='PURÍSIMA' WHERE id='972';
      UPDATE sip_municipio SET nombre = 'ROBERTO PAYÁN', observaciones='ROBERTO PAYÁN (SAN JOSÉ)' WHERE id='1036';
      UPDATE sip_municipio SET nombre = 'SAN ANDRÉS DE CUERQUÍA', observaciones='SAN ANDRÉS' WHERE id='1052';
      UPDATE sip_municipio SET nombre = 'SAN ANTONIO DEL TEQUENDAMA', observaciones='SAN ANTONIO DE TEQUENDAMA' WHERE id='1050';
      UPDATE sip_municipio SET nombre = 'SAN JACINTO DEL CAUCA' WHERE id='1064';
      UPDATE sip_municipio SET nombre = 'SAN JUAN DE RIOSECO', observaciones='SAN JUAN DE RÍO SECO' WHERE id='1078';
      UPDATE sip_municipio SET nombre = 'SAN LUIS DE SINCÉ', observaciones='SINCÉ' WHERE id='1200';
      UPDATE sip_municipio SET nombre = 'SAN SEBASTIÁN DE MARIQUITA', observaciones='MARIQUITA' WHERE id='761';
      UPDATE sip_municipio SET nombre = 'SAN VICENTE FERRER', observaciones='SAN VICENTE' WHERE id='1104';
      UPDATE sip_municipio SET nombre = 'SOTARA', observaciones='SOTARA (PAISPAMBA)' WHERE id='1230';
      UPDATE sip_municipio SET nombre = 'TOLÚ VIEJO', observaciones='TOLUVIEJO' WHERE id='1336';
      UPDATE sip_municipio SET nombre = 'TULUÁ', observaciones='TULUA' WHERE id='1344';
      UPDATE sip_municipio SET nombre = 'VALLE DEL GUAMUEZ', observaciones='VALLE DEL GUAMUEZ (LA HORMIGA)' WHERE id='1381';
    SQL
  end

  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
