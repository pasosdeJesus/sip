
require 'sip/concerns/models/fuenteprensa'

module Sip
  class Fuenteprensa < ActiveRecord::Base
    include Sip::Concerns::Models::Fuenteprensa
  end
end
