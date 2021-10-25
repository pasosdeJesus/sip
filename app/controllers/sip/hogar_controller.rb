require 'sip/concerns/controllers/hogar_controller'

module Sip
  class HogarController < ApplicationController
    # Sin chequeo de autorización porque son páginas iniciales para usuarios no
    # autenticados tambien
    include Sip::Concerns::Controllers::HogarController

  end
end
