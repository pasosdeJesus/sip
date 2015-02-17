# encoding: UTF-8
module Sip
  class PersonaTrelacion < ActiveRecord::Base
    belongs_to :persona, foreign_key: "persona1", validate: true, 
      class_name: 'Sip::Persona'
    belongs_to :persona, foreign_key: "persona2", validate: true, 
      class_name: 'Sip::Persona'
    belongs_to :trelacion, foreign_key: "id_trelacion", validate: true, 
      class_name: 'Sip::Trelacion'

  end
end
