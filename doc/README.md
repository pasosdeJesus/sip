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
    * [Internacionalización y personalización de nombres de campos y tablas](https://github.com/pasosdeJesus/sip/wiki/Internacionalizaci%C3%B3n-y-personalizaci%C3%B3n-de-nombres-de-campos-y-tablas)
    * [Localización de cantidades numéricas y fechas](https://github.com/pasosdeJesus/sip/wiki/Localizaci%C3%B3n-de-cantidades-num%C3%A9ricas-y-fechas)
* Pruebas
  * [Aplicación de prueba](https://github.com/pasosdeJesus/sip/wiki/Aplicaci%C3%B3n-de-prueba)
  * [Pruebas de Regresión](https://github.com/pasosdeJesus/sip/wiki/Pruebas-de-Regresi%C3%B3n)
  * [Pruebas del sistema con sideex](https://github.com/pasosdeJesus/sip/wiki/Pruebas-del-sistema-con-sideex)
* Mantenimiento y actualización
  * [Configurar copia de respaldo cifrada](https://github.com/pasosdeJesus/sip/wiki/Configurar-copia-de-respaldo-cifrada)
  * [Actualizando a Rails 5](https://github.com/pasosdeJesus/sip/wiki/Actualizando-a-rails-5)
  * [Actualización de Rails 5.1 a Rails 5.2](https://github.com/pasosdeJesus/sip/wiki/Actualizaci%C3%B3n-de-rails-5.1-a-rails-5.2)
  * [Actualización a PostgreSQL posterior a 10.2](https://github.com/pasosdeJesus/sip/wiki/Actualizaci%C3%B3n-a-PostgreSQL-posterior-a-10.2)
  * [Actualización a DIVIPOLA 2018](https://github.com/pasosdeJesus/sip/wiki/Actualizaci%C3%B3n-a-Divipola-2018)
* Convenciones, modularidad
  * [Convenciones respecto al código fuente](https://github.com/pasosdeJesus/sip/wiki/Convenciones-respecto-al-c%C3%B3digo-fuente)
  * [Iniciar un motor que use sip](https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-motor-que-use-sip)

