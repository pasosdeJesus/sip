
module Sip
  module Concerns
    module Controllers
      module PersonasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          before_action :set_persona, only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource class: Sip::Persona

          def clase
            "Sip::Persona"
          end

          def genclase
            return 'F'
          end

          def atributos_show_sip
            [ :id, 
              :nombres,
              :apellidos,
              :anionac,
              :mesnac,
              :dianac,
              :sexo,
              :pais,
              :departamento,
              :municipio,
              :clase,
              :nacionalde,
              :tdocumento,
              :numerodocumento
            ]
          end

          def atributos_show
            self.atributos_show_sip
          end

          def atributos_index
            atributos_show
          end

          def atributos_form
            a = atributos_show - [:id]
            return a
          end

          def index_sip(c = nil)
            if c == nil
              c = Sip::Persona.all
            end
            if params[:term]
              # usado en autocompletación limitado a 10
              term = Sip::Ubicacion.connection.quote_string(params[:term])
              consNomvic = term.downcase.strip #sin_tildes
              consNomvic.gsub!(/ +/, ":* & ")
              if consNomvic.length > 0
                consNomvic += ":*"
              end
              where = " to_tsvector('spanish', unaccent(persona.nombres) " +
                " || ' ' || unaccent(persona.apellidos) " +
                " || ' ' || COALESCE(persona.numerodocumento::TEXT, '')) @@ " +
                "to_tsquery('spanish', '#{consNomvic}')";

              partes = [
                'nombres',
                'apellidos',
                'COALESCE(numerodocumento::TEXT, \'\')'
              ]
              s = "";
              l = " persona.id ";
              seps = "";
              sepl = " || ';' || ";
              partes.each do |p|
                s += seps + p;
                l += sepl + "char_length(#{p})";
                seps = " || ' ' || ";
              end
              qstring = "SELECT TRIM(#{s}) AS value, #{l} AS id 
              FROM public.sip_persona AS persona
              WHERE #{where} ORDER BY 1 LIMIT 10";

              r = ActiveRecord::Base.connection.select_all qstring
              respond_to do |format|
                format.json { render :json, inline: r.to_json }
                format.html { render inline: 'No responde con parametro term' }
              end
            else
              super(c)
            end
          end

          def index(c = nil)
            index_sip(c)
          end

          # Remplaza persona por la elegida por el usuario en autocompletación
          def remplazar
          end

          # API
          def datos
            return if !params[:id_persona] 
            @persona = Sip::Persona.find(params[:id_persona].to_i)
            authorize! :read, @persona
            oj = { 
              id: @persona.id,
              nombres: @persona.nombres,
              apellidos: @persona.apellidos,
              sexo: @persona.sexo,
              tdocumento: @persona.tdocumento ? @persona.tdocumento.sigla :
               '',
              numerodocumento: @persona.numerodocumento,
              dianac: @persona.dianac,
              mesnac: @persona.mesnac,
              anionac: @persona.anionac 
            }
            ## Si está autocompletando una persona de orgsocial persona
            # entonces autcompletar cargo y correo
            if params[:ac_orgsocial_persona]
              orgsocial_persona = Sip::OrgsocialPersona.find_by(persona_id: @persona.id)
              if orgsocial_persona
                oj[:cargo] = orgsocial_persona.cargo 
                oj[:correo] = orgsocial_persona.cargo 
              end
            end
            respond_to do |format|
              format.json { render json: oj, status: :ok }
              format.html { render inilne: oj.to_s, status: :ok }
            end
          end

          def set_persona
            @persona = Sip::Persona.find(params[:id])
            @registro = @persona
          end

          def listaparams
            atributos_form + [
              :id_pais,
              :id_departamento,
              :id_municipio,
              :id_clase,
              :tdocumento_id
            ]
          end

          def persona_params
            params.require(:persona).permit(listaparams)
          end


        end # include

        class_methods do
        end



      end
    end
  end
end
