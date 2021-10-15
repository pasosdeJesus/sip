require 'sip/concerns/controllers/ubicacionespre_controller'

module Sip
  class UbicacionespreController < Sip::ModelosController

    before_action :set_ubicacionpre, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sip::Ubicacionpre

    include Sip::Concerns::Controllers::UbicacionespreController

  end
end
