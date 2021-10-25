require 'sip/concerns/controllers/modelos_controller'

module Sip
  class ModelosController < ApplicationController

    # Sin chequeo de autorización porque es utilidad para
    # otros controladores
    include Sip::Concerns::Controllers::ModelosController

  end
end
