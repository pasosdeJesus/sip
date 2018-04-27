# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module ModelosController

        extend ActiveSupport::Concern

        included do
          include ModeloHelper
          helper ModeloHelper

          # Permite modificar params
          def prefiltrar()
          end

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
            c.reorder([:id])
          end

          def index_plantillas
          end

          # Listado de registros
          def index(c = nil)
            if (c != nil)
              if c.class.to_s.end_with?('ActiveRecord_Relation')
                if clase.constantize.to_s != c.klass.to_s
                  puts "No concuerdan #{clase.constantize.to_s} y " +
                    "klass #{c.klass.to_sclase}"
                  return
                end
              elsif clase.constantize.to_s != c.class.to_s
                puts "No concuerdan #{clase.constantize.to_s} y class #{c.class.to_s}"
                return
              end
            else
              c = clase.constantize
            end

            c = c.accessible_by(current_ability)
            if c.count == 0 && cannot?(:index, c)
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :read, c
            end

            # Filtro
            prefiltrar()
            # Autocompletar
            if params && params[:term] && params[:term] != ''
              term = params[:term]
              consNom = term.downcase.strip #sin_tildes
              consNom.gsub!(/ +/, ":* & ")
              if consNom.length > 0
                consNom += ":*"
              end
              #  El caso de uso tipico es autocompletación
              #  por lo que no usamos diccionario en español para evitar
              #  problemas con algoritmo de raices.
              where = " to_tsvector('simple', unaccent(" +
                c.busca_etiqueta_campos.join(" || ' ' || ") +
                ")) @@ to_tsquery('simple', ?)";
              c = c.where(where, consNom)
            end
            if params && params[:filtro]
              c = filtrar(c, params[:filtro])
            end

            c = index_reordenar(c)
            index_plantillas

            respond_to do |format|
              format.html {  
                @registros = @registro = c.paginate(
                  :page => params[:pagina], per_page: 20
                );
                render :index, layout: 'layouts/application'
                return
              }
              @registros = @registro = c.all
              if params[:filtro] && params[:filtro][:presenta_nombre] &&
                params[:filtro][:presenta_nombre] == "1"
                regjson = @registros.map {|r| 
                  {id: r.id, presenta_nombre: r.presenta_nombre()}
                }
              else
                regjson = @registros
              end
              format.json {
                render :index, json: regjson
                return
              }
              format.js {
                if params[:_sip_enviarautomatico] 
                  @registros = @registro = c.paginate(
                    :page => params[:pagina], per_page: 20
                  );
                  render :index, layout: 'layouts/application'
                else
                  render :index, json: regjson
                end
                return
              }
              index_otros_formatos(format, params)
            end
          end

          # Despliega detalle de un registro
          def show
            @registro = clase.constantize.find(params[:id])
            if cannot? :show, @registro
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :read, @registro
            end
            render layout: 'application'
          end

          # Presenta formulario para crear nuevo registro
          def new
            if cannot? :new, clase.constantize
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :create, clase.constantize
            end
            @registro = clase.constantize.new
            if @registro.respond_to?(:fechacreacion)
              @registro.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
            end
            render layout: 'application'
          end

          # Despliega formulario para editar un regisro
          def edit
            @registro = clase.constantize.find(params[:id])
            if cannot? :edit, clase.constantize
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :update, @registro
            end
            render layout: 'application'
          end

          # Crea un registro a partir de información de formulario
          def create_gen(registro = nil)
            c2 = clase.demodulize.underscore
            if registro
              @registro = registro
            else
              @registro = clase.constantize.new(send(c2 + '_params'))
            end
            if @registro.respond_to?(:fechacreacion)
              @registro.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
            end
            authorize! :create, @registro
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


          def create
            authorize! :new, clase.constantize
            create_gen
          end

          # Actualiza un registro con información recibida de formulario
          def update_gen(registro = nil)
            if registro
              @registro = registro
            else
              @registro = clase.constantize.find(params[:id])
            end
            authorize! :update, @registro
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

          def update
            update_gen
          end

          # Elimina un registro 
          def destroy(mens = "", verifica_tablas_union=true)
            @registro = clase.constantize.find(params[:id])
            authorize! :destroy, @registro
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
                redirect_back fallback_location: main_app.root_path, 
                  flash: {error: mens}
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
            ["id", 
             "fechacreacion_localizada", 
             "fechadeshabilitacion_localizada"
            ]
          end

          # Campos que se presentar en formulario
          def atributos_form
            atributos_index - ["id"]
          end

          # Campos por mostrar en presentación de un registro
          def atributos_show
            atributos_index
          end

          # Campos por retornar como API JSON
          def atributos_show_json
            atributos_show
          end

          helper_method :clase, :atributos_index, :atributos_form, 
            :atributos_show, :atributos_show_json, :genclase

        end # included

      end
    end
  end
end

