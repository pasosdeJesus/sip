class ActorsocialConFechadeshabilitacion < ActiveRecord::Migration[5.2]
  def up
    if !column_exists?('sip_actorsocial', :fechadeshabilitacion)
      add_column :sip_actorsocial, :fechadeshabilitacion, :date, default: nil
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
