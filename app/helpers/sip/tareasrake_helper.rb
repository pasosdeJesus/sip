#encoding: UTF-8 

module Sip
  module TareasrakeHelper

    # Nombre de archivo con copia de volcado de base de hoy
    def nombre_volcado(ruta_volcados)
      dia = DateTime.now.strftime('%d') 
      abcs = ActiveRecord::Base.configurations
      return ruta_volcados + "/" + abcs[Rails.env][:database] +
        "-" + dia + ".sql"
    end
    module_function :nombre_volcado

    # http://stackoverflow.com/questions/2108727/which-in-ruby-checking-if-program-exists-in-path-from-ruby
    def which(cmd)
      exts = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : ['']
      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
        exts.each { |ext|
          exe = File.join(path, "#{cmd}#{ext}")
          return exe if File.executable?(exe) && !File.directory?(exe)
        }
      end
      return nil
    end
    module_function :which


  end
end
