require 'sip/concerns/models/tipoorg'

module Sip
  class Tipoorg < ActiveRecord::Base
    include Sip::Concerns::Models::Tipoorg
  end
end
