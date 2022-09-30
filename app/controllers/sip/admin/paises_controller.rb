require 'sip/concerns/controllers/paises_controller'

module Sip
  module Admin
    class PaisesController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::PaisesController

    end
  end
end
