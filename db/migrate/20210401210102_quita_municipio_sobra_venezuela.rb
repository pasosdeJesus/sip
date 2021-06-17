class QuitaMunicipioSobraVenezuela < ActiveRecord::Migration[6.1]
  def up
    if Sip::Municipio.where(id: 399, nombre: 'sa').count == 1
      execute <<-SQL
        DELETE FROM sip_ubicacionpre WHERE municipio_id=399;
        DELETE FROM sip_municipio WHERE id=399;
      SQL
    end
  end
  def down
  end
end
