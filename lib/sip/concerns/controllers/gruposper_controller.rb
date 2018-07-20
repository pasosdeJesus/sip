# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module GruposperController

        extend ActiveSupport::Concern

        included do
          include ActionView::Helpers::AssetUrlHelper

          # Busca y lista gruposper para autocompletación
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
              where = " to_tsvector('spanish', unaccent(grupoper.nombre)) @@ " +
                "to_tsquery('spanish', '#{consNomvic}')";

              partes = [
                'nombre'
              ]
              s = "";
              l = " grupoper.id ";
              seps = "";
              sepl = " || ';' || ";
              partes.each do |p|
                s += seps + p;
                l += sepl + "char_length(#{p})";
                seps = " || ' ' || ";
              end
              qstring = "SELECT TRIM(nombre) AS value, grupoper.id AS id 
                FROM sip_grupoper AS grupoper
                WHERE #{where} ORDER BY 1";
                r = ActiveRecord::Base.connection.select_all qstring
                respond_to do |format|
                  format.json { render :json, inline: r.to_json }
                end
            end
          end


          # Remplaza grupoper por elejido en autocompletación
          def remplazar
          end

        end # include


      end
    end
  end
end
