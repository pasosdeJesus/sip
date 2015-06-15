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
          "fechacreacion", "fechadeshabilitacion"
        ]
      end
      
      def genclase
        return 'M';
      end
  
      def municipio_params
        params.require(:municipio).permit( *atributos_form)
      end
  
    end
  end
end
