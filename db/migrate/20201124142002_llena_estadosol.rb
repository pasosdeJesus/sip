class LlenaEstadosol < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      INSERT INTO public.sip_estadosol (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (1, 'PENDIENTE', null, '2022-06-23', null, '2022-06-23', '2022-06-23');
      INSERT INTO public.sip_estadosol (id, nombre, observaciones, fechacreacion, fechadeshabilitacion, created_at, updated_at) 
        VALUES (2, 'RESUELTA', null, '2022-06-23', null, '2022-06-23', '2022-06-23');
      SELECT setval('public.sip_estadosol_id_seq', 100);
    SQL
  end

  def down
    execute <<-SQL
      DELETE FROM public.sip_estadosol WHERE id>='1' AND id<='2'
    SQL
  end
end
