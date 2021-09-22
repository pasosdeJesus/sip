
require 'sip/concerns/models/oficina'

module Sip
  class Oficina < ActiveRecord::Base
    include Sip::Concerns::Models::Oficina
  end
end
