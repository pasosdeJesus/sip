# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module PersonasController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          # Busca y lista persona(s) para autocompletación
          def index
            if !params[:term]
              respond_to do |format|
                format.html { render inline: 'Falta variable term' }
                format.json { render inline: 'Falta variable term' }
              end
            else
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
              FROM sip_persona AS persona
              WHERE #{where} ORDER BY 1";

              r = ActiveRecord::Base.connection.select_all qstring
              respond_to do |format|
                format.json { render :json, inline: r.to_json }
              end
            end
          end

          # Remplaza persona por la elejida por el usuario en autocompletación
          def remplazar
          end

        end # include

      end
    end
  end
end
