class AgregaActorsocialFechadeshabilitacion < ActiveRecord::Migration[6.0]
  def up
    if !column_exists?(:sip_actorsocial, :fechadeshabilitacion)
      add_column :sip_actorsocial, :fechadeshabilitacion, :date
    end
  end

  def down
  end
end
