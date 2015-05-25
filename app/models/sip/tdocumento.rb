# encoding: UTF-8

require 'sip/concerns/models/tdocumento'

module Sip
  class Tdocumento < ActiveRecord::Base
    include Sip::Concerns::Models::Tdocumento
  end
end
