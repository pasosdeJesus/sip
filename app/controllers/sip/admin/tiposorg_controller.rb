require 'sip/concerns/controllers/tiposorg_controller'

module Sip
  module Admin
    class TiposorgController < BasicasController
      before_action :set_tipoorg, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Tipoorg

      include Sip::Concerns::Controllers::TiposorgController

    end
  end
end
