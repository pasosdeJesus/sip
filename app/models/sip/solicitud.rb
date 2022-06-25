require 'sip/concerns/models/solicitud'

module Sip
  class Solicitud < ActiveRecord::Base
    include Sip::Concerns::Models::Solicitud
  end
end
