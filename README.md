# Motor para Sistemas de Información estilo Pasos de Jesús
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sip.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

![Logo de sip](https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/public/images/logo.jpg)

Este es un motor sobre el cual construir sistemas de información seguros o 
bien otros motores para sistemas de información sobre la versión más
reciente de Ruby on Rails.

Puede pensarlo como una capa adicional sobre Ruby on Rails que incluye 
soluciones estándar, seguras y probadas para más elementos de un sistema 
de información, como:

- Pila actualizada: desarrollado en simultaneo con adJ (distribución de 
  OpenBSD) y modificado para operar siempre sobre las nuevas versiones
  de adJ que se actualizan cada 6 meses para incluir:
  sistema operativo más reciente, motor de base de datos más reciente, 
  ruby reciente, librerías y gemas más recientes.   Probado de manera 
  continua en Linux (vía integración continúa con travis.org).  
  Busca promover gemas recienten que faciliten el desarrollo del resto
  de la aplicación a nivel de interfaz e internacionalización y proveer
  ayudas para actualizar --por lo menos documentación en el wiki.
- Uso de PostgreSQL reciente (preferiblemente con bases cifradas como en 
  adJ).
- Propuesta inicial para usuarios (tabla y modelo ::Usuario) y grupos (tabla
  y modelo Sip::Grupo) suficiente para aplicaciones básicas o que pueden
  ampliarse o modificarse con herencia o con ActiveSupport::Concern para 
  aplicaciones más complejas.
- Autenticación con ```devise``` y cifrado ```bcrypt```,  
- Roles con ```cancancan```, inicialmente Administrador y Usuario
- Pruebas con ```minitest```
- Localización con mecanismos estándar de rails y además ```twitter_cldr``` y
  propuesta para localización de campos tipo fecha(s) (que no es bien 
  soportado por rails) especificando el formato local en 
  config.x.formato_fecha, así como ayudas para definir campos de fecha 
  localizados en ese formato.
- Vistas y formularios generados con las herramientas estándar de rails 
  y simple_form y chosen-rails para cuadros de selección sencilla y múltiple,
  y bootstrap-datepicker para campos de fecha. Se pagina con will_paginate.
- Preparado para construir aplicaciones adaptables (responsive) con bootstrap,
  coffescript, jquery y jquery-ui
- Propuesta para manejar tablas básicas (parámetros de la aplicación) con
  vistas automáticas (no requieren código), controladores y modelos 
  semiautomáticos vía un generador.   Propuestas iniciales de tablas
  básicas estándar para: paises, departamentos/estados, municipios, 
  centros poblados, tipos de centros poblados, tipos de sitios, ubicaciones, 
  tipos de relaciones entre personas, tipos de documentos de identificación, 
  oficinas.  Las existentes son faciles de modificar en aplicaciones que 
  usen el motor vía ```ActiveSupport::Concern```.
- En tablas basicas los campos ```has_many``` seran validados automaticamente 
  cuando se borra un registro para reportar si existen registros dependientes
  en otras tablas (en lugar de fallar)
- Datos geográficos completos para Colombia y Venezuela.
- Propuesta de estructura para otros modelos típicos: persona, anexo. También 
  modificables en una aplicación que use el motor 
  via ```ActiveSupport::Concern```.
- Manejo de anexos con ```paperclip``` 
- Facilidades de configuración en ```lib/sip/engine.rb```, como inclusión 
  automática de sus migraciones en las aplicaciones que usen el motor y 
  variables típicas de configuración.
- Tareas ```rake``` para actualizar indices, sacar copia de respaldo de base 
  de datos
- Aplicación de prueba completa en directorio ```test/dummy``` con diseño 
  web adaptable que brinda autenticación, manejo de clave, usuarios, 
  grupos y modificación de tablas básicas 


## Requerimientos

Ver <https://github.com/pasosdeJesus/sip/wiki/Requerimientos>

## Aplicación mínima incluida en sip

**sip** ya viene con una aplicación mínima que es la usada para hacer
pruebas de regresión, antes de iniciar una aplicación aparte, puedes
intentar ejecutar esa aplicación, siguiendo las instrucciones de:
<https://github.com/pasosdeJesus/sip/wiki/Aplicaci%C3%B3n-de-prueba>

## Creación de un sistema de información mínimo usando sip

Para iniciar una aplicación que usará **sip** sugerimos:

- Crea una aplicación rails  que use PostgreSQL
```
rails new minsip --database=postgresql
cd minsip
```
- Crea el usuario y la base de datos que emplearás y configurala 
  en ```config/database.yml```.  Recuerda que en adJ debes incluir para
  la conexión por omisión:
```
host: /var/www/var/run/postgresql
```
- Incluye ```sip``` y otras gemas necesarias:
```
echo "gem 'sip', github: 'pasosdeJesus/sip'" >> Gemfile
echo "gem 'paperclip'" >> Gemfile
echo "gem 'simple_form'" >> Gemfile
echo "gem 'cancancan'" >> Gemfile
echo "gem 'devise'" >> Gemfile
echo "gem 'devise-i18n'" >> Gemfile
echo "gem 'rails-i18n'" >> Gemfile
echo "gem 'will_paginate'" >> Gemfile
echo "gem 'twitter-bootstrap-rails'" >> Gemfile
echo "gem 'jquery-ui-rails'" >> Gemfile
echo "gem 'bootstrap-datepicker-rails'" >> Gemfile
echo "gem 'twitter_cldr' " >> Gemfile
bundle install
```
- Crea el archivo ```app/models/ability.rb``` inicialmente con:
```
# encoding: UTF-8

class Ability  < Sip::Ability
end
```
- Crea el archivo ```app/models/usuario.rb```. Si no planeas hacer cambios
  al modelo de SIP utiliza:
```
# encoding: UTF-8

class Usuario < Sip::Usuario
end
```
Si planeas hacer cambios utiliza:
```
# encoding: UTF-8

require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```

- Para establecer ruta de anexos crea un directorio (ej.
  ```mkdir -p /var/www/resbase/minsip```) y configura tu aplicación
  con un título y esa ruta para enviar anexos y volcados, lo haces en
  ```config/initializers/sip.rb``` con algo como:
```
#encoding: UTF-8 

Sip.setup do |config|
      config.ruta_anexos = "/var/www/resbase/miap/anexos/"
      config.ruta_volcados = "/var/www/resbase/miap/volcados/"
      # En heroku los anexos son super-temporales
      if !ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
        config.ruta_anexos = "#{Rails.root}/tmp/"
      end
      config.titulo = "Titulo en config/initializers/sip.rb"
end
```
- Remplaza ```app/controller/application_controller``` por
```
# encoding: UTF-8

require 'sip/application_controller'
class ApplicationController < ActionController::Base
  # Previente ataques CSRF elevando una excepción
  # En el caso de APIs, en cambio puedes querer usar :null_session
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
        u.permit(:email, 
                 :password, 
                 :password_confirmation, 
                 :current_password, 
                 :nombre, 
                 :email, 
                 :descripcion
                ) 
      }
    end
end
```
- Remplaza ```app/assets/javascript/application.js``` por
```
//= require sip/application
//= require_tree .
```
- Remplaza ```app/assets/stylesheet/application.css``` por
```
/*
 *= require_tree .
 *= require sip/application.css
 *= require_self
 */
```
- Remplaza ```app/views/layout/application_layout.html.erb``` por el menú 
  principal, por ejemplo comienza con:
```
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
    <%= menu_item "Documentacion", "https://github.com/pasosdeJesus/sip/wiki" %>
    <% if current_usuario %>
      <%= menu_item "Clave", sip.editar_registro_usuario_path %>
      <%= menu_item "Usuarios", sip.usuarios_path %>
      <%= menu_item "Tablas Básicas", sip.tablasbasicas_path %>
      <%= menu_item "Salir #{current_usuario.nusuario}", sip.sign_out_path %>
    <% else %>
      <%= menu_item "Acerca de", sip.acercade_path %>
      <%= menu_item "Iniciar Sesión", sip.new_usuario_session_path %> 
    <% end %>
  <% end %>
<% end %>

<% content_for :piedepagina do %>
  <p><span class='derechos'><a href="http://www.pasosdejesus.org/dominio_publico_colombia.html">Dominio Público de acuerdo a Legislación Colombiana</a><br/>
    Desarrollado por <a href="http://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2015. 
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```
- Remplaza ```config/routes.rb``` por
```
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
- Modifica la configuración de ```config/application.rb``` asegurando
  emplear volcados SQL, por ejemplo:
```
config.time_zone = 'America/Bogota'
config.i18n.default_locale = :es
config.active_record.schema_format = :sql
```
- Copia la estructura de la base de datos y creala
```
cp ruta_sip/test/dummy/db/structure.sql db/
```
- Prepara y carga como semillas para la base de datos las incluidas en
  sip y un usuario sip con clave sip123, modificando db/seeds.rb:

```
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
- Inicializa base de datos con:
```
rake db:setup sip:indices
```
- Pon el logo que deseas ver en la página inicial de la aplicación 
  en  ```public/images/logo.jpg```
- Lanza tu aplicación
```
rails s 
```
y examinala en el puerto 3000 con tu navegador http://localhost:3000, 
recuerda que el usuario inicial es sip con clave sip123

## Resto de la documentación 

Después de tener su primer ejemplo puedes generar tablas básicas para 
tu aplicación, personalizar los modelos, vistas y controladores que sip 
ofrece. Consulta: https://github.com/pasosdeJesus/sip/wiki

