# Documentación de sip

Motor sobre Ruby on Rails para facilitar desarrollo y actualización de 
Sistemas de Información al estilo Pasos de Jesús

Es posible desarrollar rápidamente aplicaciones sobre Ruby on Rails, entre 
otras, por  el principio de convención sobre configuración.

Con sip se ha buscado aplicar más este principio al proceso de desarrollo, 
suponiendo que se seguirá una metodología ágil para poner en marcha el sistema 
y después seguir un ciclo regular de actualizaciones que mantenga sobre 
tecnologías recientes lo desarrollado durante bastantes años (e.g. cada 
6 meses versiones mayores de sistema operativo, lenguaje y motor de base 
de datos y máximo cada 2 meses actualización a gemas y paquetes).

Entre las diversas elecciones, un poco contracorriente, se ha preferido el 
idioma español tanto para los sistemas que se desarrollan como para las 
fuentes  (por ejemplo para autenticación se emplea `Devise` con modelo 
`usuario`).


## Contenido

* Implementación
  * [Requisitos](requisitos.md)
  * [Iniciar un sistema de información usando Sip](iniciar-si-usando-sip.md)
  * [Ejemplo de creación de tabla, modelo y controlador con vistas automáticas](ejemplo-con-vistas-automaticas.md)
  * Modelos
    * [Tablas incluidas y modelo entidad-asociación](modelo-entidad-asociacion.md)
    * [Tablas Básicas](tablas-basicas.md)
    * [Tablas Asociativas](tablas-asociativas.md)
    * [Uso y personalización del modelo usuario](modelo-usuario.md)
    * [Personalización de modelos](personalizacion-de-modelos.md)
  * Controladores
    * [Facilidades con controladores descendientes de Sip::ModelosController](facilidades-controlador.md)
  * Rutas y vistas
    * [Vistas automáticas con Sip::Modelo y Sip::ModelosController](vistas-automaticas.md)
    * [Personalización de rutas, controladores y vistas](rutas-controladores-vistas.md)
    * [Personalización del punto de montaje](punto-de-montaje.md)
    * [Personalización de recursos javascript y css](recursos-javascript-y-css.md)
    * [Personalización de diseño visual, logo y favicon](diseño-visual-logo-y-favicon.md)
    * [Uso de controladores stimulus de motores rails](stimulus.md)
  * Internacionalización y personalización
    * [Inflecciones en español](inflecciones_espanol.md)
    * [Internacionalización y personalización de nombres de campos y tablas](internacionalizacion-nombres-campos-y-tablas.md)
    * [Localización de cantidades numéricas y fechas](localizacion-numeros-y-fechas.md)
    * [Personalizaciones que pueden hacer los desarrolladores](personalizaciones_desarrolladores.md)
* Pruebas
  * [Aplicación de prueba](aplicacion-de-prueba.md)
  * [Pruebas con minitest](pruebas-con-minitest.md)
  * [Pruebas del sistema con sideex](pruebas-al-sistema-con-sideex.md)
* Mantenimiento 
  * [Configurar copia de respaldo cifrada](respaldo-cifrado.md)
  * Vea ayudas para actualizaciones en el wiki de sip: [https://github.com/pasosdeJesus/sip/wiki]
* Convenciones, modularidad
  * [Convenciones respecto al código fuente](convenciones.md)
  * [Iniciar un motor que use sip](iniciar-motor-con-sip.md)

