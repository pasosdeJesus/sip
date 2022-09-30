require 'sip/concerns/controllers/departamentos_controller'

module Sip
  module Admin
    class DepartamentosController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::DepartamentosController

    end
  end
end
