require 'sip/concerns/controllers/municipios_controller'

module Sip
  module Admin
    class MunicipiosController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::MunicipiosController

    end
  end
end
