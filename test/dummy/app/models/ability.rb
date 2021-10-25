class Ability  < Sip::Ability

  # Se definen habilidades con cancancan
  # @usuario Usuario que hace petición
  def initialize(usuario = nil)
    initialize_sip(usuario)
  end

end

