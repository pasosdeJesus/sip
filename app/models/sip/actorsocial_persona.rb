# encoding: UTF-8

require 'sip/concerns/models/actorsocial_persona'

module Sip
  class ActorsocialPersona < ActiveRecord::Base
    include Sip::Concerns::Models::ActorsocialPersona
  end
end
