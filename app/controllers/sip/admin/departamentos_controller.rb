# encoding: UTF-8
module Sip
  module Admin
    class DepartamentosController < BasicasController
      before_action :set_departamento, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Departamento
  
      def clase
        "Sip::Departamento"
      end

      def index
        c = nil
        if params[:id_pais] && params[:id_pais] != ''
          idpais = params[:id_pais].to_i
          c = Sip::Departamento.where(fechadeshabilitacion:nil,
                                      id_pais: idpais).all
        end
        super(c)
      end  

      def set_departamento
        @basica = Departamento.find(params[:id])
      end
  
      def atributos_index
        [ 
          "id", "nombre", "id_pais", "id_deplocal", "latitud", "longitud", 
          "observaciones", "fechacreacion_localizada", 
          "habilitado"
        ]
      end
  
      def genclase
        return 'M';
      end

      def departamento_params
        params.require(:departamento).permit(*atributos_form)
      end
  
    end
  end
end
