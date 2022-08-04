require 'sip/concerns/controllers/estadossol_controller'

module Sip
  module Admin
    class EstadossolController < Sip::Admin::BasicasController

      before_action :set_estadosol, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sip::Estadosol

      include Sip::Concerns::Controllers::EstadossolController

    end
  end
end
