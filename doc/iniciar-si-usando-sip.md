# Iniciar un sistema de información usando Sip

Para iniciar una aplicación que usará **sip** en adJ sugerimos:

- Disponer una plataforma que cumpla 
  [los requisitos de instalación](https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md)
- Crea una aplicación rails que use la base de datos PostgreSQL. Además crea y 
  configura la carpeta  `.bundle` así:
```sh
$ mkdir -p minsip/.bundle
$ cat > minsip/.bundle/config <<EOF
---
BUNDLE_PATH: "/var/www/bundler"
BUNDLE_DISABLE_SHARED_GEMS: "true"
EOF
$ CXX=c++ rails new minsip --database=postgresql --javascript=esbuild
```
  Es posible que el último paso genere algunos mensajes de error por gemas que 
  no logra instalar porque requieren permisos de superusuario --entre otras 
  esto ocurre con nokogiri-- en tal caso anota la versión por 
  instalar --ejemplo 1.13.3-- y ejecuta algo como:
```
doas gem install  nokogiri -v 1.13.3
```
  Y después desde el directorio `minsip` vuelve a ejecutar
```sh
$ bundle install
```
- Instala `yarn`
```sh
npm install --global yarn
```
- Con esto ya deberías poder lanzar la aplicación en modo desarrollo (aunque 
  no correrá mucho sin base de datos, así que detenla con Control-C después de 
  lanzarla):
```sh
$ bin/rails s
=> Booting Puma
=> Rails 7.0.2.3 application starting in development
=> Run `rails server --help` for more startup options
Puma starting in single mode...
* Version 5.6.2 (ruby 3.1.1-p18) ("Birdie's Version")
* Min threads: 5
* Max threads: 5
* Environment: development
*         PID: 66138
* Listening on tcp://[::1]:3000
* Listening on tcp://127.0.0.1:3000
Use Ctrl-C to stop
```
- Crea el usuario de PostgreSQL y la base de datos de desarrollo que emplearás. 
  Por ejemplo en adJ para crear el usuario 'isa5417' con clave 'aquilaclave' 
  y la base de datos 'minsip_des' sería:
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
psql (14.2)
Type "help" for help.
[local:/var/www/var/run/postgresql/] sipdes@minsip_des=#
```
Para evitar que te solicite clave del usuario PostgreSQL en cada ingreso a 
`psql` puedes crear o agregar a tu archivo `~/.pgpass` la línea:
```
*:*:*:isa5417:aquilaclave
```

- Si hace falta instala globalmente las gemas `dotenv` y `foreman` con 
  `doas gem install dotenv foreman` e incluye otras gemas necesarias, así como 
  `sip` en el archivo `Gemfile` que debe quedar al menos con:
```
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '>=3.1.1'

gem 'bcrypt'                     # Condensando de claves con bcrypt

gem 'bootsnap'                   # Arranque rápido

gem 'cancancan'                  # Control de acceso

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git',
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails'               # Parte de sip aún usa Coffescript

gem 'devise'                     # Autenticación

gem 'devise-i18n'                # Localización e Internacionalización

gem 'dotenv-rails'               # Configuración de servidor en .env

gem 'jbuilder', '>= 2.7'         # Json

gem 'jsbundling-rails'

gem 'kt-paperclip'               # Anexos

gem 'nokogiri'                   # Procesamiento XML

gem 'pg'                         # PostgreSQL

gem 'puma'                       # Lanza en modo desarrollo

gem 'rails'

gem 'rails-i18n'                 # Localización e Internacionalización

gem 'simple_form'                # Formularios

gem 'sprockets-rails'            # Tuberia de recursos

gem 'stimulus-rails'             # Libreria javascript

gem 'turbo-rails'                # Acelera HTML

gem 'twitter_cldr'               # Localiación e internacionalización

gem 'will_paginate'              # Pagina listados


#### Motores que sobrecargan vistas o basados en SIP en orden de apilamento
gem 'sip',                       # SI estilo Pasos de Jesús
  git: 'https://github.com/pasosdeJesus/sip.git'


group :development, :test do
  gem 'debug'                 # Depura

  gem 'colorize'

  gem 'code-scanning-rubocop'   # Busca fallas de seguridad

  gem 'rails-erd'               # Genera diagrama entidad asociación
end

group :development do
  gem 'web-console', '>= 3.3.0' # Depura en navegador
end

group :test do
  gem 'minitest'                # Pruebas automáticas de regresión con minitest

  gem 'rails-controller-testing'

  gem 'simplecov', '~> 0.10', '< 0.18'
end
```
Y después instala las nuevas gemas con:
```
$ bundle install
```

- Como sip emplea `dotenv` y `dotenv-rails` crea el archivo `.env` con 
  algunas configuraciones a nivel de servidor como el usuario para 
  PostgreSQL, su clave, así como los nombres que usarás para las bases 
  de datos de pruebas, desarrollo y producción (la de desarrollo debe 
  coincidir con la creada anteriormente):
```
#!/bin/sh

export BD_SERVIDOR=/var/www/var/run/postgresql    # Ruta al socket de PostgreSQL
export BD_USUARIO=isa5417                         # Usuario PostgreSQL
export BD_CLAVE=aquilaclave                       # Clave PostgreSQL
export BD_DES=minsip_des                          # Base de datos de desarrollo
export BD_PRUEBA=minsip_pru                       # Base de datos de pruebas
export BD_PRO=minsip_pro                          # Base de datos de producción (no requerida en desarrollo)

export CONFIG_HOSTS=127.0.0.1          # Nombre del servidor donde se correrá
export RUTA_RELATIVA=/minsip/                     # Ruta en la que correra, puede ser /
export DIRAP=${HOME}/comp/rails/minsip            # Directorio donde están las fuentes de la aplicación
export RAILS_ENV=development                      # Modo en el que correrá (podría ser también production)

export IPDES=127.0.0.1                            # En modo desarrollo IP en la que escuchará conexiones
export PUERTODES=3300                             # En modo desarrollo puerto en el que escuchará conexiones
export MAQRECVIVA=$CONFIG_HOSTS                   # Servidor para recarga viva
export PUERTORECVIVA=4600                         # Puerto para recarga viva


export SIP_FORMATO_FECHA="dd/M/yyyy"              # Formato para presentar y recibir fechas, también podría ser yyyy-mm-dd
export SIP_RUTA_ANEXOS=${DIRAP}/archivos/anexos
export SIP_RUTA_VOLCADOS=${DIRAP}/archivos/bd
```
Puedes verificar la sintaxis cargando ese archivo desde la línea de ordenes y 
revisando alguna variable con:
```
$ (. .env; echo $BD_USUARIO)
isa5417
```
Para dar posibilidad de sobrecargar esas variables de configuración del 
servidor desde la línea de órdenes, cada una debe ponerse dentro de un 
`if` como en el ejemplo siguiente con la primera:
```
if (test "$BD_SERVIDOR" = "") then {
  export BD_SERVIDOR=/var/www/var/run/postgresql # Ruta al socket de PostgreSQL
}
```
No agregues este archivo al repositorio git (si emplearás uno) porque tiene 
claves y datos sensibles que podrían usarse para atacar tu servidor.
Puedes ayudarte a evitarlo agreando .env a tu archivo .gitignore
```
echo .env >> .gitignore
```
Pero si quieres distribuir en tu repositorio una plantilla del archivo .env 
puedes copiarlo en .env.plantilla y agregar .env.plantilla a tu repositorio:
```
cp .env .env.plantilla
vi .env.plantilla  # Edita para cambiar informacion sensible y poner ejemplos
git add .env.plantilla
```

- Como incluiste la gema `sip` en tu Gemfile, debes crear el control de acceso 
en el archivo ```app/models/ability.rb``` inicialmente con:
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
Verifica la sintaxis tras cada modificación con:
```
ruby -c app/models/ability.rb
```


- Modifica el archivo `config/database.yml` empleando las variables de 
  configuración que usaste en `.env`:
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
A continuación prueba que puedes ingresar a la interfaz `psql` de la base de 
desarrollo pero mediante rails:
```sh
$ bin/rails dbconsole
psql (14.2)
Type "help" for help.

minsip_des=# \q
```

- Modifica la configuración de `config/application.rb` asegurando
  emplear volcados SQL, estableciendo zona horaria, localización, 
  formato de la fecha, etc. por ejemplo:
```rb
require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Minsip
  class Application < Rails::Application
    config.load_defaults 7.0

    config.active_record.schema_format = :sql
    config.railties_order = [:main_app, Sip::Engine, :all]

    config.time_zone = 'America/Bogota'
    config.i18n.default_locale = :es

    config.x.formato_fecha = ENV.fetch('SIP_FORMATO_FECHA', 'dd/M/yyyy')
    config.hosts.concat(
      ENV.fetch('CONFIG_HOSTS', '127.0.0.1').downcase.split(',')
    )
  end
end
```
Verifica la sintaxis tras cada modificación con:
```
% ruby -c config/application.rb
```
usa la convención de sip de dejar nombres de tablas en singular agregando
a `config/environment.rb`:
```
ActiveRecord::Base.pluralize_table_names=false
```
y verifica que carga correctamente con:
```
% bin/rails console
Loading development environment (Rails 7.0.2.3)
irb(main):001:0> Rails.configuration.x.formato_fecha
=> "dd/M/yyyy"
```

- Copia la estructura de la base de datos mínima
```sh
$ ftp -o db/structure.sql https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/db/structure.sql
```
- Prepara como semillas para la base de datos las semillas incluidas en
  sip y un primer usuario `sip` con clave `sip`, modificando `db/seeds.rb` 
  para que sea:
```rb
conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)

conexion.execute("INSERT INTO public.usuario
  (id, nusuario, email, encrypted_password, password,
    fechacreacion, created_at, updated_at, rol)
  VALUES (1, 'sip', 'sip@localhost',
    '$2a$10$YQY.luWpKWwNWIlfAQ.dhupblCP23raR35oIfeX1Cnm9mCYzmQvqm',
    '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
```
- Ahora borra base, inicializala, carga semillas y prepara índices con:
```sh
$ bin/rails db:drop db:setup sip:indices
```
Prueba lo que llevas en la base de datos iniciando consola interactiva de PostgreSQL y realizando una consulta:
```$
$ bin/rails dbconsole
psql (14.2)
Type "help" for help.

minsip_des=# select count(*) from sip_clase;
 count
-------
 14416
(1 row)

minsip_des=# \q
```
- Crea el modelo `usuario` en `app/models/usuario.rb` inicialmente con:
```rb
require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```
Puedes probar que el modelo opera en una consola irb, por ejemplo:
```sh
$ bin/rails console
irb(main):001:0> Usuario.all.count
   (0.7ms)  SELECT COUNT(*) FROM "usuario"
=> 1
irb(main):002:0> Usuario.all[0]
  Usuario Load (0.3ms)  SELECT "usuario".* FROM "usuario"
=> #<Usuario nusuario: "sip", password: [FILTERED], descripcion: nil, rol: 1, idioma: "es_CO", id: 1, fechacreacion: "2014-08-14", fechadeshabilitacion: nil, email: "sip@localhost", created_at: "2014-08-13 19:00:00.000000000 -0500", updated_at: "2014-08-13 19:00:00.000000000 -0500", regionsjr_id: nil, nombre: nil, tema_id: nil>
irb(main):003:0> exit
```
- Crea un controlador para usuarios en `app/controllers/usuarios_controller.rb` 
  inicialmente con:
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
  Posteriormente puedes ver como personalizar el modelo y el controlador 
  del usuario en 
  <https://github.com/pasosdeJesus/sip/blob/main/doc/modelo-usuario.md>.
- Para establecer rutas de anexos y de volcados crea dos directorio según 
  hayas configurado en `.env` (ej. `mkdir -p archivos/anexos/ archivos/bd`) 
  y crea el archivo `config/initializers/sip.rb` con algo como:
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
- En este punto deberías poder arrancar la aplicación en modo desarrollo por 
  ejemplo escuchando en el puerto 3000 de 127.0.0.1 con:
```sh
$ bin/rails s -p 3000 -b 127.0.0.1
```
 y verla operando en un navegador en la dirección http://localhost:3000 
 presentando la página por omisión de rails.
 Deten la aplicación con Control-C para continuar configurando.
- Para ver el pantallazo inicial en en la ruta (o punto de montaje) `/minsip/` 
  (sin menús, ni una maquetación con bootstrap) debes configurar rutas en 
  `config/routes.rb`
```rb
Rails.application.routes.draw do
  rutarel = ENV.fetch('RUTA_RELATIVA', 'minsip/')
  scope rutarel do
    devise_scope :usuario do
      get 'sign_out' => 'devise/sessions#destroy'
      if (Rails.configuration.relative_url_root != '/')
        ruta = File.join(Rails.configuration.relative_url_root,
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
Verifica su sintaxis con `ruby -c config/routes.rb`

En `config/initializers/punto_montaje.rb`:
```
Minsip::Application.config.relative_url_root = ENV.fetch(
  'RUTA_RELATIVA', '/minsip')
Minsip::Application.config.assets.prefix = ENV.fetch(
  'RUTA_RELATIVA', '/minsip') == '/' ?
 '/assets' : (ENV.fetch('RUTA_RELATIVA', '/minsip') + '/assets')
```
y preparar directorio `public/minsip`:
```
mkdir public/minsip
```
- Para preparar experiencia de usuario con Bootstrap 5, Javascript con 
  módulos y Stimulus + Jquery debes instalar paquetes `npm` mínimos:
```sh
yarn add @hotwired/stimulus @hotwired/turbo-rails @rails/ujs \
  @popperjs/core @fortawesome/fontawesome-free bootstrap \
  bootstrap-datepicker chosen-js esbuild popper.js@2.0.0-next.4 jquery
yarn add -D  babel-plugin-macros 
CXX=c++ yarn install
```
En `app/javascript/application.js` debes configurar como cargar los módulos 
javascript, dejando jQuery de manera global (mientras ̣`sip` deja de 
depender de ese paquete), inicialmente puedes copiar el de la aplicación
de ejemplo de sip:

```
$ ftp -o app/javascript/application.rb https://raw.githubusercontent.com/pasosdeJesus/sip/main/test/dummy/app/javascript/{application.js,jquery.js,jquery-ui.js}
```
Asegura que se podrán usar funciones auxiliares relacionadas con Bootstrap, 
dejando `app/helpers/application_helper.rb` con el siguiente contenido:
```rb
module ApplicationHelper

  include Sip::BootstrapHelper

end
```
Para empaquetar Javascript con esbuild agrega al archivo `package.json`:
```
  "scripts": {
    "build": "esbuild app/javascript/*.* --preserve-symlinks --bundle --sourcemap --outdir=app/assets/builds",
    "start": "node esbuild-des.config.js"
  },
```

  Y verifica que la configuración de javascript con módulos y esbuild es 
  correcta empaquetando en `app/assets/builds/application.js` con:
```
yarn build
```
- La tubería de recursos (i.e sprockets) se encargará de ubicar en un directorio 
  `public/minsip/assets/images` el logo (`logo.jpg`) y los favicons que pongas 
  en la ruta `app/assets/images`. Inicialmente puedes copiar allí 
  los de la aplicación de prueba de sip con
```
cd app/assets/images
ftp https://raw.githubusercontent.com/pasosdeJesus/sip/main/test/dummy/app/assets/images/{logo.jpg,browserconfig.xml,favicon.ico}
ftp https://raw.githubusercontent.com/pasosdeJesus/sip/main/test/dummy/app/assets/images/favicon-{114,120,144,150,152,16,160,180,192,310,32,57,60,64,70,72,76,96}.png
cd ../../..
```
  Sprockets también servirá los javascript que pongas en app/assets/javascripts
  y el javascript modular empaqueta por esbuild en app/assets/build.

  Puedes usar sprockets para transmitir hojas de estilo preconfiguradas de sip 
  y sobrecargables en `app/assets/stylesheets/` dejando en 
  `app/assets/stylesheets/application.css`:
```css
/*
 *= require sip/application.css
 *= require_tree .
 *= require_self
 */
```
Para cargar otros javascript de sip que no se manjan con esbuild, asegurate 
de dejar en `app/assets/javascripts/recursos_sprockets.js` el siguiente 
contenido (creando antes el directorio `app/assets/javascripts`):
```js
//= require sip/application
//= require_tree .
```
En `app/assets/config/manifest.js` indica recursos por incluir. 
Por ejemplo javascript en espacio globall manejado por sprockets
(incluyendo los de motores) y el modular empaquetado con esbuild.
```
//= link_tree ../images
//= link_directory ../javascripts .js
//= link_directory ../stylesheets .css
//= link_directory ../../../node_modules/chosen-js .png
//= link application.css
//= link recursos_sprockets.js
//= link recursos_sprockets.js.map
//= link_tree ../builds
```
Tras esto deberías poder precompilar recursos con:
```
bin/rails assets:precompile --trace
```
que los debe crear en `public/minsip/assets`

- Para usar la maquetación predeterminada de sip, y sólo modificar el menú 
deja `app/views/layouts/application.html.erb` como se presenta a continuación 
(nota que usamos funciones auxiliares para generar HTML con clases de 
bootstrap, se pueden emplear también sus formas originales en inglés basadas 
en las de la gema `twitter-bootstrap-rails`):
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
    Desarrollado por <a href="https://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2022.
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```

- Si faltaba, lanza la aplicación en modo desarrollo con:
```sh
$ bin/rails s -b 127.0.0.1 -p 3000
```
y examínala en el puerto 3000 con tu navegador <http://localhost:3000/minsip>,
recuerda que el usuario inicial es `sip` con clave `sip`.

- Para facilitar arrancar, detener o actualizar sugerimos copiar de 
  `sip/test/dummy/bin` en el directorio `bin` de tu aplicación los guiones 
  `corre`, `detiene` y `migra`. Así podrás configurar puerto e IP en .env 
  e iniciar con:
```
bin/corre
```
o sin precompilar recursos (rápido) con:
```
R=1 bin/corre
```
Este script además ejecutará la tarea rake `sip:stimulus_motores` que
enlaza controladores stimulus de motores en subdirectorios
de su directorio `app/javascript/controllers`.

Por otra parte si crea el archivo `Procfile` con:
```
rails: R=f bin/corre
js: yarn start --watch
```
y copia el archivo `esbuild-des.config.js` de `sip/test/dummy`,
al ejecutar `bin/corre` se usará `foreman` para lanzar dos procesos: uno
para la ejecución de rails y otro para realizar recargas vivas
de sus modificaciones a `app/javascript` (es decir no tendrá que detener la 
aplicación, reempaqueta con esbuild y recargar en el navegador porque
todo esto se hará automáticamente cada vez que modifique una fuente
en `app/javascript`).

