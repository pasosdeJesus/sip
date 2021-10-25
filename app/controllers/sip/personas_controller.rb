require 'sip/concerns/controllers/personas_controller'

module Sip
  class PersonasController < Sip::ModelosController

    load_and_authorize_resource class: Sip::Persona

    include Sip::Concerns::Controllers::PersonasController

  end
end
