
require 'sip/concerns/models/etiqueta'

module Sip
  class Etiqueta < ActiveRecord::Base
    include Sip::Concerns::Models::Etiqueta
  end
end
