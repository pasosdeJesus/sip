# encoding: UTF-8

require 'sip/concerns/controllers/grupos_controller'

module Sip
  module Admin
    class GruposController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::GruposController
      load_and_authorize_resource  class: Sip::Grupo
  
    end
  end
end
