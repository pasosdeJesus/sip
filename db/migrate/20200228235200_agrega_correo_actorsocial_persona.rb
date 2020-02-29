class AgregaCorreoActorsocialPersona < ActiveRecord::Migration[6.0]
  def up
    if !column_exists? :sip_actorsocial_persona, :correo
      add_column :sip_actorsocial_persona, :correo, :string, limit: 100
    end
  end
  def down
  end
end
