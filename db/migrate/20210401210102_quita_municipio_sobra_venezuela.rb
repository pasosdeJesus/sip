class QuitaMunicipioSobraVenezuela < ActiveRecord::Migration[6.1]
  def up
    if Sip::Municipio.where(id: 399, nombre: 'sa').count == 1
      Sip::Ubicacionpre.where(municipio_id: 399).destroy_all
      Sip::Municipio.find(399).destroy
    end
  end
  def down
  end
end
