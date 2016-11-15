# encoding: UTF-8

class Ability  < Sip::Ability

  #@@tablasbasicas = Sip::Ability::BASICAS_PROPIAS

  # Se definen habilidades con cancancan
  # @usuario Usuario que hace petición
  def initialize(usuario = nil)
    # El primer argumento para can es la acción a la que se da permiso, 
    # el segundo es el recurso sobre el que puede realizar la acción, 
    # el tercero opcional es un diccionario de condiciones para filtrar 
    # más (e.g :publicado => true).
    #
    # El primer argumento puede ser :manage para indicar toda acción, 
    # o grupos de acciones como :read (incluye :show e :index), 
    # :create, :update y :destroy.
    #
    # Si como segundo argumento usa :all se aplica a todo recurso, 
    # o puede ser una clase.
    # 
    # Detalles en el wiki de cancan: 
    #   https://github.com/ryanb/cancan/wiki/Defining-Abilities

    # Sin autenticación puede consultarse información geográfica 
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    can :contar, Sip::Ubicacion
    can :buscar, Sip::Ubicacion
    can :lista, Sip::Ubicacion
    can :descarga_anexo, Sip::Anexo
    can :nuevo, Sip::Ubicacion
    #can :nuevo, Sip::Victima
    if usuario && usuario.rol then
      case usuario.rol 
      when Ability::ROLANALI
        can :read, Sip::Ubicacion
        can :new, Sip::Ubicacion
        can [:update, :create, :destroy], Sip::Ubicacion
        #can :read, Sip::Actividad
        #can :new, Sip::Actividad
        #can [:update, :create, :destroy], Sip::Actividad
      when Ability::ROLADMIN
        can :manage, Sip::Ubicacion
        #can :manage, Sip::Actividad
        can :manage, Usuario
        can :manage, :tablasbasicas
        self.tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end

end

