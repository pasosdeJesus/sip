# encoding: UTF-8

require 'sip/concerns/models/departamento'

module Sip
  class Departamento < ActiveRecord::Base
    include Sip::Concerns::Models::Departamento
  end
end
