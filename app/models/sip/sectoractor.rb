# encoding: UTF-8

require 'sip/concerns/models/sectoractor'

module Sip
  class Sectoractor < ActiveRecord::Base
    include Sip::Concerns::Models::Sectoractor
  end
end
