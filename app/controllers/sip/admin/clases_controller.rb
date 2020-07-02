# encoding: UTF-8
module Sip
  module Admin
    class ClasesController < BasicasController
      before_action :set_clase, only: [:show, :edit, :update, :destroy]
      load_and_authorize_resource class: Sip::Clase
  
      def clase 
        "Sip::Clase"
      end
  
      def index
        c = nil
        if params[:id_municipio] && params[:id_municipio].to_i > 0
          idmun = params[:id_municipio].to_i
          c = Sip::Clase.where(
            fechadeshabilitacion:nil,
            id_municipio: idmun).all
        end
        Sip::Municipio.conf_presenta_nombre_con_departamento = true
        super(c)
      end  

      def set_clase
        @basica = Clase.find(params[:id])
      end

      def tipo_clase
        id = params[:id].to_i
        id_tclase = Sip::Clase.find(id).id_tclase
        nombre_tipo = Sip::Tclase.find(id_tclase).nombre
        render json: {nombre: nombre_tipo}
      end
  
      def atributos_index
        [
          :id,  
          :nombre, 
          :pais, 
          :id_municipio, 
          :id_clalocal, 
          :id_tclase, 
          :latitud, 
          :longitud, 
          :observaciones,
          :fechacreacion_localizada, 
          :habilitado
        ]
      end
      
      def ubicaciones
        @ubicaciones = Clase.order(:nombre).where("nombre LIKE ?", "%#{params[:term]}%")
        ## Diccionario de municipios
        @muns = Municipio.order(:nombre).where("nombre LIKE ?", "%#{params[:term]}%")
        @noms_mun = @muns.map(&:nombre)
        @ids_mun = @muns.map(&:id)
        @municipios = Hash[@ids_mun.zip(@noms_mun.map {|i| i.include?(',') ? (i.split /, /) : i})]
        
        ## Diccionario de Paises
        @paisesob = Pais.habilitados.order(:nombre)
        @noms_pais = @paisesob.map(&:nombre)
        @ids_mun = @paisesob.map(&:id)
        @paises = Hash[@ids_mun.zip(@noms_mun.map {|i| i.include?(',') ? (i.split /, /) : i})]
        @departamentosob = Departamento.habilitados
        @noms_departamentos = @departamentosob.map(&:nombre)
        @ids_departeamentos = @departamentosob.map(&:id)
        @departamentos = Hash[@ids_mun.zip(@noms_mun.map {|i| i.include?(',') ? (i.split /, /) : i})]
        @clasesob = Clase.habilitados
        @noms_clases = @departamentosob.map(&:nombre)
        @ids_clases = @departamentosob.map(&:id)
        @clases = Hash[@ids_mun.zip(@noms_mun.map {|i| i.include?(',') ? (i.split /, /) : i})]
        @ubi2 = @clasesob.map{|x| x.nombre + x.municipio.nombre}
        render json: @ubi2
      end
      
      def atributos_form
        Sip::Municipio.conf_presenta_nombre_con_origen = true
        atributos_transf_habilitado - [:id, 'id', :pais, 'pais']
      end
        
      def genclase
        return 'M'; # Centro poblado
      end

      def clase_params
        params.require(:clase).permit(*atributos_form)
      end
  
    end
  end
end
