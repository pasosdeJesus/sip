# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module OrgsocialesController
        extend ActiveSupport::Concern

        included do

          before_action :set_orgsocial, only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource class: Sip::Orgsocial


          def clase
            "Sip::Orgsocial"
          end

          def genclase
            return 'F'
          end

          def atributos_index
            [ :id, 
              :grupoper_id,
              { :sectororgsocial_ids => [] },
              { :orgsocial_persona => [] },
              :web,
              :habilitado,
              :created_at_localizada
            ]
          end

          def atributos_show
            [ :id, 
              :grupoper_id,
              { :sectororgsocial_ids => [] },
              { :orgsocial_persona =>  [] },
              :web,
              :pais_id,
              :direccion,
              :telefono,
              :fax,
              :created_at_localizada,
              :fechadeshabilitacion_localizada
            ]
          end


          def atributos_form
            a = atributos_show - [:id, :created_at_localizada]
            a[a.index(:grupoper_id)] = :grupoper
            return a
          end

          def index(c = nil)
            if c == nil
              c = Sip::Orgsocial.all
            end
            super(c)
          end

          def set_orgsocial
            @orgsocial = Sip::Orgsocial.find(params[:id])
            @registro = @orgsocial
          end

          def orgsocial_params
            params.require(:orgsocial).permit(
              atributos_form - [:grupoper] +
              [ :pais_id,
                :grupoper_attributes => 
                [
                  :id,
                  :nombre,
                  :anotaciones 
                ],
                :orgsocial_persona_attributes => 
                [
                  :id,
                  :perfilorgsocial_id,
                  :correo,
                  :_destroy,
                  :persona_attributes => 
                  [
                    :id,
                    :nombres,
                    :apellidos,
                    :sexo
                  ]
                ]
              ]) 
          end

        end #included

      end
    end
  end
end

