class PaisNombreisoEspanol < ActiveRecord::Migration[7.0]
  def change
    rename_column :sip_pais, :nombreosm, :nombreiso_espanol
  end
end
