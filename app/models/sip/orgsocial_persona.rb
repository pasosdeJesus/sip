
require 'sip/concerns/models/orgsocial_persona'

module Sip
  class OrgsocialPersona < ActiveRecord::Base
    include Sip::Concerns::Models::OrgsocialPersona
  end
end
