# encoding: UTF-8

module Sip
  class Trelacion < ActiveRecord::Base
    include Basica

    has_many :persona_trelacion, foreign_key: "id_trelacion", validate: true, 
      class_name: 'Sip::PersonaTrelacion'

    validates_presence_of :inverso
  end
end
