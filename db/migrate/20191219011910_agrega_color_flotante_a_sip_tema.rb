class AgregaColorFlotanteASipTema < ActiveRecord::Migration[6.0]
  def up
    add_column :sip_tema, :color_flota_subitem_fuente, :string
    add_column :sip_tema, :color_flota_subitem_fondo, :string
    execute <<-SQL
      UPDATE sip_tema SET color_flota_subitem_fuente='#266dd3',
        color_flota_subitem_fondo='#ffffff' WHERE id='1';
    SQL
  end

  def down
    remove_column :sip_tema, :color_flota_subitem_fuente, :string
    remove_column :sip_tema, :color_flota_subitem_fondo, :string
  end
end
