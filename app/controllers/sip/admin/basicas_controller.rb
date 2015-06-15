# encoding: UTF-8
module Sip
  module Admin
    class BasicasController < ApplicationController
      include BasicasHelpers
      helper BasicasHelpers
      #load_and_authorize_resource debe hacerse en heredadas

      # Despliega listado de registros
      def index(c = nil)
        if (c == nil) 
          c = clase.constantize
        end
        if params[:term] && params[:term] != ''
          term = params[:term]
          consNom = term.downcase.strip #sin_tildes
          consNom.gsub!(/ +/, ":* & ")
          if consNom.length > 0
            consNom += ":*"
          end
          where = " to_tsvector('spanish', unaccent(" +
            c.busca_etiqueta_campos.join(" || ' ' || ") +
            ")) @@ to_tsquery('spanish', ?)";
          # autocomplete de jquery requiere label, val
          c = c.where(where, consNom)
        end
        respond_to do |format|
         format.html {  
           @basica = c.order(camponombre).paginate(
             :page => params[:pagina], per_page: 20
           );
          render layout: 'application'
         }
         format.json {
           @basica = c.order(camponombre)
           render json: @basica
         }
         format.js {
           @basica = c.order(camponombre)
           render json: @basica
         }
        end
      end

      # Despliega detalle de un registro
      def show
        render layout: 'application'
      end

      # Presenta formulario para crear nuevo registro
      def new
        c = clase.constantize
        @basica = clase.constantize.new
        @basica.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
        render layout: 'application'
      end

      # Despliega formulario para editar un regisro
      def edit
        @basica = clase.constantize.find(params[:id])
        render layout: 'application'
      end

      # Crea un registro a partir de información de formulario
      def create
        #c2 = clase.underscore().gsub(/\//, '_')
        c2 = clase.demodulize.underscore
        @basica = clase.constantize.new(send(c2 + '_params'))
        creada = genclase == 'M' ? 'creado' : 'creada';
        respond_to do |format|
          if @basica.save
            format.html { 
              redirect_to admin_basica_path(@basica), 
              notice: clase + " #{creada}."
            }
            format.json { 
              render action: 'show', status: :created, location: @basica
            }
          else
            format.html { render action: 'new', layout: 'application' }
            format.json { 
              render json: @basica.errors, status: :unprocessable_entity 
            }
          end
        end
      end

      # Actualiza un registro con información recibida de formulario
      def update
        actualizada = genclase == 'M' ? 'actualizado' : 'actualizada';
        respond_to do |format|
          c2 = clase.demodulize.underscore
          if @basica.update(send(c2 + "_params"))
            format.html { 
              redirect_to admin_basica_path(@basica), 
              notice: clase + " #{actualizada}." 
            }
            format.json { head :no_content }
          else
            format.html { render action: 'edit', layout: 'application' }
            format.json { 
              render json: @basica.errors, status: :unprocessable_entity 
            }
          end
        end
      end

      # Elimina un registro 
      def destroy
        @basica.destroy
        respond_to do |format|
          format.html { redirect_to admin_basicas_url(@basica) }
          format.json { head :no_content }
        end
      end

      # Nombre de la tabla básica
      def clase 
        "Sip::BasicaCambiar"
      end

      # Genero del nombre (F - Femenino, M - Masculino)
      def genclase
        return 'F';
      end

      # Nombre del campo con nombre que identifica cada registro
      def camponombre
        return :nombre
      end

      # Campos de la tabla
      def atributos_index
        ["id", "nombre", "observaciones", "fechacreacion", "fechadeshabilitacion"]
      end

      # Campos que se esperan del formulario
      def atributos_form
        atributos_index - ["id"]
      end

      helper_method :clase, :atributos_index, :atributos_form, :genclase, :camponombre
    end
  end
end
