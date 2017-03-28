# encoding: UTF-8

require 'sip/concerns/models/usuario'

module Sip
  class Usuario < ActiveRecord::Base
    include Sip::Concerns::Models::Usuario

    validates_length_of :nombre, maximum: 50, unless: 'nombre.nil?'
  end
end
