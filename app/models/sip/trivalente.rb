# encoding: UTF-8

require 'sip/concerns/models/trivalente'

module Sip
  class Trivalente < ActiveRecord::Base
    include Sip::Concerns::Models::Trivalente
  end
end

