# encoding: UTF-8

require 'sip/concerns/models/trelacion'

module Sip
  class Trelacion < ActiveRecord::Base
    include Sip::Concerns::Models::Trelacion
  end
end
