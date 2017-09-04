class AgregaPorDefectoTclase < ActiveRecord::Migration[4.2]
  def up
		execute <<-SQL
			ALTER TABLE sip_clase ALTER COLUMN id_tclase SET DEFAULT 'CP';
			UPDATE sip_clase SET id_tclase='CP' WHERE id_tclase IS NULL;
			ALTER TABLE sip_clase ALTER COLUMN id_tclase SET NOT NULL;
		SQL
  end

	def down
		execute <<-SQL
			ALTER TABLE sip_clase ALTER COLUMN id_tclase DROP DEFAULT;
			ALTER TABLE sip_clase ALTER COLUMN id_tclase DROP NOT NULL;
		SQL
	end
end
