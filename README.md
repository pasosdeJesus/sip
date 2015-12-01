# Motor para Sistemas de Información estilo Pasos de Jesús
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sip.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

![Logo de sip](https://raw.githubusercontent.com/pasosdeJesus/sip/master/spec/dummy/public/images/logo.jpg)

Este es un motor para sistemas de información sobre Ruby on Rails 4.2 y
PostgreSQL (con base de dato preferiblemente cifradas como en adJ).

Este motor incluye 
- Autenticación con ```devise``` y ```bcrypt```,  
- Roles con ```cancancan```, inicialmente Administrador y Usuario
- Pruebas con ```rspec``` y ```factory girl```,
- Propuesta para manejar automaticamente tablas básicas 
  (parámetros de la aplicación) y ejemplos de estas para: 
  paises, departamentos/estados, municipios, 
  centros poblados, tipos de centros poblados, tipos de sitios, ubicaciones, 
  tipos de relaciones entre personas, tipos de documentos de identificación, 
  oficinas.  Faciles de modificar en aplicaciones que usen el motor 
  vía ```ActiveSupport::Concern```
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
- Localización con ```twitter_cldr```
- Tareas ```rake``` para actualizar indices, sacar copia de respaldo de base 
  de datos
- Generador de nuevas tablas básicas
- Aplicación de prueba completa en directorio ```spec/dummy``` con diseño 
  web adaptable (responsive) usando ```bootstrap```, ```simple_form``` 
  y ```jquery```, que brinda autenticación, manejo de clave y de usuarios 
  y modificación las tablas básicas paginando con ```will_paginate```


## Requerimientos
* Ruby version >= 2.2
* Ruby on Rails 4.2.x
* PostgreSQL >= 9.4 con extensión unaccent disponible
* Recomendado sobre adJ 5.7 (que incluye todos los componentes mencionados).  

Estas instrucciones suponen que opera en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en 
http://dhobsd.pasosdejesus.org/Ruby_on_Rails_en_OpenBSD.html

## Creación de un sistema de información mínimo usando sip

- Crea una aplicación rails  que use PostgreSQL
```
rails new minsip --database=postgresql
cd minsip
```
- Crea el usuario y la base de datos que emplearás y configurala 
  en ```config/database.yml```.  Recuerda que en adJ debes incluir para
  la conexión por omisión:
```
host: /var/www/tmp
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
echo "gem 'cancancan'" >> Gemfile
echo "gem 'paperclip'" >> Gemfile
echo "gem 'will_paginate'" >> Gemfile
echo "gem 'twitter-bootstrap-rails'" >> Gemfile
echo "gem 'jquery-ui-rails'" >> Gemfile
echo "gem 'jquery-ui-bootstrap-rails', git: 'https://github.com/kristianmandrup/jquery-ui-bootstrap-rails'" >> Gemfile
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
- Crea el archivo ```app/models/usuario.rb``` inicialmente con:
```
# encoding: UTF-8

class Usuario < Sip::Usuario
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
cp ruta_sip/spec/dummy/db/structure.sql db/
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

Después de tener su primer ejemplo puede generar tablas básicas para su aplicación, personalizar los modelos, vistas y controladores que sip ofrece. Consulte: https://github.com/pasosdeJesus/sip/wiki
