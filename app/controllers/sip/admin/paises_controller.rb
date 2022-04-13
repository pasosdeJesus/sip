module Sip
  module Admin
    class PaisesController < BasicasController
      before_action :set_pais, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Pais
  
      def clase 
        "Sip::Pais"
      end
  
      def set_pais
        @basica = Pais.find(params[:id])
      end
  
      def atributos_index
        [ :id, 
          :nombre, 
          :nombreosm, 
          :latitud, 
          :longitud, 
          :alfa2, 
          :alfa3, 
          :codiso, 
          :nombreiso_ingles,
          :nombreiso_frances,
          :div1, 
          :div2, 
          :div3, 
          :observaciones,
          :fechacreacion_localizada, 
          :habilitado
        ]
      end

      def atributos_form
        atributos_transf_habilitado
      end
     
      def genclase
        return 'M';
      end
  
      def pais_params
        params.require(:pais).permit(*atributos_form)
      end
  
    end
  end
end
