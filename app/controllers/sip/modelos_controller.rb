# encoding: UTF-8
module Sip
  class ModelosController < ApplicationController
    include ModeloHelper
    helper ModeloHelper
    #load_and_authorize_resource debe hacerse en heredadas

    def filtrar(reg, params_filtro)
      for ai in atributos_index do
        i = Sip::ModeloHelper.nom_filtro(ai)
        if params_filtro["bus#{i}"] && 
          params_filtro["bus#{i}"] != '' &&
          reg.respond_to?("filtro_#{i.to_s}")
          reg = reg.send("filtro_#{i.to_s}", params_filtro["bus#{i}"])
        else 
          if params_filtro["bus#{i}ini"] && 
            params_filtro["bus#{i}ini"] != '' &&
            reg.respond_to?("filtro_#{i.to_s}ini")
            reg = reg.send("filtro_#{i.to_s}ini", 
                           params_filtro["bus#{i}ini"])
          end
          if params_filtro["bus#{i}fin"] && 
            params_filtro["bus#{i}fin"] != '' &&
            reg.respond_to?("filtro_#{i.to_s}fin")
            reg = reg.send("filtro_#{i.to_s}fin", 
                           params_filtro["bus#{i}fin"])
          end
        end
      end
      return reg
    end

    def index_otros_formatos(format, params)
      return
    end

    def index_reordenar(c)
      c.reorder([:nombre])
    end

    # Despliega listado de registros
    def index(c = nil)
      if (c == nil) 
        c = clase.constantize
      end
      if params && params[:filtro]
        c = filtrar(c, params[:filtro])
      end
      c = index_reordenar(c)
      respond_to do |format|
       format.html {  
         @registros = @registro = c.paginate(
           :page => params[:pagina], per_page: 20
         );
        render :index, layout: 'layouts/application'
        return
       }
       @registros = @registro = c.all
       format.json {
         render :index, json: @registro
         return
       }
       format.js {
         render :index, json: @registro
         return
       }
       index_otros_formatos(format, params)
      end
    end

    # Despliega detalle de un registro
    def show
      @registro = clase.constantize.find(params[:id])
      render layout: 'application'
    end

    # Presenta formulario para crear nuevo registro
    def new
      @registro = clase.constantize.new
      render layout: 'application'
    end

    # Despliega formulario para editar un regisro
    def edit
      @registro = clase.constantize.find(params[:id])
      render layout: 'application'
    end

    # Crea un registro a partir de información de formulario
    def create
      c2 = clase.demodulize.underscore
      @registro = clase.constantize.new(send(c2 + '_params'))
      creada = genclase == 'M' ? 'creado' : 'creada';
      respond_to do |format|
        if @registro.save
          format.html { 
            redirect_to modelo_path(@registro), 
            notice: clase + " #{creada}."
          }
          format.json { 
            render action: 'show', status: :created, location: @registro
          }
        else
          @registro.id = nil; # Volver a elegir Id
          format.html { render action: 'new', layout: 'application' }
          format.json { 
            render json: @registro.errors, status: :unprocessable_entity 
          }
        end
      end
    end

    # Actualiza un registro con información recibida de formulario
    def update
      @registro = clase.constantize.find(params[:id])
      actualizada = genclase == 'M' ? 'actualizado' : 'actualizada';
      respond_to do |format|
        c2 = clase.demodulize.underscore
        if @registro.update(send(c2 + "_params"))
          format.html { 
            redirect_to modelo_path(@registro), 
            notice: clase + " #{actualizada}." 
          }
          format.json { head :no_content }
        else
          format.html { render action: 'edit', layout: 'application' }
          format.json { 
            render json: @registro.errors, status: :unprocessable_entity 
          }
        end
      end
    end

    # Elimina un registro 
    def destroy(mens = "", verifica_tablas_union=true)
      @registro = clase.constantize.find(params[:id])
      if verifica_tablas_union && @registro.class.columns_hash
        m = @registro.class.reflect_on_all_associations(:has_many)
        m.each do |r|
          if !r.options[:through]
            rel = @registro.send(r.name)
            if (rel.count > 0) 
              nom = @registro.class.human_attribute_name(r.name)
              mens += " Hay #{rel.count} elementos relacionados en " +
                " la tabla #{nom}, no puede eliminarse aún. "
            end
          end
        end
        if mens != ''
          redirect_to(:back, {:flash => { :error => mens }})
          return
        end
      end
      @registro.destroy
      eliminada = genclase == 'M' ? 'eliminado' : 'eliminada';
      respond_to do |format|
        format.html { redirect_to modelos_url(@registro),
          notice: clase + " #{eliminada}." }
        format.json { head :no_content }
      end
    end

    # Nombre del modelo 
    def clase 
      "Sip::BasicaCambiar"
    end

    # Genero del modelo (F - Femenino, M - Masculino)
    def genclase
      return 'F';
    end

    # Campos de la tabla por presentar en listado 
    def atributos_index
      ["id", "nombre", "observaciones", 
       "fechacreacion_localizada", "fechadeshabilitacion_localizada"]
    end

    # Campos que se presentar en formulario
    def atributos_form
      atributos_index - ["id"]
    end

    # Campos por mostrar en presentación de un registro
    def atributos_show
      atributos_index
    end

    helper_method :clase, :atributos_index, :atributos_form, :atributos_show,
      :genclase
  end
end
