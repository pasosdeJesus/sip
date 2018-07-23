# encoding: UTF-8

require 'sip/concerns/models/actorsocial'

module Sip
  class Actorsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Actorsocial
  end
end
