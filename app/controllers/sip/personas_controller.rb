require 'sip/concerns/controllers/personas_controller'

module Sip
  class PersonasController < Sip::ModelosController

    include Sip::Concerns::Controllers::PersonasController

  end
end
