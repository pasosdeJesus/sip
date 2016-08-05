#encoding: UTF-8 

module Sip
  module FormatoFechaHelper

    # Este ayudador emplea Rails.application.config.x.formato_fecha 
    # al que llama formato local.  
    #
    # Ese formato local es apropiado para la libreria datepicker de Javascript que
    # infortunadamente es diferente a POSIX
    # 
    # El formato estándar es el usado por PostgreSQL año-mes-dia
   

    # Convierte una fecha de formato local a formato estándar
    def fecha_local_estandar f
      if Rails.application.config.x.formato_fecha == 'dd/M/yyyy'
        # Date.strptime(f, '%d-%M-%Y') no ha funcionado, %b debe ser en ingles
        # datepicker produce meses cortos comenzando en mayuscualas.
        # rails-i18n I18n.localize con %b produce mes en minuscula 
        pf = f.split('/')
        if pf.count == 0 
          nf = Date.strptime(f, '%d-%M-%Y').strftime('%Y-%m-%d')
        else
          m = case pf[1].downcase
              when 'ene' 
                1
              when 'feb' 
                2
              when 'mar' 
                3
              when 'abr' 
                4
              when 'may' 
                5
              when 'jun' 
                6
              when 'jul' 
                7
              when 'ago' 
                8
              when 'sep' 
                9
              when 'oct' 
                10
              when 'nov' 
                11
              else 
                12
              end
          nf = Date.new(pf[2].to_i, m, pf[0].to_i).strftime('%Y-%m-%d')
        end
      else
        nf = Date.strptime(f, '%Y-%m-%d').strftime('%Y-%m-%d')
      end
      return nf
    end

    # Convierte una fecha de formato estándar a formato local
    def fecha_estandar_local f
      if Rails.application.config.x.formato_fecha == 'dd/M/yyyy'
        #nf = .strftime('%d/%b/%Y')
        nf = I18n.localize(Date.strptime(f, '%Y-%m-%d'), :format => '%d/%b/%Y')
      else
        nf = Date.strptime(f, '%Y-%m-%d').strftime('%Y-%m-%d')
      end
      return nf
    end


  end
end
