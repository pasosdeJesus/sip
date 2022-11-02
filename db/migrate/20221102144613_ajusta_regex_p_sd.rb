class AjustaRegexPSd < ActiveRecord::Migration[7.0]
  def up
    p = Sip::Tdocumento.where(sigla: 'P').take
    p.formatoregex = '[A-Z]*[0-9]*'
    p.save!
    sd = Sip::Tdocumento.where(sigla: 'SD').take
    sd.formatoregex = '[0-9]*[A-Z]*'
    sd.save!
  end
  def down
    sd = Sip::Tdocumento.where(sigla: 'SD').take
    sd.formatoregex = '[0-9]*'
    sd.save!
    p = Sip::Tdocumento.where(sigla: 'P').take
    p.formatoregex = '[0-9]*'
    p.save!
  end
end
