
require 'sip/concerns/models/grupo_usuario'

module Sip
  class GrupoUsuario < ActiveRecord::Base
    include Sip::Concerns::Models::GrupoUsuario
  end
end
