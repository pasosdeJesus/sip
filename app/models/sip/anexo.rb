require 'sip/concerns/models/anexo'

module Sip
  class Anexo < ActiveRecord::Base
    include Sip::Concerns::Models::Anexo
  end
end
