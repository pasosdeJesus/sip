class MejoraLatlonColombia < ActiveRecord::Migration[6.1]
  def up
    c=Sip::Pais.find(170)
    c.latitud=4.7465
    c.longitud=-75.0974
    c.save!
  end
  def down
    c=Sip::Pais.find(170)
    c.latitud=-75.0974
    c.longitud=4.7465
    c.save!
  end
end
