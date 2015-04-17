# encoding: UTF-8
module Sip
  module Concerns
    module Models
      module Anexo
        extend ActiveSupport::Concern

        included do
          has_attached_file :adjunto, 
            :path => Sip.ruta_anexos + "/:id_:filename"
          validates_attachment_content_type :adjunto, 
            :content_type => ['text/plain', /.*/]
          validates_attachment_presence :adjunto

          validates_presence_of :descripcion
        end

      end
    end
  end
end

