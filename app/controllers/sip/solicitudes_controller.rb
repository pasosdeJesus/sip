require 'sip/concerns/controllers/solicitudes_controller'

module Sip
  class SolicitudesController < Sip::ModelosController
    before_action :set_solicitud, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sip::Solicitud

    include Sip::Concerns::Controllers::SolicitudesController

  end
end
