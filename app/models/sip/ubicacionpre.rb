
require 'sip/concerns/models/ubicacionpre'

module Sip
  class Ubicacionpre < ActiveRecord::Base
    include Sip::Concerns::Models::Ubicacionpre
  end
end
