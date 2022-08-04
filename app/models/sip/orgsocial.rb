require 'sip/concerns/models/orgsocial'

module Sip
  class Orgsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Orgsocial
  end
end
