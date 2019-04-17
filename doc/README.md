# Documentación de sip

Motor sobre Ruby on Rails para facilitar desarrollo y actualización de Sistemas de Información al estilo Pasos de Jesús

Es posible desarrollar rápidamente aplicaciones sobre Ruby on Rails, entre otras, por  el principio de convención sobre configuración.

Con sip se ha buscado aplicar más este principio al proceso de desarrollo, suponiendo que se seguirá una metodología ágil para poner en marcha el sistema y después seguir un ciclo regular de actualizaciones que mantenga sobre tecnologías recientes lo desarrollado durante bastantes años (e.g. cada 6 meses versiones mayores de sistema operativo, lenguaje y motor de base de datos y máximo cada 2 meses actualización a gemas y paquetes).

Entre las diversas elecciones, un poco contracorriente, se ha preferido el idioma español tanto para los sistemas que se desarrollan como para las fuentes  (por ejemplo para autenticación se emplea `Devise` con modelo `usuario`).


## Contenido

* Implementación
  * [Requisitos](https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md)
  * [Iniciar un sistema de información usando Sip](https://github.com/pasosdeJesus/sip/blob/master/doc/iniciar-si-usando-sip.md)
  * [Ejemplo de creación de tabla, modelo y controlador con vistas automáticas](https://github.com/pasosdeJesus/sip/blob/master/doc/ejemplo-con-vistas-automaticas.md)
  * Modelos
    * [Tablas incluidas y modelo entidad-asociación](https://github.com/pasosdeJesus/sip/blob/master/doc/modelo-entidad-asociacion.md)
    * [Personalización de modelos](https://github.com/pasosdeJesus/sip/blob/master/doc/personalizacion-de-modelos.md)
    * [Vistas automáticas con Sip::Modelo y Sip::ModelosController](https://github.com/pasosdeJesus/sip/blob/master/doc/vistas-automaticas.md)
    * [Tablas Básicas](https://github.com/pasosdeJesus/sip/blob/master/doc/tablas-basicas.md)
    * [Uso y personalización del modelo usuario](https://github.com/pasosdeJesus/sip/blob/master/doc/modelo-usuario.md)
  * [Personalización de rutas, controladores y vistas](https://github.com/pasosdeJesus/sip/blob/master/doc/rutas-controladores-vistas.md)
    * [Personalización del punto de montaje](https://github.com/pasosdeJesus/sip/blob/master/doc/punto-de-montaje.md)
    * [Personalización de recursos javascript y css](https://github.com/pasosdeJesus/sip/blob/master/doc/recursos-javascript-y-css.md)
    * [Personalización de diseño visual, logo y favicon](https://github.com/pasosdeJesus/sip/blob/master/doc/diseño-visual-logo-y-favicon.md)
    * [Internacionalización y personalización de nombres de campos y tablas](https://github.com/pasosdeJesus/sip/blob/master/doc/internacionalizacion-nombres-campos-y-tablas.md)
    * [Localización de cantidades numéricas y fechas](https://github.com/pasosdeJesus/sip/blob/master/doc/localizacion-numeros-y-fechas.md)
* Pruebas
  * [Aplicación de prueba](https://github.com/pasosdeJesus/sip/blob/master/doc/aplicacion-de-prueba.md)
  * [Pruebas con minitest](https://github.com/pasosdeJesus/sip/blob/master/doc/pruebas-con-minitest.md)
  * [Pruebas del sistema con sideex](https://github.com/pasosdeJesus/sip/blob/master/doc/pruebas-al-sistema-con-sideex.md)
* Mantenimiento 
  * [Configurar copia de respaldo cifrada](https://github.com/pasosdeJesus/sip/blob/master/doc/respaldo-cifrado.md)
  * Vea ayudas para actualizaciones en el wiki de sip: [https://github.com/pasosdeJesus/sip/wiki]
* Convenciones, modularidad
  * [Convenciones respecto al código fuente](https://github.com/pasosdeJesus/sip/blob/master/doc/convenciones.md)
  * [Iniciar un motor que use sip](https://github.com/pasosdeJesus/sip/blob/master/doc/iniciar-motor-con-sip.md)

