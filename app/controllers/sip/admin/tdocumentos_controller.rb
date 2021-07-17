require 'sip/concerns/controllers/tdocumentos_controller'

module Sip
  module Admin
    class TdocumentosController < BasicasController
      before_action :set_tdocumento, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Tdocumento

      include Sip::Concerns::Controllers::TdocumentosController

    end
  end
end
