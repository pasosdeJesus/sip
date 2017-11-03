# encoding: UTF-8
module Sip
  class HogarController < ApplicationController

    def tablasbasicas
      #authorize! :manage, :tablasbasicas
      @ntablas = {}
      ab = ::Ability.new
      ab.tablasbasicas.each { |t|
	      puts t[1]
	      k = Ability::tb_clase(t)
	      if can? :create, k
		      n = k.human_attribute_name(t[1].pluralize.capitalize) 
		      r = "admin/#{t[1].pluralize}"
		      @ntablas[n] = r
	      end
      } 
      @ntablasor = @ntablas.keys.localize(:es).sort.to_a
      render layout: 'application'
    end

    def verificarutas
      em = ""
      if !File.directory?(Sip.ruta_anexos) 
      	em += "No existe ruta de anexos '#{Sip.ruta_anexos}'. "
      end
      if !File.directory?(Sip.ruta_volcados) 
      	em += "No existe ruta de volcados '#{Sip.ruta_volcados}'. "
      end
      if em != ''
        flash[:error] = em
      end
    end

    def index
      if current_usuario
        authorize! :contar, Sip::Ubicacion
      end
      verificarutas
      render layout: 'application'
    end

    def acercade
      verificarutas
      render layout: 'application'
    end

    def ayuda_controldeacceso
      verificarutas
      render layout: 'application'
    end


  end
end
