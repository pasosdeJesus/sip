
require 'sip/concerns/models/tclase'

module Sip
  class Tclase < ActiveRecord::Base
    include Sip::Concerns::Models::Tclase
  end
end

