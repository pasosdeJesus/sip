module Sip
  class Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    ROLDIR    = 3
    #ROLCOOR   = 4
    ROLOPERADOR = ROLANALI  = 5
    #ROLSIST   = 6

    ROLES = [
      ["Administrador", ROLADMIN],  # 1
      ["", 0], # 2
      ["Directivo", ROLDIR], # 3
      ["", 0], # 4
      ["Operador", ROLOPERADOR], # 5
      ["", 0], #6
    ]

    ROLES_CA = [
      "Crear copias de respaldo cifradas. " +
        "Administrar usuarios. " +
        "Administrar tablas básicas. ",
      "", #2
      "", #3
      "", #4
      "", #5
      "", #6
      "" #7
    ]

    BASICAS_PROPIAS = [
      ['Sip', 'clase'], 
      ['Sip', 'departamento'], 
      ['Sip', 'etiqueta'], 
      ['Sip', 'fuenteprensa'], 
      ['Sip', 'grupo'], 
      ['Sip', 'municipio'], 
      ['Sip', 'oficina'],
      ['Sip', 'pais'],
      ['Sip', 'perfilorgsocial'],
      ['Sip', 'sectororgsocial'],
      ['Sip', 'tclase'], 
      ['Sip', 'tema'], 
      ['Sip', 'tdocumento'], 
      ['Sip', 'trelacion'], 
      ['Sip', 'trivalente'], 
      ['Sip', 'tsitio']
    ]

    #@@tablasbasicas = BASICAS_PROPIAS 

    # Retorna arreglo de tablas básicas
    # No conviene usar variables de clas @@tablasbasicas
    # Cuando varios motores heredan e inicializan, pues al
    # cargar en modo eager puede evaluarse de último una clase
    # que no se espera.
    def tablasbasicas
      BASICAS_PROPIAS
    end

    BASICAS_ID_NOAUTO = [ 
      ['Sip', 'tclase'],
      ['Sip', 'trelacion']
    ]

    # Tablas básicas cuyo id no es autoincremental
    def basicas_id_noauto
      BASICAS_ID_NOAUTO
    end

    NOBASICAS_INDSEQID = [
      ['Sip', 'anexo'], 
      ['Sip', 'grupoper'], 
      ['Sip', 'persona'], 
      ['Sip', 'ubicacion'], 
      ['', 'usuario']
    ]


    # Tablas no básicas pero que tienen índice *_seq_id
    def nobasicas_indice_seq_con_id
      NOBASICAS_INDSEQID
    end

    BASICAS_PRIO = [
      ['Sip', 'tclase'], 
      ['Sip', 'pais'], 
      ['Sip', 'departamento'], 
      ['Sip', 'municipio'], 
      ['Sip', 'clase'],
      ['Sip', 'oficina'], 
    ];

    # Tablas básicas que deben volcarse primero --por ser requeridas 
    # por otras básicas
    def tablasbasicas_prio
      BASICAS_PRIO
    end

    # Recibe una tabla básica como pareja [Modulo, clase] y retorna
    # clase completa Modulo::Clase
    def self.tb_clase(t)
      if (t[0] != '') 
        k = t[0] + '::' + t[1].camelize
      else
        k = t[1].camelize
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
    # Util en motores y aplicaciones de prueba
    # En aplicaciones es mejor escribir completo el modelo de autorización
    # para facilitar su análisis y evitar cambios inesperados al actualizar
    # motores
    # @usuario Usuario que hace petición
    def initialize_sip(usuario = nil)
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


      # Sin autenticación puede consultarse DIVIPOLA
      can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
      if !usuario || usuario.fechadeshabilitacion
        return
      end
      can :contar, Sip::Ubicacion
      can :buscar, Sip::Ubicacion
      can :lista, Sip::Ubicacion
      can :descarga_anexo, Sip::Anexo
      can :nuevo, Sip::Ubicacion
      can :read, Sip::Ubicacionpre

      if usuario && usuario.rol then

        can :read, [Sip::Persona]
        case usuario.rol 
        when Ability::ROLANALI
          can [:new, :create, :read, :update], Sip::Orgsocial
          can [:new, :create, :read, :update], Sip::Persona
          can [:new, :create, :read, :update], Sip::Grupoper
          can :read, Sip::Ubicacion
          can :new, Sip::Ubicacion
          can [:update, :create, :destroy], Sip::Ubicacion
          can [:new,:index,:create,:show], ::Usuario, rol: 5
          can [:show,:destroy], ::Usuario, nusuario: usuario.nusuario
        when Ability::ROLADMIN
          can :manage, ::Usuario
          can :manage, Sip::Orgsocial
          can :manage, Sip::Bitacora
          can :manage, Sip::Grupoper
          can :manage, Sip::Persona
          can :manage, Sip::Respaldo7z
          can :manage, Sip::Tema
          can :manage, Sip::Ubicacion
          can :manage, Sip::Ubicacionpre
          can :manage, :tablasbasicas
          self.tablasbasicas.each do |t|
            c = Ability.tb_clase(t)
            can :manage, c
          end
        end
      end
    end

  end
end
