require 'sip/concerns/controllers/gruposper_controller'

module Sip
  class GruposperController < ApplicationController

    load_and_authorize_resource class: Sip::Gruposper
    include Sip::Concerns::Controllers::GruposperController

  end
end
