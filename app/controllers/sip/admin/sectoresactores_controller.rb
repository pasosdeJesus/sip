# encoding: UTF-8

require 'sip/concerns/controllers/sectoresactores_controller'

module Sip
  module Admin
    class SectoresactoresController < Sip::Admin::BasicasController
      include Sip::Concerns::Controllers::SectoresactoresController
      load_and_authorize_resource class: Sip::Sectoractor
    end
  end
end
