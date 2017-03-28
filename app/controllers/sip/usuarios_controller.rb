# encoding: UTF-8

require 'sip/concerns/controllers/usuarios_controller'

module Sip
  class UsuariosController < ApplicationController

    include Sip::Concerns::Controllers::UsuariosController

  end
end
