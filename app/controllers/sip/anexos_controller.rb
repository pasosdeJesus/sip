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
          redirect_to usuarios_url
        end
      end
    end

    def abre_anexo
      if !params[:id].nil?
        @anexo = Anexo.find(params[:id].to_i)
        ruta = @anexo.adjunto_file_name
        if !ruta.nil?
          # Idea para evitar inyeccion de https://www.ruby-forum.com/topic/124471
          n=sprintf(Sip.ruta_anexos.to_s + "/%d_%s", @anexo.id.to_i, 
                    File.basename(ruta))
          logger.debug "Descargando #{n}"
          send_file n, disposition: :inline
        else
          redirect_to usuarios_url
        end
      end
    end

    def mostrar_portada
      if !params[:id].nil?
        @anexo = Anexo.find(params[:id].to_i)
        ruta = @anexo.adjunto_file_name
        pdfp=sprintf(Sip.ruta_anexos.to_s + "/%d_%s", @anexo.id.to_i, 
                  File.basename(ruta))
        p `pdftoppm -png -f 1 -l 1 "#{pdfp}" "#{pdfp[..-5]}"`
        ruta_im = pdfp[..-5] + "-1.png"
        logger.debug "Descargando #{ruta_im}"
        send_file ruta_im, x_sendfile: true
      end
    end

  end
end
