# encoding: UTF-8
module Sip
  class Anexo < ActiveRecord::Base
    has_attached_file :adjunto, 
      :path => Sip.ruta_anexos + "/:id_:filename"
    validates_attachment_content_type :adjunto, 
      :content_type => ['text/plain', /.*/]
    validates_attachment_presence :adjunto

    validates_presence_of :fecha, :descripcion
  end
end
