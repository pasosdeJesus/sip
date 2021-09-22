
require 'sip/concerns/models/usuario'

module Sip
  class Usuario < ActiveRecord::Base
    include Sip::Concerns::Models::Usuario
  end
end
