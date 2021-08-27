require_dependency "sip/concerns/controllers/orgsociales_controller"

module Sip
  class OrgsocialesController < Sip::ModelosController
    before_action :set_orgsocial, only: [:show, :edit, :update, :destroy]
    load_and_authorize_resource class: Sip::Orgsocial

    include Sip::Concerns::Controllers::OrgsocialesController

  end
end
