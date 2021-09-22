
require 'sip/concerns/controllers/oficinas_controller'

module Sip
  module Admin
    class OficinasController < Sip::Admin::BasicasController

      before_action :set_oficina, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sip::Oficina

      include Sip::Concerns::Controllers::OficinasController
  
    end
  end
end
