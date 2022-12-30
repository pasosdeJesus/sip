
require 'sip/concerns/controllers/anexos_controller'

module Sip
  class AnexosController < ApplicationController
    load_and_authorize_resource class: Sip::Anexo

    include Sip::Concerns::Controllers::AnexosController

  end
end
