# encoding: UTF-8

require 'sip/concerns/models/actorsocial_sectoractor'

module Sip
  class ActorsocialSectoractor < ActiveRecord::Base
    include Sip::Concerns::Models::ActorsocialSectoractor
  end
end
