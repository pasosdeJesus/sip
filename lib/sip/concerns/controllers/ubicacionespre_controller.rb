# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module UbicacionespreController

        extend ActiveSupport::Concern

        included do

          before_action :set_persona, only: [:show, :edit, :update, :destroy]
          load_and_authorize_resource class: Sip::Persona

          def clase
            "Sip::Ubicacionpre"
          end

          def genclase
            return 'F'
          end

          def atributos_index
            [ :id, 
              :nombre,
              :pais,
              :departamento,
              :municipio,
              :clase,
              :lugar,
              :sitio,
              :tsitio,
              :latitud,
              :longitud
            ]
          end

          def atributos_show
            atributos_index - [:habilitado] + 
              [:fechadeshabilitacion_localizada]
          end

          def atributos_form
            a = atributos_show - [:id]
            a[a.index(:grupoper_id)] = :grupoper
            return a
          end

          def mundep
            if params[:term]
              term = Sip::Ubicacion.connection.quote_string(params[:term])
              consNomubi = term.downcase.strip #sin_tildes
              consNomubi.gsub!(/ +/, ":* & ")
              if consNomubi.length > 0
                consNomubi+= ":*"
              end
              # Usamos la funcion f_unaccent definida con el indice
              # en db/migrate/20200916022934_indice_ubicacionpre.rb
              where = " to_tsvector('spanish', " +
                "f_unaccent(ubicacionpre.nombre_sin_pais)) " +
                "@@ to_tsquery('spanish', '#{consNomubi}')";
      
              cons = "SELECT TRIM(nombre_sin_pais) AS value, id AS id " +
                "FROM public.sip_ubicacionpre AS ubicacionpre " +
                "WHERE #{where} AND pais_id=170 " +
                "AND clase_id IS NULL AND departamento_id IS NOT NULL " +
                " ORDER BY 1";
      
              r = ActiveRecord::Base.connection.select_all cons
              respond_to do |format|
                format.json { render :json, inline: r.to_json }
                format.html { render inline: 'No responde con parametro term' }
              end
            end
          end

          def index(c = nil)
            if c == nil
              c = Sip::Ubicacionpre.all
            end
            if params[:term]
              term = Sip::Ubicacion.connection.quote_string(params[:term])
              consNomubi = term.downcase.strip #sin_tildes
              consNomubi.gsub!(/ +/, ":* & ")
              if consNomubi.length > 0
                consNomubi+= ":*"
              end
              # Usamos la funcion f_unaccent definida con el indice
              # en db/migrate/20200916022934_indice_ubicacionpre.rb
              where = " to_tsvector('spanish', f_unaccent(ubicacionpre.nombre)) " +
                "@@ to_tsquery('spanish', '#{consNomubi}')";
      
              cons = "SELECT TRIM(nombre) AS value, id AS id " +
                "FROM public.sip_ubicacionpre AS ubicacionpre " +
                "WHERE #{where} ORDER BY 1";
      
              r = ActiveRecord::Base.connection.select_all cons
              respond_to do |format|
                format.json { render :json, inline: r.to_json }
                format.html { render inline: 'No responde con parametro term' }
              end
            else
              super(c)
            end
          end

          def set_ubicacionpre
            @ubicacionpre = Sip::Ubicacionpre.find(params[:id])
            @registro = @ubicacionpre
          end

          def ubicacionpre_params
            params.require(:ubicacionpre).permit(
              atributos_form 
            ) 
          end

        end
      end
    end
  end
end
