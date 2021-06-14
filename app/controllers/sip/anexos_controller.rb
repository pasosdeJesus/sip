module Sip
  class AnexosController < ApplicationController
    load_and_authorize_resource class: Sip::Anexo

    def descarga_anexo
      if !params[:id].nil?
        @anexo = Anexo.find(params[:id].to_i)
        ruta = @anexo.adjunto_file_name
        if !ruta.nil?
          # Idea para evitar inyeccion de https://www.ruby-forum.com/topic/124471
          n=sprintf(Sip.ruta_anexos.to_s + "/%d_%s", @anexo.id.to_i, 
                    File.basename(ruta))
          logger.debug "Descargando #{n}"
          send_file n, x_sendfile: true
        else
          redirect_to casos_url
        end
      end
    end
  end
end
