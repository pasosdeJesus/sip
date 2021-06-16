require 'sip/concerns/controllers/temas_controller'

module Sip
  module Admin
    class TemasController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::TemasController

    end
  end
end
