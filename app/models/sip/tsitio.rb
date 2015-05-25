# encoding: UTF-8

require 'sip/concerns/models/tsitio'

module Sip
  class Tsitio < ActiveRecord::Base
    include Sip::Concerns::Models::Tsitio
  end
end

