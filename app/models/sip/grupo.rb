# encoding: UTF-8

require 'sip/concerns/models/grupo'

module Sip
  class Grupo < ActiveRecord::Base
    include Sip::Concerns::Models::Grupo
  end
end
