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
- Roles con ```cancancan```, inicialmente Administrador y Operador
- Pruebas con ```minitest```
- Localización con mecanismos estándar de rails y de ```twitter_cldr```.
  Propuesta para localización de campos tipo fecha(s) (que no es bien 
  soportado por rails) especificando el formato local en 
  config.x.formato_fecha, así como ayudas para definir campos de fecha 
  localizados en ese formato.
- Propuesta de respaldo cifrado por parte de usuario final (del rol que se configure).
- Vistas y formularios generados con las herramientas estándar de rails 
  y simple_form y chosen-rails para cuadros de selección sencilla y múltiple,
  y bootstrap-datepicker para campos de fecha. Se pagina con will_paginate.
- Preparado para construir aplicaciones adaptables (responsive) con 
  bootstrap, coffescript, jquery y jquery-ui
- Propuesta para administrar tablas básicas (parámetros de la aplicación) con
  vistas automáticas (no requieren código), controladores y modelos 
  semiautomáticos vía un generador.   Propuestas iniciales de tablas
  básicas estándar para: paises, departamentos/estados, municipios, 
  centros poblados, tipos de centros poblados, tipos de sitios, ubicaciones, 
  tipos de relaciones entre personas, tipos de documentos de identificación, 
  oficinas.  Las existentes son faciles de modificar en aplicaciones que 
  usen el motor vía ```ActiveSupport::Concern```.  Poner código del
  pais por omision en ```Sip.paisomision```
- Inicio de propuesta para administrar tablas con vistas automáticas y 
  controladores semiautomáticos.  Similar a 
  (ActiveAdmin)[https://activeadmin.info/],
  (Administrate)[https://github.com/thoughtbot/administrate] y
  (Rails Admin)[https://github.com/sferik/rails_admin]
  Usa Sip::Modelo, Sip::ModelosController y vistas de 
  ```app/views/sip/modelos/```. La vista index incluye
  un filtro definible con scope en el modelo.  La vista 
  _form genera automaticamente un formulario con elementos tipicos.
  Consultar https://github.com/pasosdeJesus/sip/wiki/Vistas-autom%C3%A1ticas-con-Sip::Modelo-y-Sip::ModelosController
  Hay un generador que facilita la creación del modelo y la vista.
- En tablas basicas los campos ```has_many``` seran validados 
  automaticamente cuando se borra un registro para reportar si existen 
  registros dependientes en otras tablas (en lugar de fallar)
- Datos geográficos completos para Colombia y Venezuela.
- Propuesta de estructura para otros modelos típicos: persona, anexo. 
  También modificables en una aplicación que use el motor 
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
- Librería para operaciones comunes con javascript, por ejemplo para 
  facilitar actualización automática mediante AJAX (ver 
  ```sip_enviarautomatico_formulario``` en 
  ```app/asset/javascript/sip/motor.js.coffee.erb``` que enviará
  automáticamente formularios cuando cambien campos con clase
  ```enviarautomatico``` o se presionen enlaces a anclas con esa clase)

## Requisitos

Ver <https://github.com/pasosdeJesus/sip/wiki/Requisitos>

## Aplicación mínima incluida en sip

**sip** ya viene con una aplicación mínima que es la usada para hacer
pruebas de regresión, antes de iniciar una aplicación aparte, puedes
intentar ejecutar esa aplicación, siguiendo las instrucciones de:
<https://github.com/pasosdeJesus/sip/wiki/Aplicaci%C3%B3n-de-prueba>

## Iniciar un sistema de información usando sip

Ver https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip

## Resto de la documentación 

Después de tener su primer ejemplo puedes generar tablas básicas para 
tu aplicación, personalizar los modelos, vistas y controladores que sip 
ofrece. Consulta: https://github.com/pasosdeJesus/sip/wiki

