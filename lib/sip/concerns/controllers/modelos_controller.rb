# encoding: UTF-8

module Sip
  module Concerns
    module Controllers
      module ModelosController

        extend ActiveSupport::Concern

        included do
          include ModeloHelper
          helper ModeloHelper

          # Deben registrarse en Sip::Bitacora usos de este controlador
          def registrar_en_bitacora
            return false
          end

          # Permite modificar params
          def prefiltrar()
          end

          def nom_filtro(ai)
            Sip::ModeloHelper.nom_filtro(ai)
          end

          # Filtra por control de acceso
          def filtrar_ca(reg)
            return reg
          end

          def filtrar(reg, params_filtro)
            # Control para fecha podría no estar localizado aunque
            # campos por presentar si
            latr = atributos_index.map {|a|
              a.to_s.end_with?('_localizada') ? 
                [a, a.to_s.chomp('_localizada')] : [a]
            }.flatten
            quedan = params_filtro.keys
            for ai in latr do
              i = nom_filtro(ai)
              if params_filtro["bus#{i}"] && 
                params_filtro["bus#{i}"] != '' &&
                reg.respond_to?("filtro_#{i.to_s}")
                reg = reg.send("filtro_#{i.to_s}", params_filtro["bus#{i}"])
                quedan -= ["bus#{i}"]
              else 
                if params_filtro["bus#{i}ini"] && 
                  params_filtro["bus#{i}ini"] != '' &&
                  reg.respond_to?("filtro_#{i.to_s}ini")
                  reg = reg.send("filtro_#{i.to_s}ini", 
                                 params_filtro["bus#{i}ini"])
                  quedan -= ["bus#{i}ini"]
                end
                if params_filtro["bus#{i}fin"] && 
                  params_filtro["bus#{i}fin"] != '' &&
                  reg.respond_to?("filtro_#{i.to_s}fin")
                  reg = reg.send("filtro_#{i.to_s}fin", 
                                 params_filtro["bus#{i}fin"])
                  quedan -= ["bus#{i}ini"]
                end
              end
            end
            # También puede filtrarse por una o más identificaciones
            # por ejemplo con un URL con parámetro filtro[ids]=3,4
            if params_filtro['ids']
              lids1 = params_filtro['ids'].split(',')
              lids = lids1.map { |id| id.to_i }
              if lids.length > 0 && lids[0] > 0
                reg = reg.where("id IN (?)", lids)
              end
              quedan -= ["ids"]
            end
            quedan2 = params_filtro.clone.delete_if do |l, v| 
              v == '' || !quedan.include?(l)
            end
            if reg.respond_to?("filtrar_alterno")
              reg = reg.filtrar_alterno(quedan2)
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
          def index_sip(c = nil)
            if (c != nil)
              if c.class.to_s.end_with?('ActiveRecord_Relation')
                if clase.constantize.to_s != c.klass.to_s
                  puts "No concuerdan #{clase.constantize.to_s} y " +
                    "klass #{c.klass.to_s}"
                  #return
                end
              elsif clase.constantize.to_s != c.class.to_s
                puts "No concuerdan #{clase.constantize.to_s} y class #{c.class.to_s}"
                #return
              end
            else
              c = clase.constantize
            end

            c = c.accessible_by(current_ability)
            if c.count == 0 && cannot?(:index, clase.constantize)
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              if cannot?(:read, clase.constantize)
                redirect_to main_app.root_path
                return
              end
              #authorize! :read, clase.constantize
            end

            # Cambiar params
            prefiltrar()
            # Prefiltrar de acuerdo a control de acceso
            c = filtrar_ca(c)
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

            c = index_reordenar(c) if c
            index_plantillas

            respond_to do |format|
              if registrar_en_bitacora
                Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                                request.url, params, self.clase,
                                0,  'listar', '')
              end
              format.html {  
                @registros = @registro = c ? c.paginate(
                  :page => params[:pagina], per_page: 20
                ) : nil;
                render :index, layout: 'layouts/application'
                return
              }
              @registros = @registro = c ? c.all : nil
              if params &&
                  ((params[:presenta_nombre] && 
                    params[:presenta_nombre] == "1") ||
                   (params[:filtro] && params[:filtro][:presenta_nombre] &&
                    params[:filtro][:presenta_nombre] == "1")) && @registros
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
                  @registros = @registro = c ? c.paginate(
                    :page => params[:pagina], per_page: 20
                  ) : nil;
                  render :index, layout: 'layouts/application'
                else
                  render :index, json: regjson
                end
                return
              }
              index_otros_formatos(format, params)
            end
          end

          # Listado de registros
          def index(c = nil)
            index_sip(c)
          end

          def show_plantillas
          end


          # Despliega detalle de un registro
          def show
            @registro = clase.constantize.find(params[:id])
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            if cannot? :show, @registro
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :read, @registro
            end
            c2 = clase.demodulize.underscore
            eval "@#{c2} = @registro" 
            show_plantillas
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, @registro.class.to_s,
                              @registro.id,  'presentar', '')
            end

            render layout: 'application'
          end


          # Filtro al contenido de params
          # Para modificar parametros antes de que sean procesados en create y update.
          # Puede servir para sanear información (si no quieren usarse validaciones).
          def filtra_contenido_params
          end

          # Presenta formulario para crear nuevo registro
          def new_gen
            if cannot? :new, clase.constantize
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :create, clase.constantize
            end
            @registro = clase.constantize.new
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            if @registro.respond_to?(:fechacreacion)
              @registro.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
            end

            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, @registro.class.to_s,
                              nil,  'iniciar', '')
            end
          end


          def new
            new_gen
            render layout: 'application'
          end

          # Llamada en mitad de un edit
          # Después de autenticar, antes de desplegar si retorna
          # false no se despliega en llamadora
          def editar_intermedio(registro, usuario_actual_id)
            return true
          end


          # Despliega formulario para editar un regisro
          def edit
            @registro = clase.constantize.find(params[:id])
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            if cannot? :edit, clase.constantize
              # Supone alias por omision de https://github.com/CanCanCommunity/cancancan/blob/develop/lib/cancan/ability/actions.rb
              authorize! :update, @registro
            end
            if editar_intermedio(@registro, current_usuario.id)
              if registrar_en_bitacora
                Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                                request.url, params, @registro.class.to_s,
                                @registro.id,  'editar', '')
              end
              render layout: 'application'
            end
          end

          # Validaciones adicionales a las del modelo que 
          # requieren current_usuario y current_ability y que
          # bien no se desean que generen una excepción o bien
          # que no se pudieron realizar con cancancan
          def validaciones(registro)
            @validaciones_error = ''
            return true
          end

          # Crea un registro a partir de información de formulario
          def create_gen(registro = nil)
            c2 = clase.demodulize.underscore
            if registro
              @registro = registro
            else
              filtra_contenido_params
              pf = send(c2 + '_params')
              @registro = clase.constantize.new(pf)
            end
            if @registro.respond_to?(:fechacreacion)
              @registro.fechacreacion = DateTime.now.strftime('%Y-%m-%d')
            end
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            # render requiere el siguiente segun se confirmó
            # y comentó en update_gen
            eval "@#{c2} = @registro" 
            if !validaciones(@registro) || !@registro.valid?
              flash[:error] = @validaciones_error 
              render action: 'new', layout: 'application'
              return
            end
            authorize! :create, @registro
            creada = genclase == 'M' ? 'creado' : 'creada';
            respond_to do |format|
              if @registro.save
                if registrar_en_bitacora
                  Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                                  request.url, params, @registro.class.to_s,
                                  @registro.id,  'crear', '')
                end
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


          # Retorna verdader si logra hacer operaciones adicionales
          # de actualización a @registro
          def actualizar_intermedio
            return true
          end

          # Actualiza un registro con información recibida de formulario
          def update_gen(registro = nil)
            if registro
              @registro = registro
            else
              @registro = clase.constantize.find(params[:id])
            end
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end
            authorize! :update, @registro
            filtra_contenido_params
            c2 = clase.demodulize.underscore
            pf = send(c2 + '_params')
            @registro.assign_attributes( pf )
            # El siguiente se necesita porque por lo visto render 
            # cuando viene de actividades_controller emplea @actividad
            eval "@#{c2} = @registro" 
            respond_to do |format|
              if actualizar_intermedio && validaciones(@registro) && 
                  @registro.valid? && @registro.save
                if registrar_en_bitacora
                  # Se intentó implementar a nivel de modelo con
                  # before_update, after_update pero a Sivel2Gen::Caso
                  # sólo le llegan los cambios al modelo Caso y no a los
                  # asociados. Por eso inicialmente se prefirió a nivel de
                  # controlador y los cambios al formulario en el cliente
                  # con Javascript.
                  detalle_bitacora = {}
                  regcorto = clase.demodulize.underscore.to_s
                  if request.params[regcorto] &&
                      request.params[regcorto][:bitacora_cambio] &&
                      request.params[regcorto][:bitacora_cambio] != ''
                    begin
                      detalle_bitacora = JSON.parse(
                        request.params[regcorto][:bitacora_cambio])
                    rescue
                      detalle_bitacora = {error: 'Error al reconocer JSON'}
                    end
                  end
                  if detalle_bitacora != {}
                    Sip::Bitacora.a(request.remote_ip,
                                    current_usuario.id,
                                    request.url,
                                    params,
                                    @registro.class.to_s,
                                    @registro.id,
                                    'actualizar',
                                    detalle_bitacora.to_json)
                  end
                end

                format.html { 
                  if params[:_sip_enviarautomatico_y_repinta]
                    redirect_to edit_modelo_path(@registro), 
                      turbolinks: false
                  else
                    actualizada = genclase == 'M' ? 'actualizado' : 
                      'actualizada';
                    redirect_to modelo_path(@registro), 
                      notice: clase + " #{actualizada}." 
		    return
                  end
                }
                format.json { 
                  head :no_content 
                }
              else
                format.html { 
                  flash[:error] = @validaciones_error 
                  render action: 'edit', layout: 'application'
                }
                format.json { 
                  render json: @registro.errors, 
                    status: :unprocessable_entity 
                }
              end
            end

          end

          def update(registro = nil)
            update_gen(registro)
          end

          # Elimina un registro 
          def destroy_gen(mens = "", verifica_tablas_union=true)
            @registro = clase.constantize.find(params[:id])
            if @registro.respond_to?('current_usuario=')
              @registro.current_usuario = current_usuario
            end

            authorize! :destroy, @registro
            if verifica_tablas_union && @registro.class.columns_hash
              m = @registro.class.reflect_on_all_associations(:has_many)
              m.each do |r|
                if !r.options[:through]
                  rel = @registro.send(r.name)
                  if (rel.count > 0) 
                    nom = rel[0].class.human_attribute_name(r.name)
                    mens += " Este registro se relaciona con " +
                      "#{rel.count} registro(s) '#{nom}' (con id(s) " +
                      "#{rel.map(&:id).join(', ')}), " +
                      "no puede eliminarse aún. "
                  end
                end
              end
              m = @registro.class.reflect_on_all_associations(:has_and_belongs_to_many)
              m.each do |r|
                if !r.options[:through]
                  rel = @registro.send(r.name)
                  if (rel.count > 0) 
                    nom = rel[0].class.human_attribute_name(r.name)
                    mens += " Este registro se relaciona con " +
                      "#{rel.count} registro(s) '#{nom}' (con id(s) " +
                      "#{rel.map(&:id).join(', ')}), " +
                      "no puede eliminarse aún. "
                  end
                end
              end

              if mens != ''
                redirect_back fallback_location: main_app.root_path, 
                  flash: {error: mens}
                return
              end
            end
            cregistro=@registro.class.to_s
            cregistroid=@registro.id
            @registro.destroy
            if registrar_en_bitacora
              Sip::Bitacora.a(request.remote_ip, current_usuario.id,
                              request.url, params, cregistro,
                              cregistroid,  'eliminar', '')
            end

            eliminada = genclase == 'M' ? 'eliminado' : 'eliminada';
            respond_to do |format|
              format.html { redirect_to modelos_url(@registro),
                            notice: clase + " #{eliminada}." }
              format.json { head :no_content }
            end
          end

         
          # Elimina 
          def destroy(mens = "", verifica_tablas_union=true)
            destroy_gen(mens, verifica_tablas_union)
          end

          # Nombre del modelo 
          def clase 
            "Sip::ModelosCambiar"
          end

          # Genero del modelo (F - Femenino, M - Masculino)
          def genclase
            return 'F';
          end

          # Campos de la tabla por presentar en listado 
          def atributos_index
            ["id", 
             "created_at",
             "updated_at"
            ]
          end

          # Campos por mostrar en presentación de un registro
          def atributos_show
            atributos_index 
          end

          # Campos que se presentar en formulario
          def atributos_form
            atributos_show - 
              ["id", :id, 'created_at', :created_at, 'updated_at', :updated_at]
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

