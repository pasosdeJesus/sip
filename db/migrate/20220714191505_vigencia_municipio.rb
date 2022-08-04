class VigenciaMunicipio < ActiveRecord::Migration[7.0]
  def up
    add_column :sip_municipio, :ultvigenciaini, :date # Remplazará fechacreacion
    add_column :sip_municipio, :ultvigenciafin, :date # Remplazará fechadeshabilitacion
    # La convención es que si tiene vigenciafin diligenciado es con una fecha
    # pasada y el registro no puede usarse en el presente

    # Las vigencias históricas en esta tabla
    create_table :sip_municipio_histvigencia do |t|
      t.column :municipio_id, :integer
      t.column :vigenciaini, :date  
      t.column :vigenciafin, :date, null: false 
      t.column :nombre, :string, limit: 256
      t.column :id_munlocal, :integer
      t.column :observaciones, :string, limit: 5000 # Por ejemplo fuente donde se ve
      t.column :codreg, :integer
    end
  end

  def down
    remove_table :sip_municipio_histvigencia
    remove_column :sip_municipio, :ultvigenciaini
    remove_column :sip_municipio, :ultvigenciafin
  end
end
