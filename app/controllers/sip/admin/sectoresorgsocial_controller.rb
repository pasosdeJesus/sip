# encoding: UTF-8

require 'sip/concerns/controllers/sectoresorgsocial_controller'

module Sip
  module Admin
    class SectoresorgsocialController < Sip::Admin::BasicasController
      include Sip::Concerns::Controllers::SectoresorgsocialController
      load_and_authorize_resource class: Sip::Sectororgsocial
    end
  end
end
