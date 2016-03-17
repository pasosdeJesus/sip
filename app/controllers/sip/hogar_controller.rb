# encoding: UTF-8
module Sip
  class HogarController < ApplicationController

    def tablasbasicas
      #authorize! :manage, :tablasbasicas
      @ntablas = {}
      ::Ability::tablasbasicas.each { |t|
	      puts t[1]
	      k = Ability::tb_clase(t)
	      if can? :manage, k
		      n = k.human_attribute_name(t[1].pluralize.capitalize) 
		      r = "admin/#{t[1].pluralize}"
		      @ntablas[n] = r
	      end
      } 
      @ntablasor = @ntablas.keys.localize(:es).sort.to_a
      render layout: 'application'
    end

    def index
      if current_usuario
        authorize! :contar, Sip::Ubicacion
      end
      render layout: 'application'
    end

    def acercade
      render layout: 'application'
    end

  end
end
