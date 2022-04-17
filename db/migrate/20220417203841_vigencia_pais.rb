class VigenciaPais < ActiveRecord::Migration[7.0]
  def up
    add_column :sip_pais, :ultvigenciaini, :date # Remplazará fechacreacion
    add_column :sip_pais, :ultvigenciafin, :date # Remplazará fechadeshabilitacion
    # La convención es que si tiene vigenciafin diligenciado es con una fecha
    # pasada y el registro no puede usarse en el presente

    # Las vigencias históricas en esta tabla
    create_table :sip_pais_histvigencia do |t|
      t.column :pais_id, :integer
      t.column :vigenciaini, :date  
      t.column :vigenciafin, :date, null: false 
      t.column :codiso, :integer
      t.column :alfa2, :string, limit: 2
      t.column :alfa3, :string, limit: 3
      t.column :codcambio, :string, limit: 4  # iso3166-3
    end
  end

  def down
    remove_table :sip_pais_histvigencia
    remove_column :sip_pais, :ultvigenciaini
    remove_column :sip_pais, :ultvigenciafin
  end
end
