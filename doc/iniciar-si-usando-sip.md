# Iniciar un sistema de información usando Sip

Para iniciar una aplicación que usará **sip** en adJ sugerimos:

- Crea una aplicación rails que use la base de datos PostgreSQL. Además crea y configura la carpeta .bundle así:
```sh
$ mkdir -p minsip/.bundle
$ cat > minsip/.bundle/config <<EOF
> ---
> BUNDLE_PATH: "/var/www/bundler"
> BUNDLE_DISABLE_SHARED_GEMS: "true"
> EOF
$ CXX=c++ rails new minsip --database=postgresql
```
- Crea el usuario de PostgreSQL y la base de datos de desarrollo que emplearás. Por ejemplo en adJ para crear el usuario 'isa5417' con clave 'aquilaclave' y la base de datos 'minsip_development' sería:
```sh
$ doas su - _postgresql
$ createuser -h /var/www/var/run/postgresql/ isa5417 -s -Upostgres
$ psql -h /var/www/var/run/postgresql/ -Upostgres  
postgres=# ALTER USER isa5417 WITH PASSWORD 'aquilaclave';  
postgres=# \q
$ createdb -h/var/www/var/run/postgresql/ -Upostgres -Oisa5417 minsip_development
$ exit
```
-  Configura el usuario, su clave, así como los nombres que usarás para las bases de datos de pruebas, desarrollo y producción (no es necesario crearlas antes)  en ```config/database.yml```.  Recuerda que en adJ debes incluir para la conexión por omisión `host: /var/www/var/run/postgresql`.  Un ejemplo de este archivo completo es:
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: isa5417
  password: aquilaclave
  host: /var/www/var/run/postgresql

development:
  <<: *default
  database: minsip_development

test:
  <<: *default
  database: minsip_test

production:
  <<: *default
  database: minsip_production
```
- Incluye ```sip``` y otras gemas necesarias en el Gemfile después de las gemas generales y antes de las particulares para desarrollo o pruebas:

```Gemfile
# Motores que sobrecargan vistas o basados en SIP en orden de apilamento
gem 'sip', git: "https://github.com/pasosdeJesus/sip.git"
```
y ejecuta
```sh
$ bundle install
```
- Crea el modelo `usuario` en ```app/models/usuario.rb``` inicialmente basta:
```rb
# encoding: UTF-8
require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```
Y pueedes ver como personalizar el modelo y controlador de usuario en <https://github.com/pasosdeJesus/sip/wiki/Uso-y-personalizaci%C3%B3n-del-modelo-usuario>.
- Crea un controlador (Lo puedes crear con ``rails g controller usuarios`` ) y configúralo en `app/controllers/usuarios_controller.rb` inicialmente con:
```rb
# encoding: UTF-8
require 'sip/concerns/controllers/usuarios_controller'

class UsuariosController < Sip::ModelosController
  include Sip::Concerns::Controllers::UsuariosController
end
```
- Crea el control de acceso con ``rails g cancan:ability`` (Debes tener instalada la gema CanCan). Configura el archivo ```app/models/ability.rb``` inicialmente con:
```rb
# encoding: UTF-8

class Ability  < Sip::Ability


  # Se definen habilidades con cancancan
  # @usuario Usuario que hace petición
  def initialize(usuario = nil)
    # El primer argumento para can es la acción a la que se da permiso,
    # el segundo es el recurso sobre el que puede realizar la acción,
    # el tercero opcional es un diccionario de condiciones para filtrar
    # más (e.g :publicado => true).
    #
    # El primer argumento puede ser :manage para indicar toda acción,
    # o grupos de acciones como :read (incluye :show e :index),
    # :create, :update y :destroy.
    #
    # Si como segundo argumento usa :all se aplica a todo recurso,
    # o puede ser una clase.
    #
    # Detalles en el wiki de cancan:
    #   https://github.com/ryanb/cancan/wiki/Defining-Abilities


    # Sin autenticación puede consultarse información geográfica
    can :read, [Sip::Pais, Sip::Departamento, Sip::Municipio, Sip::Clase]
    # No se autorizan usuarios con fecha de deshabilitación
    if !usuario || usuario.fechadeshabilitacion
      return
    end
    can :contar, Sip::Ubicacion
    can :buscar, Sip::Ubicacion
    can :lista, Sip::Ubicacion
    can :descarga_anexo, Sip::Anexo
    can :nuevo, Sip::Ubicacion
    if usuario && usuario.rol then
      case usuario.rol
      when Ability::ROLANALI
        can :read, Sip::Actorsocial
        can :read, Sip::Persona
        can :read, Sip::Ubicacion
        can :new, Sip::Ubicacion
        can [:update, :create, :destroy], Sip::Ubicacion
      when Ability::ROLADMIN
        can :manage, Sip::Actorsocial
        can :manage, Sip::Persona
        can :manage, Sip::Respaldo7z
        can :manage, Sip::Ubicacion
        can :manage, ::Usuario
        can :manage, :tablasbasicas
        self.tablasbasicas.each do |t|
          c = Ability.tb_clase(t)
          can :manage, c
        end
      end
    end
  end # def initialize

end
```
- Para establecer ruta de anexos crea un directorio (ej.
  `mkdir -p archivos/anexos/; mkdir -p archivos/volcados`) y configura tu aplicación
  con un título y esa ruta para enviar anexos y volcados, lo haces en
  `config/initializers/sip.rb` con algo como:
```rb
#encoding: UTF-8

Sip.setup do |config|
      config.ruta_anexos = "#{Rails.root}/archivos/anexos/"
      config.ruta_volcados = "#{Rails.root}/archivos/volcados/"
      # En heroku los anexos son super-temporales
      if !ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Aplicación mínima que usa SIP"
end
```
- Remplaza `app/controllers/application_controller.rb` por
```rb
# encoding: UTF-8

require 'sip/application_controller'
class ApplicationController < Sip::ApplicationController
  # Previente ataques CSRF elevando una excepción
  # En el caso de APIs, en cambio puedes querer usar :null_session
  protect_from_forgery with: :exception
end
```
- Edita `app/assets/javascript/application.js` y antes de `//= require_tree .` agrega:
```js
//= require sip/application
```
- Edita `app/assets/stylesheet/application.css` para que incluya:
```css
/*
 *= require_tree .
 *= require sip/application.css
 *= require_self
 */
```
- Remplaza `app/views/layouts/application.html.erb` por algo como:
```erb
<% content_for :titulo do %>
    <%= Sip.titulo %>
<% end %>

<% content_for :menu do %>
  <%= menu_group do %>
    <% if !current_usuario.nil? %>
      <%= menu_item "Carne1", "/" %>
    <% end %>
  <% end %>
  <%= menu_group :pull => :right do %>
    <%= menu_item "Documentacion", "https://github.com/pasosdeJesus/sip/blob/master/doc/README.md" %>
    <% if current_usuario %>
      <%= drop_down "Administrar" do %>
        <%= menu_item "Clave", main_app.editar_registro_usuario_path %>
        <% if can? :manage, Sip::Respaldo7z %>
          <%= menu_item "Copia de respaldo cifrada", sip.respaldo7z_path %>
        <% end %>
        <% if can? :manage, ::Usuario %>
          <%= menu_item "Usuarios", main_app.usuarios_path %>
        <% end %>
        <% if can? :manage, :tablasbasicas %>
          <%= menu_item "Tablas Básicas", sip.tablasbasicas_path %>
        <% end %>
        <%= menu_item "Ayuda CA", sip.ayuda_controldeacceso_path %>
        <%= menu_item "Salir #{current_usuario.nusuario}", main_app.sign_out_path %>
      <% end %>
    <% else %>
      <%= menu_item "Acerca de", sip.acercade_path %>
      <%= menu_item "Iniciar Sesión", main_app.new_usuario_session_path %>
    <% end %>
  <% end %>
<% end %>

<% content_for :piedepagina do %>
  <p><span class='derechos'><a href="http://www.pasosdejesus.org/dominio_publico_colombia.html">Dominio Público de acuerdo a Legislación Colombiana</a><br/>
    Desarrollado por <a href="http://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2019.
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```
- Remplaza `config/routes.rb` por
```rb
Rails.application.routes.draw do
  devise_scope :usuario do
    get 'sign_out' => 'devise/sessions#destroy'
  end
  devise_for :usuarios, :skip => [:registrations], module: :devise
  as :usuario do
    get 'usuarios/edit' => 'devise/registrations#edit',
      :as => 'editar_registro_usuario'    
    put 'usuarios/:id' => 'devise/registrations#update',
      :as => 'registro_usuario'            
  end
  resources :usuarios, path_names: { new: 'nuevo', edit: 'edita' }  

  root 'sip/hogar#index'
  mount Sip::Engine, at: "/"
end
```
- Modifica la configuración de `config/application.rb` asegurando
  emplear volcados SQL, estableciendo zona horaria y localización por ejemplo:
```rb
config.time_zone = 'America/Bogota'
config.i18n.default_locale = :es
config.x.formato_fecha = 'dd/M/yyyy'
config.active_record.schema_format = :sql
config.railties_order = [:main_app, Sip::Engine, :all]
```
- Copia la estructura de la base de datos y créala
```sh
$ ftp -o db/structure.sql https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/db/structure.sql
```
- Prepara y carga como semillas para la base de datos las semillas incluidas en
  sip y un usuario sip con clave sip, modificando `db/seeds.rb`:

```rb
# encoding: UTF-8

conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)

conexion.execute("INSERT INTO usuario
  (nusuario, email, encrypted_password, password,
    fechacreacion, created_at, updated_at, rol)
  VALUES ('sip', 'sip@localhost',
    '$2a$04$uLWQzmlDYEaegYs4brFVYeLN9FeIE6vAPQqp9HgbQDGLKOV9dXTK6',
    '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
```
Ahora carga las semillas de tu aplicación con ``bin/rails db:seed``
- Inicializa base de datos con:
```sh
$ bin/rails db:setup sip:indices
```
- Pon el logo que deseas ver en la página inicial de la aplicación
  en  `app/assets/images/logo.jpg`
- Lanza tu aplicación
```sh
$ bin/rails s
```
y examínala en el puerto 3000 con tu navegador <http://localhost:3000>,
recuerda que el usuario inicial es sip con clave sip.
