# Motor para Sistemas de Información estilo Pasos de Jesús
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sip.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

## Tabla de Contenido
* [Diseño](#diseño)
* [Uso](#uso)
* [Pruebas](#pruebas)
* [Desarrollo](#pruebas)

Este es un motor para un sistema de información sobre Ruby on Rails y
PostgreSQL.

Este motor incluye 
* Autenticación con devise, 
* Roles con cancancan, 
* Esqueleto para tablas básicas (o parámetros de la aplicación), y datos
  geográficos como paises y departamentos/estados, municipios y ciudades
  con  ubicación de Colombia y Venezuela.
* Estructura de unas para tablas típicas: persona

## Diseño

Se ha extraido de las partes comunes de diversos sistemas de información,
particularmente de SIVeL, Cor440 y Sal7711.

Roles: administrador y usuario

## Uso

### Requerimientos
* Ruby version >= 2.1
* PostgreSQL >= 9.3 con extensión unaccent disponible
* Recomendado sobre adJ 5.5p2 (que incluye todos los componentes mencionados).  
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
* Cree usuario para PostgreSQL (recomendado sipdes o el que especifique en 
  config/database.yml) y pongale una clave, por ejemplo en adJ
```sh
sudo su - _postgresql
$ createuser -Upostgres -h/var/www/tmp -s sivel2
$ psql -h/var/www/tmp -Upostgres
psql (9.3.5)
Type "help" for help.

postgres=# ALTER USER sivel2 WITH password 'miclave';
ALTER ROLE
postgres=# \q
$ exit
```
* Prepare spec/dummy/config/database.yml con los datos de la base que creo:
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

## Desarrollo

Si tiene instalado coffescript, podrá verificar sintaxis de archivos del 
directorio app/assets/javascript/ con:
```sh
  make
```

### Convenciones

2 espacios de indentación.

Para configurarlo en vim, agregue al final de ==~/.vim/ftplugin/ruby.vim==:
``` vim
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
```

http://betterspecs.org/
http://www.caliban.org/ruby/rubyguide.shtml
https://hakiri.io/blog/ruby-security-tools-and-resources

### Generación de datos de tablas básicas

Una vez estén bien los datos de tablas básicas en base de datos de la
la aplicación de  prueba spec/dummy:
```sh
cd spec/dummy
RAILS_ENV=test rake sivel2:vuelcabasicas
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```

