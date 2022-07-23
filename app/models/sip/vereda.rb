
require 'sip/concerns/models/vereda'

module Sip
  class Vereda < ActiveRecord::Base
    include Sip::Concerns::Models::Vereda
  end
end
