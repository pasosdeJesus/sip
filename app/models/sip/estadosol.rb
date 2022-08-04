require 'sip/concerns/models/estadosol'

module Sip
  class Estadosol < ActiveRecord::Base
    include Sip::Concerns::Models::Estadosol
  end
end
