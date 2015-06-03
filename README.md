# Motor para Sistemas de Información estilo Pasos de Jesús
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sip.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#desarrollo)

Este es un motor para un sistema de información sobre Ruby on Rails 4.2 y
PostgreSQL (preferiblemente cifrado como en adJ).

Este motor incluye 
* Autenticación con devise y bcrypt,  
* Roles con cancancan, 
* Pruebas con rspec y factory girl,
* Propuesta para manejar tablas básicas (parámetros de la aplicación) y ejemplos
  de estas para: paises, departamentos/estados, municipios, centros poblados, tipos de 
  centros poblados, tipos de sitios, ubicaciones, tipos de relaciones entre 
  personas, tipos de documentos de identificación, oficinas.  Faciles de 
  modificar en aplicaciones que usen el motor vía ActiveSupport::Concern.
* Datos geográficos completos para Colombia y Venezuela.
* Propuesta de estructura para otros modelos típicos: persona, anexo; también 
  modificables en una aplicación que use el motor via ActiveSupport::Concern.
* Manejo de anexos con paperclip 
* Facilidades de configuración en ```lib/sip/engine.rb```, como inclusión automática 
  de sus migraciones en las aplicaciones que usen el motor y variables típicas 
  de configuración.
* Localización con ```twitter_cldr```
* Tareas ```rake``` para actualizar indices, sacar copia de respaldo de base de datos
* Generador de nuevas tablas básicas
* Aplicación de prueba completa en directorio ```spec/dummy``` con diseño 
  web adaptable (responsive) usando ```bootstrap```, ```simple_form``` y ```jquery```,
  que permite autenticación, manejo de clave y de usuarios y modificar las tablas básicas 
  paginando con ```will_paginate```

## Diseño

Se han extraido de las partes comunes de diversos sistemas de información,
particularmente de SIVeL 2, Cor440 y Sal7711 (disponibles en el sitio
de Pasos de Jeśus en github.com)

Roles: administrador y usuario

Todo se maneja como motor aislado, excepto usuario para facilitar uso de Devise.


## Uso

### Requerimientos
* Ruby version >= 2.1
* PostgreSQL >= 9.3 con extensión unaccent disponible
* Recomendado sobre adJ 5.6 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.


## Pruebas
Se han implementado algunas pruebas con RSpec a modelos y pruebas de regresión.

* Instale gemas requeridas (como Rails 4.2) con:
``` sh
  cd spec/dummy
  bundle install
```
Aunque para minimizar descargas vale la pena instalar como gemas del
sistema la mayoría de estas, en adJ con:
```sh
  grep "^ *gem" Gemfile | sed -e "s/gem [\"']//g;s/[\"'].*//g" | xargs sudo NOKOGIRI_USE_SYSTEM_LIBRARIES=1 make=gmake gem install
```
* Cree usuario para PostgreSQL (recomendado ```sipdes``` o el que usted 
  especifique en ```config/database.yml```) y pongale una clave, por ejemplo 
  en adJ
```sh
sudo su - _postgresql
$ createuser -Upostgres -h/var/www/tmp -s sipdes
$ psql -h/var/www/tmp -Upostgres
psql (9.4.1)
Type "help" for help.

postgres=# ALTER USER sipdes WITH password 'aquilaclave';
ALTER ROLE
postgres=# \q
$ exit
```
* Prepare ```spec/dummy/config/database.yml``` con los datos de la base 
	que creo:
```sh
  cp spec/dummy/config/database.yml.plantilla spec/dummy/config/database.yml
  vim spec/dummy/config/database.yml
```
* Prepare base de prueba con:
``` sh
  cd spec/dummy
  RAILS_ENV=test rake db:drop
  RAILS_ENV=test rake db:setup
  RAILS_ENV=test rake sip:indices
```
* Ejecute las pruebas desde el directorio del motor con:
```sh
  rspec
```

## Aplicación de prueba

Puede iniciar un servidor de desarrollo con:
```sh
  cd spec/dummy
  rails s -b 127.0.0.1 -p 3000
```
y examinar desde el mismo computador con un navegador en: 
```http://127.0.0.1:3000```

Puede ingresar con usuario ```sip``` y clave ```sip123``` para interactuar 
con el manejo de usuarios (menú Clave para cambiar datos de su cuenta y clave, 
menú Usuarios para administrar usuarios) y con el manejo de tablas básicas.


## Desarrollo

Si tiene instalado coffeescript, podrá verificar sintaxis de archivos del 
directorio app/assets/javascript/ con:
```sh
  make
```

En adJ para instalar coffeescript basta:
```sh
  sudo npm install -g coffee-script
```


### Convenciones

Los nombres de tablas en la base --a diferencia de la convención rails-- se
dejan en singular.

2 espacios de indentación.

Para configurarlo en vim, agregue al final de ```~/.vim/ftplugin/ruby.vim```:
``` vim
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
```

http://betterspecs.org/
http://www.caliban.org/ruby/rubyguide.shtml
https://hakiri.io/blog/ruby-security-tools-and-resources

### Modelos faciles de personalizar

Casi todos están en el espacio de nombres sip excepto usuario y ability
(usados por Devise y CanCanCan sin espacio de nombres).

Esto da 2 técnicas para personalizar modelos:

- mixins para todos los modelos en espacio de nombres sip, por lo cual se 
  definen de verdad en lib/sip/concerns/models y en app/models/sip sólo
  se incluyen.
- para ability herencia, pero aprovechando el espacio de nombres (seria
  bueno probar que también es posible con usuario).
  


### Tablas básicas

Una tabla básica tiene por lo menos: 
- id (por defecto un entero autoincremental, pero puede ser otro tipo)
- nombre (por defecto máximo de 500 caracteres y obligatorio),
- observaciones (por defecto máximo de 5000 caracteres)

Las acciones ```index``` y ```show``` presentan los nombres de campos usando
el método de clase ```human_attribute_name(campo)```
Los valores de cada campo los genera con el método presenta del modelo. 
Este método por defecto presenta:
* Booleanos como si y no
* Campos que sean llaves foraneas con el método ```presenta_nombre``` de 
  la tabla relacionada
* Asociaciones ```has_many``` en tablas combinadas concatendando los nombres
  (mediante ```presenta_nombre```) y separando con ';'
* Otros campos como cadena

En los modelos puede sobrecargar los métodos de objeto ```presenta_nombre```
y presenta, así como definir traducciones o sobrecargar el método de clase
```human_attribute_name``` para personalizar más.

En el formulario de edición/creación como controles de edición se usaran:
* Campos de selección para llaves foraneas
* Campos de selección múltiple para asociaciones has_many
* Campos de feha para campos con tipo ```:date```
* Campos enteros para campos con tipo ```:integer```
* Campos de texto para los demás casos.

Sin embargo puede personalizarse el control para edición para un campo
digamos con nombre ```tfuente``` creando en la aplicación la vista parcial 
```app/views/sip/admin/basicas/_tfuente.html.erb```


#### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en base de datos de la
la aplicación de  prueba spec/dummy:
```sh
cd spec/dummy
RAILS_ENV=test rake sip:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

