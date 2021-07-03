# Motor para Sistemas de Información estilo Pasos de Jesús - sip
[![Revisado por Hound](https://img.shields.io/badge/Reviewed_by-Hound-8E64B0.svg)](https://houndci.com) [![Estado Construcción](https://gitlab.com/pasosdeJesus/sip/badges/main/pipeline.svg)](https://gitlab.com/pasosdeJesus/sip/-/pipelines) [![Mantenibilidad](https://api.codeclimate.com/v1/badges/fa979bbb3fc3d52a9d6f/maintainability)](https://codeclimate.com/github/pasosdeJesus/sip/maintainability) [![Cobertura de Pruebas](https://api.codeclimate.com/v1/badges/fa979bbb3fc3d52a9d6f/test_coverage)](https://codeclimate.com/github/pasosdeJesus/sip/test_coverage) [![security](https://hakiri.io/github/pasosdeJesus/sip/master.svg)](https://hakiri.io/github/pasosdeJesus/sip/master)


![Logo de sip](https://raw.githubusercontent.com/pasosdeJesus/sip/master/test/dummy/app/assets/images/logo.jpg)

Este es un motor diseñado para ser base actualizada de sistemas de información
seguros o de otros motores para sistemas de información.

Puedes pensarlo como una capa adicional sobre Ruby on Rails que incluye
soluciones estándar, seguras y probadas para más elementos de un sistema
de información como:

- Pila actualizada: desarrollado en simultaneo con adJ (distribución de
  OpenBSD) y modificado para operar siempre sobre las nuevas versiones
  de adJ que se actualizan cada 6 meses para incluir:
  sistema operativo más reciente, motor de base de datos más reciente,
  Ruby reciente, librerías y gemas más recientes.   Probado de manera
  continua en Linux (vía integración continúa con travis.org).  
  Busca promover gemas recienten que faciliten el desarrollo del resto
  de la aplicación a nivel de interfaz e internacionalización y proveer
  ayudas para actualizar --por lo menos documentación en el directorio
  [doc](https://github.com/pasosdeJesus/sip/tree/master/doc) y guías de 
  actualización en el [wiki](https://github.com/pasosdeJesus/sip/wiki).
- Pruebas con `minitest`
- Modelos y controladores básicos con diversos propósitos y fácilmente
  ampliables o modificables con herencia o con `ActiveSupport::Concern`
  para aplicaciones más complejas.
- Propuesta para administrar modelos con vistas automáticas (no requieren
  código) y controladores semiautomáticos vía un generador.  Similar a
  (ActiveAdmin)[https://activeadmin.info/],
  (Administrate)[https://github.com/thoughtbot/administrate] y
  (Rails Admin)[https://github.com/sferik/rails_admin]
  Usa Sip::Modelo, Sip::ModelosController y vistas de
  `app/views/sip/modelos/`. La vista `index` incluye
  un filtro definible con `scope` en el modelo.  La vista parcial
  `_form` genera automáticamente un formulario con elementos típicos.
  Consulta <https://github.com/pasosdeJesus/sip/wiki/Vistas-autom%C3%A1ticas-con-Sip::Modelo-y-Sip::ModelosController>
- Concepto y propuesta de tablas básicas (también llamados tesauros
  de la aplicación o parámetros de la aplicación) con
  vistas automáticas y controladores y modelos semiautomáticos vía un
  generador. 
  Validación automática de campos `has_many` cuando se borra un registro
  para reportar si existen  registros dependientes en otras tablas (en lugar
  de fallar)
- Propuesta inicial para control de acceso con:
  - Autenticación con tabla `usuario` (modelo ::Usuario), gema `devise`
    y cifrado `bcrypt`
  - Autorización muy configurable con gema `cancancan` que puede valerse
    de roles (inicialmente sólo Administrador y Operador) o grupos
    (implementados en tablas `sip_grupo` --modelo `Sip::Grupo`--,
    y `sip_grupo_usuario`), o en otras tablas o métodos que elija.
- Tablas estándar iniciales para ubicaciones geográficas `sip_pais`,
  `sip_departamento`, `sip_municipio`, `sip_clase` (para centros
  poblados), `sip_tclase` (tipos de centros poblados), `sip_tsitio`
  (tipo de sitio) y `sip_ubicacion`. Con datos de todos los países,
  aunque estados y municipios completos para Colombia y Venezuela y ciudades
  completas para Colombia de acuerdo a DIVIPOLA 2019 con actualización
  periódica (vía migraciones de `rails`) de acuerdo a esa fuente oficial.
- Tablas estándar iniciales para personas y relaciones entre personas
  `sip_persona`, `sip_trelacion` (tipo de relación entre personas),  
  `tdocumento` (tipo de documento de identificación personal),
  `sip_persona_trelacion` (relación entre 2 personas).
- Tablas estándar iniciales para grupos de personas
  `sip_grupoper`, organizaciones sociales `sip_orgsocial` (así llamamos a 
  un grupo de personas que se ponen de acuerdo para un trabajo o 
  representación conjunta), sus sectores `sip_sectororgsocial` y la 
  relación entre una persona y una organización social con su perfil 
  `sip_orgsocial_persona` y
  `sip_perfilorgsocial`
- Propuesta inicial para anexos con tabla `sip_anexo` y vistas
  incrustables y gema `paperclip`
- Facilidades de configuración de aplicaciones que usen este motor mediante
  - Variables de ambiente en un archivo `.env` y la gema `dotenv`.  
  - Con variables de configuración de rails en el espacio de 
  nombres `config.x`, 
  - Con variables de configuración  en `config/initializers/sip.rb` (por 
  ejemplo país por omisión en `Sip.paisomision`.
  - La inicialización de este motor (`lib/sip/engine.rb`) incluye 
  automáticamente migraciones de motores en la aplicación final.
- Propuesta de respaldo cifrado y comprimido con `7z` por parte de usuario
  final (del rol que se configure) desde menús de la aplicación.
- Localización con mecanismos estándar de `rails` y de `twitter_cldr`.
  Propuesta para localización de campos tipo fecha(s) (que en español no es
  bien soportado por `rails`) especificando el formato local en
  `config.x.formato_fecha`, así como ayudas para definir campos de fecha
  localizados en ese formato.
- Vistas y formularios generados con las herramientas estándar de `rails`
  y `simple_form` y `chosen-rails` para cuadros de selección simple y múltiple,
  y `bootstrap-datepicker` para campos de fecha.
  Listados paginados con `will_paginate`.
- Tareas `rake` para actualizar indices y sacar copia de respaldo de base
  de datos
- Preparado para construir aplicaciones adaptables (_responsive_) con
  `bootstrap`, `coffescript`, `jquery` y `jquery-ui`
- Incluye biblioteca para operaciones comunes con javascript, por ejemplo para
  facilitar actualización automática mediante AJAX (ver
  `sip_enviarautomatico_formulario` en
  `app/asset/javascript/sip/motor.js.coffee.erb` que enviará
  automáticamente formularios cuando cambien campos con clase
  `enviarautomatico` o se presionen enlaces a anclas con esa clase)

## Requisitos

Ver <https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md>

## Aplicación mínima incluida en sip

**sip** ya viene con una aplicación mínima (en el directorio `test/dummy` )
que es la usada para hacer pruebas de regresión.  Es una aplicación completa
con diseño web adaptable, autenticación, manejo de clave con condensado 
`bcrypt`, usuarios, grupos, vistas completas para tablas básicas y para
modelos persona y organización social. Incluso antes de intentar
iniciar una aplicación aparte, puede intentar ejecutar esa aplicación mínima,
siguiendo las instrucciones de:
<https://github.com/pasosdeJesus/sip/blob/master/doc/aplicacion-de-prueba.md>

## Iniciar un sistema de información usando sip

Ver 
<https://github.com/pasosdeJesus/sip/blob/master/doc/iniciar-si-usando-sip.md>

## Resto de la documentación

Después de tener tu primer ejemplo puedes generar tablas básicas para
tu aplicación, personalizar los modelos, vistas y controladores que `sip`
ofrece. 
Consulta: <https://github.com/pasosdeJesus/sip/blob/master/doc/README.md>
