
require 'sip/concerns/models/sectororgsocial'

module Sip
  class Sectororgsocial < ActiveRecord::Base
    include Sip::Concerns::Models::Sectororgsocial
  end
end
