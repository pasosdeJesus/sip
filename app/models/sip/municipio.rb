# encoding: UTF-8
require 'sip/concerns/models/municipio'

module Sip
  class Municipio < ActiveRecord::Base
    include Sip::Concerns::Models::Municipio
  end
end
