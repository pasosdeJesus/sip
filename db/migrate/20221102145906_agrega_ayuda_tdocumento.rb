class AgregaAyudaTdocumento < ActiveRecord::Migration[7.0]
  def change
    if !column_exists?(:sip_tdocumento, :ayuda)
      add_column :sip_tdocumento, :ayuda, :string, limit: 1000

      execute <<-SQL
        UPDATE sip_tdocumento SET ayuda='Debe constar solo de digitos. Por ejemplo 323948' WHERE formatoregex='[0-9]*';
        UPDATE sip_tdocumento SET ayuda='Debe constar de una letra mayúscula, un guión y dígitos. Por ejemplo S-323948' WHERE formatoregex='[A-Z]-[0-9]*';
        UPDATE sip_tdocumento SET ayuda='Cualquier cadena sirve de identificación (sin restricción en formato)' WHERE formatoregex='';
        UPDATE sip_tdocumento SET ayuda='Debe constar de dígitos un guion y digitos. Por ejemplo 1344-4232' WHERE formatoregex='[0-9]*-[0-9]*';
        UPDATE sip_tdocumento SET ayuda='Debe constar de letras mayúsculas seguidas de dígitos. Por ejemplo DSS-1344' WHERE formatoregex='[A-Z]*[0-9]*';
      SQL
    end
  end

  def down
    drop_column :sip_tdocumento, :ayuda
  end
end
