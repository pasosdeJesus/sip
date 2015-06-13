# Motor para Sistemas de Información estilo Pasos de Jesús
[![Estado Construcción](https://api.travis-ci.org/pasosdeJesus/sip.svg?branch=master)](https://travis-ci.org/pasosdeJesus/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

Este es un motor para sistemas de información sobre Ruby on Rails 4.2 y
PostgreSQL (preferiblemente cifrado como en adJ).

Este motor incluye 
- Autenticación con devise y bcrypt,  
- Roles con cancancan, inicialmente Administrador y Usuario
- Pruebas con rspec y factory girl,
- Propuesta para manejar tablas básicas (parámetros de la aplicación) 
  y ejemplos de estas para: paises, departamentos/estados, municipios, 
  centros poblados, tipos de centros poblados, tipos de sitios, ubicaciones, 
  tipos de relaciones entre personas, tipos de documentos de identificación, 
  oficinas.  Faciles de modificar en aplicaciones que usen el motor vía 
  ```ActiveSupport::Concern```.
- Datos geográficos completos para Colombia y Venezuela.
- Propuesta de estructura para otros modelos típicos: persona, anexo; también 
  modificables en una aplicación que use el motor via 
  ```ActiveSupport::Concern```.
- Manejo de anexos con paperclip 
- Facilidades de configuración en ```lib/sip/engine.rb```, como inclusión 
  automática de sus migraciones en las aplicaciones que usen el motor y 
  variables típicas de configuración.
- Localización con ```twitter_cldr```
- Tareas ```rake``` para actualizar indices, sacar copia de respaldo de base 
  de datos
- Generador de nuevas tablas básicas
- Aplicación de prueba completa en directorio ```spec/dummy``` con diseño 
  web adaptable (responsive) usando ```bootstrap```, ```simple_form``` 
  y ```jquery```, que permite autenticación, manejo de clave y de usuarios 
  y modificar las tablas básicas paginando con ```will_paginate```


## Requerimientos
* Ruby version >= 2.1
* PostgreSQL >= 9.3 con extensión unaccent disponible
* Recomendado sobre adJ 5.6 (que incluye todos los componentes mencionados).  
  Las siguientes instrucciones suponen que opera en este ambiente.

## Ejemplo de uso para crear un nuevo sistema de información usando sip

Cree una aplicación rails, incluya sip como gema, cree los archivos app/models/ability.rb, app/models/usuario.rb, modifique app/controller/application_controller, app/assets/javascript/application.js, app/assets/stylesheet/application.css, app/views/layout/application_layout.html.erb, config/routes copie estructura de base de datos, cree base, lance aplicación.

## Resto de la documentación 

Después de tener su primer ejemplo peude generar tablas básicas para su aplicación, personalizar los modelos, vistas y controladores que sip ofrece. Consulte: https://github.com/pasosdeJesus/sip/wiki
