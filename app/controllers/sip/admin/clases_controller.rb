# encoding: UTF-8
module Sip
  module Admin
    class ClasesController < BasicasController
      before_action :set_clase, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Clase
  
      def clase 
        "Sip::Clase"
      end
  
      def set_clase
        @basica = Clase.find(params[:id])
      end
  
      def atributos_index
        [ 
          "id", "nombre", "id_municipio", "id_clalocal",
          "id_tclase", "latitud", "longitud", 
          "fechacreacion", "fechadeshabilitacion"
        ]
      end
  
      def atributos_form
        atributos_index
      end
  
      def genclase
        return 'F';
      end

      def clase_params
        params.require(:clase).permit(*atributos_form)
      end
  
    end
  end
end
