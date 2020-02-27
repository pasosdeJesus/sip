# Iniciar un sistema de información usando Sip

Para iniciar una aplicación que usará **sip** en adJ sugerimos:

- Crea una aplicación rails que use la base de datos PostgreSQL. Además crea y configura la carpeta  `.bundle` así:
```sh
$ mkdir -p minsip/.bundle
$ cat > minsip/.bundle/config <<EOF
---
BUNDLE_PATH: "/var/www/bundler"
BUNDLE_DISABLE_SHARED_GEMS: "true"
EOF
$ CXX=c++ rails new minsip --database=postgresql
```
Es posible que el último paso genere algunos mensajes de error por gemas que no logra instalar porque requieren permisos de superusuario --entre otras esto ocurre con nokogiri-- en tal caso anote la versión por instalar --ejemplo 1.10.8:
```
doas gem install  nokogiri -v 1.10.8
```
- Crea el usuario de PostgreSQL y la base de datos de desarrollo que emplearás. Por ejemplo en adJ para crear el usuario 'isa5417' con clave 'aquilaclave' y la base de datos 'minsip_des' sería:
```sh
$ doas su - _postgresql
$ createuser -h /var/www/var/run/postgresql/ -s -Upostgres isa5417
$ psql -h /var/www/var/run/postgresql/ -Upostgres  
postgres=# ALTER USER isa5417 WITH PASSWORD 'aquilaclave';  
postgres=# \q
$ createdb -h/var/www/var/run/postgresql/ -Upostgres minsip_des  -Oisa5417
$ exit
```
-  Configura el usuario, su clave, así como los nombres que usarás para las bases de datos de pruebas, desarrollo y producción  en ```config/database.yml``` (la de desarrollo debe coincidir con la creada en el punto anterior)   Recuerda que en adJ debes incluir para la conexión por omisión `host: /var/www/var/run/postgresql`.  Un ejemplo de este archivo completo es:
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
  database: minsip_des

test:
  <<: *default
  database: minsip_pru

production:
  <<: *default
  database: minsip_pro
```
A continuación prueba que puede ingresar a la interfaz psql de la base de desarrollo con:
```sh
$ bin/rails dbconsole   
psql (11.5)
Type "help" for help.

minsipdes_des=# \q
```
- Incluye otras gemas necesarias y ```sip``` en el archivo `Gemfile`:
```sh
$ cat >> Gemfile <<EOF
gem 'bootstrap-datepicker-rails'# Control para elegir fechas 

gem 'cancancan'                  # Control de acceso

gem 'coffee-rails'               # Aún parte del Javascript manejado por sprockets de sip está en Coffescript

gem 'devise'                     # Autenticación

gem 'devise-i18n'                # Localización e Internacionalización                  

gem 'paperclip'                  # Anexos

gem 'jbuilder', '>= 2.7'        # Json

gem 'paperclip'                 # Anexos

gem 'puma'                      # Lanza en modo desarrollo

gem 'rails-i18n'                 # Localización e Internacionalización 

gem 'simple_form'  # Formularios

gem 'twitter_cldr'               # Localiación e internacionalización 

gem 'twitter_cldr'              # Localiación e internacionalización

gem 'will_paginate'              # Pagina listados


# Motores que sobrecargan vistas o basados en SIP en orden de apilamento
gem 'sip',                       # SI estilo Pasos de Jesús
  git: "https://github.com/pasosdeJesus/sip.git"
EOF
```
Y después verifica la instalación de las gemas con:
```
$ bundle install
```
- Crea el modelo `usuario` en ```app/models/usuario.rb``` inicialmente con:
```rb
require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```
Posteriormente puedes ver como personalizar el modelo y el controlador del usuario en <https://github.com/pasosdeJesus/sip/wiki/Uso-y-personalizaci%C3%B3n-del-modelo-usuario>.
- Crea el control de acceso en el archivo ```app/models/ability.rb``` inicialmente con:
```rb
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
- Modifica la configuración de `config/application.rb` asegurando
  emplear volcados SQL, estableciendo zona horaria y localización por ejemplo:
```rb
config.time_zone = 'America/Bogota'
config.i18n.default_locale = :es
config.x.formato_fecha = 'dd/M/yyyy'
config.active_record.schema_format = :sql
config.railties_order = [:main_app, Sip::Engine, :all]
```
- Copia la estructura de la base de datos
```sh
$ ftp -o db/structure.sql https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/db/structure.sql
```
- Prepara como semillas para la base de datos las semillas incluidas en
  sip y un usuario `sip` con clave `sip`, modificando `db/seeds.rb`:
```rb
conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)

conexion.execute("INSERT INTO public.usuario
  (nusuario, email, encrypted_password, password,
    fechacreacion, created_at, updated_at, rol)
  VALUES ('sip', 'sip@localhost',
    '$2a$10$YQY.luWpKWwNWIlfAQ.dhupblCP23raR35oIfeX1Cnm9mCYzmQvqm',
    '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
```
- Ahora borra base, inicializala, carga semillas y prepara índices con:
```sh
$ bin/rails db:drop db:setup sip:indices
```
- Prueba lo que llevas en la base de datos iniciando consola interactiva de PostgreSQL y realizando una consulta:
```$
$ bin/rails dbconsole
Password for user minsipdes: 
psql (11.5)
Type "help" for help.

minsipdes_des=# select count(*) from sip_clase;
 count 
-------
 14390
(1 row)

minsipdes_des=# \q
```
- Prueba lo que llevas en una consola irb, por ejemplo:
```sh
$ bin/rails console
irb(main):002:0> Usuario.connection
...
irb(main):002:0> Usuario.all.count
   (0.7ms)  SELECT COUNT(*) FROM "usuario"
=> 1
irb(main):003:0> exit

```
- Crea un controlador para usuarios en `app/controllers/usuarios_controller.rb` inicialmente con:
```rb
require 'sip/concerns/controllers/usuarios_controller'

class UsuariosController < Sip::ModelosController
  include Sip::Concerns::Controllers::UsuariosController
  
  def index
    super
  end
end
```
- Para establecer ruta de anexos crea un directorio (ej.
  `mkdir -p archivos/anexos/; mkdir -p archivos/volcados`) y configura tu aplicación
  con un título y esa ruta para enviar anexos y volcados, lo haces en
  `config/initializers/sip.rb` con algo como:
```rb
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
require 'sip/application_controller'
class ApplicationController < Sip::ApplicationController
  # Previente ataques CSRF elevando una excepción
  # En el caso de APIs, en cambio puedes querer usar :null_session
  protect_from_forgery with: :exception
end
```
- En este punto deberías poder arrancar la aplicación en modo desarrollo:
```sh
$ bin/rails s
```
 y verla operando en un navegador en la dirección http://localhost:3000 presentando la página por omisión de rails.
- Para ver el pantallazo inicial sin menús, ni una maquetación con bootstrap debes configurar rutas en `config/routes.rb`
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
y el logo (`logo.jpg`) y los favicons en la ruta `app/assets/images`, aunque inicialmente puedes copiar los de la aplicación e prueba de sip <https://github.com/pasosdeJesus/sip/tree/master/test/dummy/app/assets/images> 

- Para preparar experiencia de usuario con ayuda de Bootstrap y Javascript debes instalar paquetes `npm` mínimos: 
```sh
yarn add @rails/ujs  bootstrap bootstrap-datepicker chosen-js expose-loader @fortawesome/fontawesome-free jquery jquery-ui pick-a-color popper.js  tinycolor2 turbolinks 
CXX=c++ yarn install
```
en `app/javascript/packs/application.js` cargarlos e iniciarlos:
```js
console.log('Hola Mundo desde Webpacker')

require('@rails/ujs').start()   // Javascript no intrusivo segun rails
require('turbolinks').start()   // Acelera carga de paginas

import {$, jQuery} from 'jquery';
import 'popper.js'              // Dialogos emergentes usados por bootstrap
import 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'
import 'jquery-ui'
import 'jquery-ui/ui/widgets/autocomplete'
import 'pick-a-color'
import tinycolor from 'tinycolor2'
```
y configurar jQuery de manera global (mientras ̣`sip` deja de depender de ese paquete), editando `config/webpack/environment.js` dejando algo como:
```js
const { environment } = require('@rails/webpacker')

const webpack = require('webpack')

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
   $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.jQuery': 'jquery',
    Popper: ['popper.js', 'default'],
    tinycolor: 'tinycolor2'
  })
)

environment.loaders.append('expose', {
    test: require.resolve('jquery'),
    use: [
          { loader: 'expose-loader', options: '$' },
          { loader: 'expose-loader', options: 'jQuery' },
          { loader: 'expose-loader', options: 'tinycolor' }
        ]
})
      
module.exports = environment
```


- Configura la tubería de recursos (o sprockets) para cargar hojas de estilo y operar en paralelo con webpack agregando a `config/initalizers/assets.rb`:
```ruby
Rails.application.config.assets.paths << Rails.root.join('node_modules')
```
dejando en `app/assets/stylesheet/application.css`:
```css
/*
 *= require_tree .
 *= require sip/application.css
 *= require_self
 */
```
y para cargar otros javascript que no se maneje con webpacker en `app/assets/javascript/application.js`:
```js
//= require sip/application
//= require_tree .
```
En `app/assets/config/manifest.js` indica recursos por incluir.  En general sugerimos preparar hojas de estilo e imagenes con sprockets y todo lo de Javascript transmitirlo mediante webpacker.  Sin embargo las fuentes javascript que aún no se han migrado a webpacker pueden seguirse preparando con sprockets, recordando que en el navegador operarán en el enterno global --mientras que lo trasmitido por webpacker por omisión operará como módulo.
```
//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css
//= link_directory ../../../node_modules/chosen-js .png
//= link application.css
```
Tras esto deberías poder precompilar recursos con:
```
bin/rails assets:precompile --trace
```
- El menú y los elementos generales del maquetado los pones en `app/views/layouts/application.html.erb` como se presenta a continuación (nota que usamos funciones auxiliares para generar HTML con clases de bootstrap, se pueden emplear también sus formas originales en inglés basadas en las de la gema `twitter-bootstrap-rails`):
```erb
<% content_for :titulo do %>
    <%= Sip.titulo %>
<% end %>

<% content_for :menu do %>
   <%= grupo_menus do %>
    <% if !current_usuario.nil? %>
        <%= opcion_menu "Actores sociales", sip.actoressociales_path %>
        <%= opcion_menu "Personas", sip.personas_path %>
    <% end %>
  <% end %>
  <%= grupo_menus :empuja => :derecha do %>
    <%= opcion_menu "Documentacion", "https://github.com/pasosdeJesus/sip/tree/master/doc" %>
    <% if current_usuario %>
      <%= despliega_abajo "Administrar" do %>
        <%= opcion_menu "Clave", main_app.editar_registro_usuario_path, desplegable: true %>
        <%= opcion_menu "Copia de respaldo cifrada", sip.respaldo7z_path, desplegable: true %>
        <%= opcion_menu "Usuarios", main_app.usuarios_path, desplegable: true %>
        <%= opcion_menu "Tablas Básicas", sip.tablasbasicas_path, desplegable: true %>
        <%= opcion_menu "Ayuda CA", sip.ayuda_controldeacceso_path, desplegable: true %>
      <% end %>
      <%= opcion_menu "Salir #{current_usuario.nusuario}", main_app.sign_out_path %>
    <% else %>
      <%= opcion_menu "Acerca de", sip.acercade_path %>
      <%= opcion_menu "Iniciar Sesión", main_app.new_usuario_session_path %>
    <% end %>
  <% end %>
<% end %>

<% content_for :piedepagina do %>
  <p><span class='derechos'><a href="https://www.pasosdejesus.org/dominio_publico_colombia.html">Dominio Público de acuerdo a Legislación Colombiana</a><br/>
    Desarrollado por <a href="https://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2019.
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```

- Si faltaba, lanza la aplicación en modo desarrollo con:
```sh
$ bin/rails s
```
y examínala en el puerto 3000 con tu navegador <http://localhost:3000>,
recuerda que el usuario inicial es sip con clave sip.
