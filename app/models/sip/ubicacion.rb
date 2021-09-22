
require 'sip/concerns/models/ubicacion'

module Sip
  class Ubicacion < ActiveRecord::Base
    include Sip::Concerns::Models::Ubicacion
  end
end
