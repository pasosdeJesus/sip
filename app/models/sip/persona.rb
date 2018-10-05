# encoding: UTF-8

require 'sip/concerns/models/persona'

module Sip
  class Persona < ActiveRecord::Base
    include Sip::Concerns::Models::Persona
   
    def presenta(atr)
      case atr.to_s
      when 'nacionalde'
        nacional.nombre
      else
        presenta_gen(atr)
      end
    end

  end
end
