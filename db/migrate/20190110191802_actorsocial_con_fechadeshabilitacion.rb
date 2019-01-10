class ActorsocialConFechadeshabilitacion < ActiveRecord::Migration[5.2]
  def up
    s =Sip::Actorsocial.take
    if s && !s.respond_to?(:fechadeshabilitacion)
      add_column :sip_actorsocial, :fechadeshabilitacion, :date, default: nil
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration    
  end
end
