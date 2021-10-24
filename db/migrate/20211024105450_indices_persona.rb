class IndicesPersona < ActiveRecord::Migration[6.1]
  def up
    execute <<-SQL
      CREATE INDEX sip_persona_sexo_ind ON sip_persona (sexo);
      CREATE INDEX sip_persona_anionac_ind ON sip_persona (anionac);
    SQL
  end
  def down
    execute <<-SQL
      DROP INDEX sip_persona_sexo_ind;
      DROP INDEX sip_persona_anionac_ind;
    SQL
  end
end
