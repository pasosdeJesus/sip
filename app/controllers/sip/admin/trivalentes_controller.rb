# encoding: UTF-8

require 'sip/concerns/controllers/trivalentes_controller'

module Sip
  module Admin
    class TrivalentesController < Sip::Admin::BasicasController

      include Sip::Concerns::Controllers::TrivalentesController
  
    end
  end
end
