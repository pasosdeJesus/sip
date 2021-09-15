# Iniciar un sistema de información usando Sip

Para iniciar una aplicación que usará **sip** en adJ sugerimos:

- Disponer una plataforma que cumpla [los requisitos de instalación](https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md)
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
Es posible que el último paso genere algunos mensajes de error por gemas que no logra instalar porque requieren permisos de superusuario --entre otras esto ocurre con nokogiri-- en tal caso anota la versión por instalar --ejemplo 1.10.8-- y ejecuta algo como:
```
doas gem install  nokogiri -v 1.10.8
```
Y después desde el directorio `minsip` vuelve a ejecutar 
```sh
$ bundle install
```
- Instala `yarn`
```sh
doas gem install bash
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
```
- Con esto ya deberías poder lanzar la aplicación en modo desarrollo (aunque no correrá mucho sin base de datos, así que detenla con Control-C después de lanzarla):
```sh
$ bin/rails s
=> Booting Puma
=> Rails 6.0.2.1 application starting in development 
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 4.3.2 (ruby 2.7.0-p0), codename: Mysterious Traveller
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://[::1]:3000
* Listening on tcp://127.0.0.1:3000
Use Ctrl-C to stop
```
- Crea el usuario de PostgreSQL y la base de datos de desarrollo que emplearás. Por ejemplo en adJ para crear el usuario 'isa5417' con clave 'aquilaclave' y la base de datos 'minsip_des' sería:
```sh
$ doas su - _postgresql
$ createuser -h /var/www/var/run/postgresql/ -s -Upostgres isa5417
$ psql -h /var/www/var/run/postgresql/ -Upostgres  
postgres=# ALTER USER isa5417 WITH PASSWORD 'aquilaclave';  
postgres=# \q
$ exit
$ createdb -h/var/www/var/run/postgresql/ -Uisa5417 minsip_des
```
Puedes probar el ingreso con la interfaz de línea de ordenes psql con:
```
$ psql -h/var/www/var/run/postgresql/ -Uisa5417 minsip_des
Password for user isa5417: 
psql (13.4)
Type "help" for help.
[local:/var/www/var/run/postgresql/] sipdes@minsip_des=# 
```
Para evitar que te solicite clave del usuario PostgreSQL en cada ingreso a `psql` puedes crear o agregar a tu archivo `~/.pgpass` la línea:
```
*:*:*:isa5417:aquilaclave
```
- Crea el archivo `.env` con algunas configuraciones a nivel de servidor como el usuario para PostgreSQL, su clave, así como los nombres que usarás para las bases de datos de pruebas, desarrollo y producción (la de desarrollo debe coincidir con la creada en el punto anterior):
```
#!/bin/sh

export BD_SERVIDOR=/var/www/var/run/postgresql    # Ruta al socket de PostgreSQL, en adJ es /var/www/var/run/postgresql/
export BD_USUARIO=isa5417                         # Usuario PostgreSQL
export BD_CLAVE=aquilaclave                       # Clave PostgreSQL
export BD_DES=minsip_des                          # Base de datos de desarrollo
export BD_PRUEBA=minsip_pru                       # Base de datos de pruebas
export BD_PRO=minsip_pro                          # Base de datos de producción (no requerida en desarrollo)

export CONFIG_HOSTS=rbd.nocheyniebla.org          # Nombre del servidor donde se correrá
export RUTA_RELATIVA=/minsip/                     # Ruta en la que correra, puede ser /
export DIRAP=${HOME}/comp/rails/minsip            # Directorio donde están las fuentes de la aplicación
export RAILS_ENV=development                      # Modo en el que correrá (podría ser también production)
                                                  
export IPDES=127.0.0.1                            # En modo desarrollo IP en la que escuchará conexiones
export PUERTODES=3300                             # En modo desarrollo puerto en el que escuchará conexiones

export SIP_FORMATO_FECHA="dd/M/yyyy"              # Formato para presentar y recibir fechas, también podría ser yyyy-mm-dd
export SIP_RUTA_ANEXOS=${DIRAP}/archivos/anexos
export SIP_RUTA_VOLCADOS=${DIRAP}/archivos/bd
```
Puedes verificar la sintaxis cargando ese archivo desde la línea de ordenes y revisando alguna variable con:
```
$ . .env
$ echo $BD_USUARIO
isa5417
```
Para dar posibilidad de sobrecargar esas variables de configuracion del servidor desde la línea de órdenes, cada una debe ponerse dentro de un `if` como en el ejemplo siguiente con la primera:
```
if (test "$BD_SERVIDOR" = "") then {
  export BD_SERVIDOR=/var/www/var/run/postgresql # Ruta al socket de PostgreSQL, en adJ es /var/www/var/run/postgresql/   
}
```
-  Modifica el archivo `config/database.yml` empleando las variables de configuración que usaste en `.env`:
```yml
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: <%= ENV.fetch("BD_USUARIO") %>
  password: <%= ENV.fetch("BD_CLAVE") %>
  host: <%= ENV.fetch("BD_SERVIDOR") %>

development:
  <<: *default
  database: <%= ENV.fetch("BD_DES") %>

test:
  <<: *default
  database: <%= ENV.fetch("BD_PRUEBA") %>

production:
  <<: *default
  database: <%= ENV.fetch("BD_PRO") %>
```
A continuación prueba que puedes ingresar a la interfaz `psql` de la base de desarrollo pero mediante rails:
```sh
$ bin/rails dbconsole   
psql (13.4)
Type "help" for help.

minsipdes_des=# \q
```
- Incluye otras gemas necesarias y ```sip``` en el archivo `Gemfile` que debe quedar al menos con:
```
gem 'bcrypt'                     # Condensando de claves con bcrypt

gem 'bootsnap'                   # Arranque rápido

gem 'cancancan'                  # Control de acceso

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git',
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails'               # Aún parte del Javascript manejado por sprockets de sip está en Coffescript

gem 'devise'                     # Autenticación

gem 'devise-i18n'                # Localización e Internacionalización                  

gen 'dotenv-rails'               # Configuración de servidor en .env

gem 'jbuilder', '>= 2.7'         # Json

gem 'kt-paperclip'               # Anexos

gem 'nokogiri'                   # Procesamiento XML

gem 'pg'                         # PostgreSQL

gem 'puma'                       # Lanza en modo desarrollo

gem 'rails'      

gem 'rails-i18n'                 # Localización e Internacionalización 

gem 'simple_form'                # Formularios

gem 'turbolinks'                 # Acelera HTML

gem 'twitter_cldr'               # Localiación e internacionalización 

gem 'webpacker', '6.0.0.rc.1'    # Empaqueta javascript de app/packs

gem 'will_paginate'              # Pagina listados


#### Motores que sobrecargan vistas o basados en SIP en orden de apilamento
gem 'sip',                       # SI estilo Pasos de Jesús
  git: 'https://github.com/pasosdeJesus/sip.git'


group :development, :test do                                                     
  #gem 'byebug'                 # Depura                                                
                                                                                  
  gem 'code-scanning-rubocop'   # Busca fallas de seguridad                                                    
                                                                                 
  gem 'rails-erd'               # Genera diagrama entidad asociación
end     

group :development do                                                            
  gem 'web-console', '>= 3.3.0' # Depura en navegador
end                                                                              
                                                                                 
group :test do                                                                              
  gem 'minitest'                # Pruebas automáticas de regresión con minitest                                                 
  
  gem 'capybara'                # Pruebas del sistema 
  
  gem 'selenium-webdriver'    
  
  gem 'simplecov', '~> 0.10', '< 0.18'                                           
                                                                                 
  gem 'spork' # Un proceso para cada prueba -- acelera                           
                                                                                 
  gem 'webdrivers'                                                               
end      
```
Y después instala las nuevas gemas con:
```
$ bundle install
```
- Modifica la configuración de `config/application.rb` asegurando
  emplear volcados SQL, estableciendo zona horaria, localización, formato de la fecha por ejemplo:
```rb
config.active_record.schema_format = :sql
config.railties_order = [:main_app, Sip::Engine, :all]

config.time_zone = 'America/Bogota'
config.i18n.default_locale = :es

config.x.formato_fecha = ENV.fetch('SIP_FORMATO_FECHA', 'dd/M/yyyy')
config.hosts.concat(
  ENV.fetch('CONFIG_HOSTS', '127.0.0.1').downcase.split(',')
) 
```
Verifica la sintaxis tras cada modificación con:
```
ruby -c config/application.rb
```

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
        can :read, Sip::Orgsocial
        can :read, Sip::Persona
        can :read, Sip::Ubicacion
        can :new, Sip::Ubicacion
        can [:update, :create, :destroy], Sip::Ubicacion
      when Ability::ROLADMIN
        can :manage, Sip::Orgsocial
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
- Copia la estructura de la base de datos
```sh
$ ftp -o db/structure.sql https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/db/structure.sql
```
- Prepara como semillas para la base de datos las semillas incluidas en
  sip y un usuario `sip` con clave `sip`, modificando `db/seeds.rb` para que sea:
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
psql (13.4)
Type "help" for help.

minsipdes_des=# select count(*) from sip_clase;
 count 
-------
 14390
(1 row)

minsipdes_des=# \q
```
- Crea el modelo `usuario` en `app/models/usuario.rb` inicialmente con:
```rb
require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```
Posteriormente puedes ver como personalizar el modelo y el controlador del usuario en <https://github.com/pasosdeJesus/sip/wiki/Uso-y-personalizaci%C3%B3n-del-modelo-usuario>.
Puedes probar que el modelo opera en una consola irb, por ejemplo:
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
puedes probar desde `bin/rails console` con:
```
irb(main):001:0> UsuariosController
=> UsuariosController
```
- Para establecer rutas de anexos y de volcados crea dos directorio según hayas configurado en `.env` (ej.
  `mkdir -p archivos/anexos/ archivos/volcados`) y crea el archivo 
  `config/initializers/sip.rb` con algo como:
```rb
Sip.setup do |config|
  config.ruta_anexos = ENV.fetch(
    'SIP_RUTA_ANEXOS', "#{Rails.root}/archivos/anexos/")               
  config.ruta_volcados = ENV.fetch(
    'SIP_RUTA_VOLCADOS', "#{Rails.root}/archivos/bd/")
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
- En este punto deberías poder arrancar la aplicación en modo desarrollo por ejemplo escuchando en el puerto 3000 de 127.0.0.1 con:
```sh
$ bin/rails s -p 3000 -b 127.0.0.1
```
 y verla operando en un navegador en la dirección http://localhost:3000 presentando la página por omisión de rails.
 Deten la aplicación con Control-C para continuar configurando.
- Para ver el pantallazo inicial en en la ruta (o punto de montaje) `/minsip/` (sin menús, ni una maquetación con bootstrap) debes configurar rutas en `config/routes.rb`
```rb
Rails.application.routes.draw do
  rutarel = ENV.fetch('RUTA_RELATIVA', 'minsip/')                                
  scope rutarel do· 
    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy'
      if (Rails.configuration.relative_url_root != '/')·                         
        ruta = File.join(Rails.configuration.relative_url_root,·                 
                         'usuarios/sign_in')                                     
        post ruta, to: 'devise/sessions#create'                                  
        get  ruta, to: 'devise/sessions#new'                                     
      end
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
  end  # scope
  mount Sip::Engine, at: rutarel, as: 'sip'
end
```
- Para preparar experiencia de usuario con Bootstrap 5, Javascript con módulos y Jquery debes instalar paquetes `npm` mínimos: 
```sh
yarn add @rails/webpacker@6.0.0-rc.1 @rails/ujs @popperjs/core babel-plugin-macros bootstrap bootstrap-datepicker chosen-js expose-loader @fortawesome/fontawesome-free jquery jquery-ui popper.js@2.0.0-next.4 turbolinks 
CXX=c++ yarn install
```
prepara la estructura de directorios para webpack saque javascript con módulos de `app/packs` con:
```
mv app/javascript app/packs
mv app/packs/packs app/packs/entrypoints
rm config/webpack/environment.js
bin/rails webpacker:install
```
en `app/packs/entrypoints/application.js` debes configurar como cargar los módulos javascript, dejando jQuery de manera global (mientras ̣`sip` deja de depender de ese paquete):
```js
console.log('Hola Mundo desde Webpacker')

import Rails from "@rails/ujs"                                                   
Rails.start()                                                                    
import Turbolinks from "turbolinks"                                              
Turbolinks.start()                                                               
                                                                                 
import $ from "expose-loader?exposes=$,jQuery!jquery"

import 'popper.js'              // Dialogos emergentes usados por bootstrap
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'
import 'jquery-ui'
import 'jquery-ui/ui/widgets/autocomplete'
```
Asegurar que se podrán usar funciones auxiliares relacionadas con Bootstrap, dejando `app/helpers/application_helper.rb` con el siguiente contenido:
```rb
module ApplicationHelper 

  include Sip::BootstrapHelper
  
end
```
Y verifica que la configuración de javascript con módulos es correcta empaquetando con webpacker:
```
bin/webpack
```
- La tubería de recursos se encargará de ubicar en un directorio `public/minsip/assets/images` el logo (`logo.jpg`) y los favicons que pongas en la ruta `app/assets/images`. Inicialmente puedes copiar allí los de la aplicación de prueba de sip <https://github.com/pasosdeJesus/sip/tree/master/test/dummy/app/assets/images> 
Configura sprockets para cargar recursos de los paquetes npm asegurando que en `config/initializers/assets.rb` está:
```ruby
Rails.application.config.assets.paths << Rails.root.join('node_modules')
```
Puedes usar sprockets para transmitir hojas de estilo preconfiguradas de sip y sobrecargables en `app/assets/stylesheets/` dejando en `app/assets/stylesheets/application.css`:
```css
/*
 *= require sip/application.css
 *= require_tree .
 *= require_self
 */
```
Para cargar otros javascript de sip que no se manjan con webpacker, asegurate de dejar en `app/assets/javascripts/application.js` el siguiente contenido (creando antes el directorio `app/assets/javascripts`):
```js
//= require sip/application
//= require_tree .
```
En `app/assets/config/manifest.js` indica recursos por incluir.  En general con rails 6.1 sugerimos preparar hojas de estilo e imagenes con sprockets y todo lo de Javascript con módulos transmitirlo mediante webpacker.  Sin embargo las fuentes javascript que aún no sean modulos pueden seguirse preparando con sprockets, recordando que en el navegador operarán en el enterno global --mientras que lo trasmitido por webpacker por omisión operará como módulo.
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
- Para usar la maquetación predeterminada de sip, y sólo modificar el menú deja `app/views/layouts/application.html.erb` como se presenta a continuación (nota que usamos funciones auxiliares para generar HTML con clases de bootstrap, se pueden emplear también sus formas originales en inglés basadas en las de la gema `twitter-bootstrap-rails`):
```erb
<% content_for :titulo do %>
    <%= Sip.titulo %>
<% end %>

<% content_for :menu do %>
   <%= grupo_menus do %>
    <% if !current_usuario.nil? %>
        <%= opcion_menu "Organizaciones sociales", sip.orgsociales_path %>
        <%= opcion_menu "Personas", sip.personas_path %>
    <% end %>
  <% end %>
  <%= grupo_menus :empuja => :derecha do %>
    <%= opcion_menu "Documentacion", "https://github.com/pasosdeJesus/sip/tree/master/doc/README.md" %>
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
    Desarrollado por <a href="https://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2021.
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```

- Si faltaba, lanza la aplicación en modo desarrollo con:
```sh
$ bin/rails s -b 127.0.0.1 -p 3000
```
y examínala en el puerto 3000 con tu navegador <http://localhost:3000>,
recuerda que el usuario inicial es `sip` con clave `sip`.
