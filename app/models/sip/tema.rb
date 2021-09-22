
require 'sip/concerns/models/tema'

module Sip
  class Tema < ActiveRecord::Base
    include Sip::Concerns::Models::Tema
  end
end

