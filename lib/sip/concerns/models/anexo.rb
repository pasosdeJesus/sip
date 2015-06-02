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

          validates :descripcion, presence: true, allow_blank: false, 
            length: { maximum: 1500 } 
          #validates :archivo, length: { maximum: 255 }
          validates :adjunto_file_name, length: { maximum: 255 }
          validates :adjunto_content_type, length: { maximum: 255 }
        end

      end
    end
  end
end

