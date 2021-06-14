# encoding: UTF-8

require 'sip/concerns/models/perfilorgsocial'

module Sip
  class Perfilorgsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Perfilorgsocial
  end
end
