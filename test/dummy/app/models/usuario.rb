# encoding: UTF-8

require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
