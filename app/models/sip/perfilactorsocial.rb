# encoding: UTF-8

require 'sip/concerns/models/perfilactorsocial'

module Sip
  class Perfilactorsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Perfilactorsocial
  end
end
