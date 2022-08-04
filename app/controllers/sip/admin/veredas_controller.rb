require 'sip/concerns/controllers/veredas_controller'

module Sip
  module Admin
    class VeredasController < Sip::Admin::BasicasController
      before_action :set_vereda, 
        only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource  class: Sip::Vereda

      include Sip::Concerns::Controllers::VeredasController

    end
  end
end

