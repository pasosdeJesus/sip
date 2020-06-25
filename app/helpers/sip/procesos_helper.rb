#encoding: UTF-8 

module Sip
  module ProcesosHelper

    # Retorna lista de procesos que corren en OpenBSD/adJ
    # Cada entrada es un registro con campos:
    #   pid: # de proceso
    #   user: usuario que lo ejecutó
    #   ppid: # de proceso papá
    #   pgid: # de grupo de proceso
    #   sess: apuntador de sesión
    #   jobc: cuenta del control de trabajos
    #   stat: estado
    #   time: tiempo acumulado de CPU
    #   tt: abreviatura de la terminal que controla el proceso
    #   command: orden y argumentos
    def procesos_OpenBSD
      rproc = []
      p=`ps axwwj`
      l=p.split("\n")
      l[1..-1].each do |p|
        pp = p.split(" ")
        rproc.push({
          user: pp[0],
          pid: pp[1].to_i,
          ppid: pp[2].to_i,
          pgid: pp[3].to_i,
          sess: pp[4].to_i,
          jobc: pp[5].to_i,
          stat: pp[6],
          tt: pp[7],
          time: pp[8],
          command: pp[9..-1].join(' ')
        })
      end
      return rproc
    end 
    module_function :procesos_OpenBSD

  end
end
