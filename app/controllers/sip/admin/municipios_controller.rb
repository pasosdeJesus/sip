# encoding: UTF-8
module Sip
  module Admin
    class MunicipiosController < BasicasController
      before_action :set_municipio, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Municipio
  
      def clase 
        "Sip::Municipio"
      end
 
      def index
        c = nil
        if params[:id_departamento] && params[:id_departamento].to_i > 0
          iddep  = params[:id_departamento].to_i
          c = Sip::Municipio.where(
            fechadeshabilitacion:nil,
            id_departamento: iddep).all
        end
        super(c)
      end  

      def set_municipio
        @basica = Municipio.find(params[:id])
      end
  
      def atributos_index
        ["id",  "nombre", "id_departamento", "id_munlocal", 
          "latitud", "longitud", "observaciones",
          "fechacreacion_localizada", "fechadeshabilitacion_localizada"
        ]
      end
      
      def genclase
        return 'M';
      end
  
      def municipio_params
        params.require(:municipio).permit( *atributos_form)
      end

      # Para responder a solicitudes AJAX de autocompletación de
      # municipio / departamento
      def mundep
        if !params[:term]
          respond_to do |format|
            format.html { render inline: 'Falta variable term' }
            format.json { render inline: 'Falta variable term' }
          end
        else
          term = Sip::Municipio.connection.quote_string(params[:term])
          consNom = term.downcase.strip #sin_tildes
          consNom.gsub!(/ +/, ":* & ")
          if consNom.length > 0
            consNom += ":*"
          end
          # autocomplete de jquery requiere label, val
          consc = ActiveRecord::Base.send(:sanitize_sql_array, [
            "SELECT nombre as label, idlocal as value
                FROM sip_mundep 
                WHERE mundep  @@ to_tsquery('spanish', ?) ORDER BY 1;",
                consNom])
          r = ActiveRecord::Base.connection.select_all consc
          respond_to do |format|
            format.json { render :json, inline: r.to_json }
          end
        end
      end
      
    end
  end
end
