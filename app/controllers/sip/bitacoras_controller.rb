require 'sip/concerns/controllers/bitacoras_controller'

module Sip
  class BitacorasController < Sip::ModelosController

    before_action :set_bitacora, 
      only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource  class: Sip::Bitacora

    include Sip::Concerns::Controllers::BitacorasController

  end
end
