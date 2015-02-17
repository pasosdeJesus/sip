# encoding: UTF-8
module Sip
  class Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    #ROLDIR    = 3
    #ROLCOOR   = 4
    ROLANALI  = 5
    #ROLSIST   = 6

    ROLES = [
      ["Administrador", ROLADMIN],  # 1
      ["", 0], # 2
      ["", 0], # 3
      ["", 0], # 4
      ["Analista", ROLANALI], # 5
      ["", 0] #6
    ]

    @@tablasbasicas = [
      ['Sip', 'clase'], 
      ['Sip', 'departamento'], 
      ['Sip', 'etiqueta'], 
      ['Sip', 'municipio'], 
      ['Sip', 'pais'],
      ['Sip', 'tclase'], 
      ['Sip', 'tdocumento'], 
      ['Sip', 'tsitio']
    ]

    def self.tablasbasicas
      @@tablasbasicas
    end

    # Tablas basicas cuya secuencia es de la forma tabla_id_seq  (convención rails)
    @@basicas_seq_con_id = [ 
      ['Sip', 'clase'], 
      ['Sip', 'departamento'], 
      ['Sip', 'etiqueta'], 
      ['Sip', 'municipio'], 
      ['Sip', 'pais'],
      ['Sip', 'tdocumento'], 
      ['Sip', 'tsitio']
    ]

    def self.basicas_seq_con_id
      @@basicas_seq_con_id
    end

    # Tablas básicas cuyo id no es autoincremental
    @@basicas_id_noauto = [ 
      ['Sip', 'clase'], 
      ['Sip', 'departamento'], 
      ['Sip', 'municipio'], 
      ['Sip', 'tclase']
    ]

    def self.basicas_id_noauto
      @@basicas_id_noauto
    end

    # Tablas no básicas pero que tienen índice
    @@nobasicas_indice = [
    ]

    def self.nobasicas_indice
      @@nobasicas_indice
    end

    # Tablas no básicas pero que tienen índice
    @@nobasicas_indice_seq_con_id = [
      ['Sip', 'persona'], 
      ['Sip', 'ubicacion'], 
      ['', 'usuario']
    ]

    def self.nobasicas_indice_seq_con_id
      @@nobasicas_indice_seq_con_id
    end

    # Tablas básicas que deben volcarse primero --por ser requeridas 
    # por otras básicas
    @@tablasbasicas_prio = [
      ['Sip', 'tclase'], 
      ['Sip', 'pais'], 
      ['Sip', 'departamento'], 
      ['Sip', 'municipio'], 
      ['Sip', 'clase'],
    ];

    def self.tablasbasicas_prio
      @@tablasbasicas_prio
    end

    # Recibe una tabla básica como pareja [Modulo, clase] y retorna
    # clase completa Modulo::Clase
    def self.tb_clase(t)
      if (t[0] != '') 
        k = t[0] + '::' + t[1].capitalize
      else
        k = t[1].capitalize
      end
      k.constantize 
    end

    # Recibe una tabla básica como pareja [Modulo, clase] y retorna
    # nombre de tabla modulo_clase
    def self.tb_modelo(t)
      if (t[0] != '') 
        t[0].underscore.gsub(/\//, '_') + '_' + t[1]
      else 
        t[1]
      end
    end


    # Se definen habilidades con cancancan
    def initialize(usuario)
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
          @@tablasbasicas.each do |t|
            c = Ability.tb_clase(t)
            can :manage, c
          end
        end
      end
    end
  end
end
