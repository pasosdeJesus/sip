class VigenciaClase < ActiveRecord::Migration[7.0]
  def up
    add_column :sip_clase, :ultvigenciaini, :date # Remplazará fechacreacion
    add_column :sip_clase, :ultvigenciafin, :date # Remplazará fechadeshabilitacion
    # La convención es que si tiene vigenciafin diligenciado es con una fecha
    # pasada y el registro no puede usarse en el presente

    # Las vigencias históricas en esta tabla
    create_table :sip_clase_histvigencia do |t|

      t.column :clase_id, :integer
      t.column :vigenciaini, :date  
      t.column :vigenciafin, :date, null: false 
      t.column :nombre, :string, limit: 256
      t.column :id_clalocal, :integer
      t.column :id_tclase, :string, limimt: 10
      t.column :observaciones, :string, limit: 5000 # Por ejemplo fuente donde se ve
    end
  end

  def down
    remove_table :sip_clase_histvigencia
    remove_column :sip_clase, :ultvigenciaini
    remove_column :sip_clase, :ultvigenciafin
  end
end
