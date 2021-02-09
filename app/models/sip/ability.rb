# encoding: UTF-8
module Sip
  class Ability
    include CanCan::Ability

    ROLADMIN  = 1
    #ROLINV    = 2
    #ROLDIR    = 3
    #ROLCOOR   = 4
    ROLOPERADOR = ROLANALI  = 5
    #ROLSIST   = 6

    ROLES = [
      ["Administrador", ROLADMIN],  # 1
      ["", 0], # 2
      ["", 0], # 3
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
      ['Sip', 'perfilactorsocial'],
      ['Sip', 'sectoractor'],
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

    # En motores y aplicaciones derivadas models/ability.rb debe
    # tener un initializer que establezca habilidades de CanCanCan
  end
end
