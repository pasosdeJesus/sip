require_dependency "sip/concerns/controllers/orgsociales_controller"

module Sip
  class OrgsocialesController < Sip::ModelosController
    include Sip::Concerns::Controllers::OrgsocialesController
  end
end
