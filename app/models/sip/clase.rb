
require 'sip/concerns/models/clase'

module Sip
  class Clase < ActiveRecord::Base
    include Sip::Concerns::Models::Clase
  end
end
