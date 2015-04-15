# encoding: UTF-8
require 'sip/concerns/models/pais'

module Sip
  class Pais < ActiveRecord::Base
    include Sip::Concerns::Models::Pais
  end
end
