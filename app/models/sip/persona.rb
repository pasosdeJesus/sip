# encoding: UTF-8

require 'sip/concerns/models/persona'

module Sip
  class Persona < ActiveRecord::Base
    include Sip::Concerns::Models::Persona
  end
end
