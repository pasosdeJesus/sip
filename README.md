# Motor para Sistemas de Información estilo Pasos de Jesús
[![Build Status](https://semaphoreci.com/api/v1/vtamara/sip/branches/master/badge.svg)](https://semaphoreci.com/vtamara/sip) [![Clima del Código](https://codeclimate.com/github/pasosdeJesus/sip/badges/gpa.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![Cobertura de Pruebas](https://codeclimate.com/github/pasosdeJesus/sip/badges/coverage.svg)](https://codeclimate.com/github/pasosdeJesus/sip) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master) [![Dependencias](https://gemnasium.com/pasosdeJesus/sip.svg)](https://gemnasium.com/pasosdeJesus/sip) 

![Logo de sip](https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/public/images/logo.jpg)

Este es un motor diseñado para ser base actualizada de sistemas de información seguros o 
de otros motores para sistemas de información.

Puedes pensarlo como una capa adicional sobre Ruby on Rails que incluye 
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
- Pruebas con ```minitest```
- Modelos y controladores básicos con diversos propósitos y facilmente ampliables o modficables con herencia o con ActiveSupport::Concern para aplicaciones más complejas.
- Propuesta para administrar modelos con vistas automáticas (no requieren código) y 
  controladores semiautomáticos vía un generador.  Similar a 
  (ActiveAdmin)[https://activeadmin.info/],
  (Administrate)[https://github.com/thoughtbot/administrate] y
  (Rails Admin)[https://github.com/sferik/rails_admin]
  Usa Sip::Modelo, Sip::ModelosController y vistas de 
  ```app/views/sip/modelos/```. La vista index incluye
  un filtro definible con scope en el modelo.  La vista 
  _form genera automaticamente un formulario con elementos tipicos.
  Consultar https://github.com/pasosdeJesus/sip/wiki/Vistas-autom%C3%A1ticas-con-Sip::Modelo-y-Sip::ModelosController
- Concepto y propuesta de tablas básicas (parámetros de la aplicación) con
  vistas automáticas y controladores y modelos semiautomáticos vía un generador. Validación automática de campos ```has_many``` cuando se borra un registro para reportar si existen  registros dependientes en otras tablas (en lugar de fallar)
- Propuesta inicial para control de acceso con:
  - Autenticación con tabla ```usuario``` (modelo ::Usuario), gema ```devise``` y cifrado ```bcrypt```
  - Autorización con tablas ```sip_grupo``` (modelo Sip::Grupo), sip_grupo_usuario, gema ```cancancan``` y roles iniciales Administrador y Operador.
- Tablas estándar iniciales para ubicaciones geográficas ```sip_pais```, ```sip_departamento```, ```sip_municipio```, ```sip_clase``` (para centros poblados), ```sip_tclase``` (tipos de centros poblados), ```sip_tsitio``` (tipo de sitio) y ```sip_ubicacion```. Con datos de todos los paises, aunque estados y municipios completos para Colombia y Venezuela y ciudades completas para Colombia de acuerdo a DIVIPOLA 2015 con actualización periódica (vía migraciones de rails) de acuerdo a esa fuente oficial.
- Tablas estándar iniciales para personas y relaciones entre personas ```sip_persona```, ```sip_trelacion``` (tipo de relación entre personas),  ```tdocumento``` (tipo de documento de identificación personal), ```sip_persona_trelacion``` (relación entre 2 personas).
- Tablas estándar iniciales para grupos de personas `sip_grupoper`, actores sociales `sip_actorsocial`, sus sectores `sip_sectoractor` y la relación entre una persona y un actor social con su perfil `sip_actorsocial_persona` y `sip_perfilactorsocial`
- Propuesta inicial para anexos con tabla ```sip_anexo``` y vistas incrustables y gema ```paperclip```
- Facilidades de configuración de aplicaciones que usen este motor mediante archivo ```config/initializers/sip.rb``` que define por ejemplo: pais por omision en ```Sip.paisomision```.  Así mismo la inicialización de este motor (```lib/sip/engine.rb```) incluye automáticamente migraciones de motores en la aplicación final.
- Propuesta de respaldo cifrado y comprimido con 7z por parte de usuario final (del rol que se configure) desde menús de la aplicación.
- Localización con mecanismos estándar de rails y de ```twitter_cldr```.
  Propuesta para localización de campos tipo fecha(s) (que en español no es bien 
  soportado por rails) especificando el formato local en 
  config.x.formato_fecha, así como ayudas para definir campos de fecha 
  localizados en ese formato.
- Vistas y formularios generados con las herramientas estándar de rails 
  y `simple_form` y `chosen-rails` para cuadros de selección sencilla y múltiple,
  y `bootstrap-datepicker` para campos de fecha. Listados paginados con `will_paginate`.
- Incluye biblioteca para operaciones comunes con javascript, por ejemplo para 
  facilitar actualización automática mediante AJAX (ver 
  `sip_enviarautomatico_formulario` en 
  `app/asset/javascript/sip/motor.js.coffee.erb` que enviará
  automáticamente formularios cuando cambien campos con clase
  ```enviarautomatico``` o se presionen enlaces a anclas con esa clase)
- Preparado para construir aplicaciones adaptables (responsive) con 
  `bootstrap`, `coffescript`, `jquery` y `jquery-ui`
- Tareas `rake` para actualizar indices y sacar copia de respaldo de base 
  de datos

## Requisitos

Ver <https://github.com/pasosdeJesus/sip/wiki/Requisitos>

## Aplicación mínima incluida en sip

**sip** ya viene con una aplicación mínima (en directorio ```test/dummy``` ) que es la usada para hacer
pruebas de regresión.  Es una aplicación completa con diseño 
web adaptable, autenticación, manejo de clave con condensado bcrypt, usuarios, 
grupos y modificación de tablas básicas. Incluso antes de intentar iniciar una aplicación aparte, puede
intentar ejecutar esa aplicación mínima, siguiendo las instrucciones de:
<https://github.com/pasosdeJesus/sip/wiki/Aplicaci%C3%B3n-de-prueba>

## Iniciar un sistema de información usando sip

Ver https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip

## Resto de la documentación 

Después de tener su primer ejemplo puedes generar tablas básicas para 
tu aplicación, personalizar los modelos, vistas y controladores que sip 
ofrece. Consulta: https://github.com/pasosdeJesus/sip/wiki

