# encoding: UTF-8

require 'sip/concerns/models/persona_trelacion'

module Sip
  class PersonaTrelacion < ActiveRecord::Base
    include Sip::Concerns::Models::PersonaTrelacion
  end
end
