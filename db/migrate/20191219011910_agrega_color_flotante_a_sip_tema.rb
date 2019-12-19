class AgregaColorFlotanteASipTema < ActiveRecord::Migration[6.0]
  def change
    add_column :sip_tema, :color_flota_subitem_fuente, :string
    add_column :sip_tema, :color_flota_subitem_fondo, :string
  end
end
