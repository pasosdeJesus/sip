module Sip
  module Concerns
    module Controllers
      module OrgsocialesController
        extend ActiveSupport::Concern

        included do

          def clase
            "Sip::Orgsocial"
          end

          def genclase
            return 'F'
          end

          def atributos_index
            [ :id, 
              :grupoper_id,
              :tipoorg_id,
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
              :tipoorg_id,
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

          def update
            if params && params[:orgsocial] && 
                params[:orgsocial][:orgsocial_persona_attributes]
              op_params = params[:orgsocial][:orgsocial_persona_attributes]
              op_params.each do |clave, valor|
                if valor[:id] == ""
                  op = Sip::OrgsocialPersona.create(
                    correo: valor[:correo],
                    orgsocial_id: @registro.id,
                    perfilorgsocial_id: valor[:perfilorgsocial_id],
                    cargo: valor[:cargo],
                    persona_id: valor[:persona_attributes][:id]
                  )
                  valor[:id] = op.id.to_s
                end
              end
            end
            update_gen(@registro)
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
                  :cargo,
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

