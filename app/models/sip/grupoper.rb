# encoding: UTF-8

require 'sip/concerns/models/grupoper'

module Sip
  class Grupoper < ActiveRecord::Base
    include Sip::Concerns::Models::Grupoper
  end
end
