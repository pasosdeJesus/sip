
require 'sip/concerns/models/bitacora'

module Sip
  class Bitacora < ActiveRecord::Base
    include Sip::Concerns::Models::Bitacora
  end
end
