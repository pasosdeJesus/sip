#encoding: UTF-8 

module Sip
  module FormatoFechaHelper

    # Este ayudador emplea Rails.application.config.x.formato_fecha 
    # al que llama formato local.  
    #
    # Ese formato local es apropiado para la libreria datepicker de 
    # Javascript que infortunadamente es diferente a POSIX
    # Por el momento soporta bien:
    # dd-M-yyyy, dd/M/yyyy, dd-mm-yyyy y yyyy-mm-ddd
    # 
    # El formato estándar es el usado por PostgreSQL yyyy-mm-dd
   

    # Convierte una fecha de formato local a formato estándar
    def fecha_local_estandar f
      if !f 
        return nil
      end
      if f == ''
        return ''
      end
      case Rails.application.config.x.formato_fecha
      when 'dd/M/yyyy', 'dd-M-yyyy'
        # Date.strptime(f, '%d-%M-%Y') no ha funcionado, 
        # %b debe ser en ingles
        # datepicker produce meses cortos comenzando en mayúsculas.
        # rails-i18n I18n.localize con %b produce mes en minuscula 
        pf = f.split('/')
        if pf.count == 0 
          pf = f.split('-')
        end
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
      when 'dd/mm/yyyy'
        nf = Date.strptime(f, '%d-%m-%Y').strftime('%Y-%m-%d')
      else
        nf = Date.strptime(f, '%Y-%m-%d').strftime('%Y-%m-%d')
      end
      return nf
    end


    # Convierte una fecha de formato estándar a formato local
    def fecha_estandar_local f
      if !f || f == ''
        return nil
      end
      case Rails.application.config.x.formato_fecha 
      when 'dd/M/yyyy'
        nf = I18n.localize(Date.strptime(f, '%Y-%m-%d'), 
                           :format => '%d/%b/%Y')
      when 'dd-M-yyyy'
        nf = I18n.localize(Date.strptime(f, '%Y-%m-%d'), 
                           :format => '%d-%b-%Y')
      when 'dd-mm-yyyy'
        nf = Date.strptime(f, '%Y-%m-%d').strftime('%d-%m-%Y')
      else
        nf = Date.strptime(f, '%Y-%m-%d').strftime('%Y-%m-%d')
      end
      return nf
    end


  end
end
