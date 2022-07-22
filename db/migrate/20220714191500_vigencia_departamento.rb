class VigenciaDepartamento < ActiveRecord::Migration[7.0]
  def up
    add_column :sip_departamento, :ultvigenciaini, :date # Remplazará fechacreacion
    add_column :sip_departamento, :ultvigenciafin, :date # Remplazará fechadeshabilitacion
    # La convención es que si tiene vigenciafin diligenciado es con una fecha
    # pasada y el registro no puede usarse en el presente

    # Las vigencias históricas en esta tabla
    create_table :sip_departamento_histvigencia do |t|
      t.column :departamento_id, :integer
      t.column :vigenciaini, :date  
      t.column :vigenciafin, :date, null: false 
      t.column :nombre, :string, limit: 256
      t.column :id_deplocal, :integer
      t.column :codiso, :integer
      t.column :catiso, :integer
      t.column :codreg, :integer
      t.column :observaciones, :string, limit: 5000 # Por ejemplo fuente
    end
  end

  def down
    remove_table :sip_departamento_histvigencia
    remove_column :sip_departamento, :ultvigenciaini
    remove_column :sip_departamento, :ultvigenciafin
  end
end
