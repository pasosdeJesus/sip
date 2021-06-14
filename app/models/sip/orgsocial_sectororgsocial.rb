# encoding: UTF-8

require 'sip/concerns/models/orgsocial_sectororgsocial'

module Sip
  class OrgsocialSectororgsocial < ActiveRecord::Base
    include Sip::Concerns::Models::OrgsocialSectororgsocial
  end
end
