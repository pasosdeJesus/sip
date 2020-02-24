#encoding: UTF-8 

module Sip
  module ProcesosHelper

    # Retorna lista de procesos que corren en OpenBSD/adJ
    # Cada entrada es un registro con campos:
    #   pid: # de proceso
    #   tt: abreviatur de la terminal que controla el proceso
    #   stat: estado
    #   command: orden y argumentos
    def procesos_OpenBSD
      rproc = []
      p=`ps axww`
      l=p.split("\n")
      l.each do |p|
        pp = p.split(" ")
        rproc.push({
          pid: pp[0],
          tt: pp[1],
          stat: pp[2],
          time: pp[3],
          command: pp[4..-1].join(' ')
        })
      end
      return rproc
    end 
    module_function :procesos_OpenBSD

  end
end
