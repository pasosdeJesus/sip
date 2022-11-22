# Integración de sip con Stimulus

## Introducción a Stimulus

Stimulus es una librería para Javascript-ES6 que facilita hacer cambios
dinámicos en formularios. Particularmente facilita identificar en el HTML 
los campos o elementos que generan acciones y los campos o elementos afectados 
por esas acciones, así mismo facilita especificar las acciones en Javascript 
moderno.


Para usarlo escribe en Javascript-ES6 como módulo un 
controlador descendiente de `Controller` de `@hotwired/stimulus` y
úbicalo en `app/javascript/controllers/` 
(por ejemplo `app/javascript/controllers/persona_ppt_controller`).
Marca en el HTML generado 3 tipos de elementos:
1. Un área que contenga los elementos que el controlador manejará o usará
   (podría haber varías áreas y los eventos se limitarán al área circundante
   al elemento que genera la acción).  Por ejemplo un `div` o un `form` a los
   que debes agregar un atributo de la forma 
   `data-controller='*controlador*'`, por ejemplo 
   `<form data-controller='persona-ppt'>`.
2. Uno o varios elementos que sean objetivos (*target*) bien para extraer 
   información de ellos o bien para establecer su valor o propiedades.
   A cada uno de estos elementos agregales un atributo de 
   la forma `data-*controlador*-target='*nombre_objetivo*'`. Por ejemplo
   `<input id='ppt' data-persona-ppt-target='ppt'>`
3. Uno o varios elementos que iniciarán acciones que típicamente involucran
   los elementos objetivo. A cada uno agregale un atributo de
   la forma `data-action='*evento*->*controlador*#*metodo*'`.
   Por ejemplo 
   ```
   <input id='ultimoestatusmigratorio_id'
     data-action='change->persona_ppt#cambia_ultimoestatusmigratorio'
   >
  ```

## Cambio a generadores automáticos de formularios para agregar atributos Stimulus

Como es estándar de sip puedes usar los mecanismos típicos de rails para
implementar tus formularios, pero si desea usar la generación automática
de formularios, la hemos ampliado para facilitarte
agregar los atributos requeridos por stimulus a los elementos HTML:

1. Marca un formulario completo como área con escuchadores 
   stimulus en el controlador en ruby del formulario (por ejemplo
   `personas_controller.rb`) sobrecargando la función 
   `atributos_html_encabezado_formulario` para que retorne un diccionario 
   con los atributos por agregar. El siguiente ejemplo asocia
   dos controladores:
   ```
    def atributos_html_encabezado_formulario
      {'data-controller': 'sip--sindocaut persona-ppt'
    end
   ```

2. Para cada campo que sea objetivos o que genere acciones crea
   una vista parcial que llame a la vista genérica 
   `sip/modelos/sip_camo_aut` pero pasa un diccionario de atributos 
   adicionales para el campo mismo (i.e `input`) o para el elemento 
   envolvente que suele crearsele (i.e `div`), con los parámetros
   `atributos_internos` o `atributos_externos` respectivamente.  
   Por ejemplo:
  ```
  <%= render partial: 'sip/modelos/sip_campo_aut',
    locals: {
      f: f, 
      atr: 'ultimoestatusmigratorio_id', 
      atributos_internos: {
        'data-action': 'change->persona_ppt#cambia_ultimoestatusmigratorio'
      },
      opciones: {
        chosen: false 
      }
    }
  %>
  ```

(En este ejemplo se deshabilita chosen porque depende de jQuery y no opera 
con el evento estándar change).

# Uso de controladores Stimulus de motores rails

En aplicaciones es típico que los controladores stimulus se ubiquen
en `app/javascript/controllers` pero en motores no hay una sugerencia
ni un mecanismo proveido por rails para cargar los controladores stimulus
de motores.

Si su aplicación usa `esbuild` nos ha funcionado emplear 
`--preserve-symlinks` y enlaces desde la aplicación a los controladores 
de los motores. Por eso sip provee la tarea rake `sip:stimulus_motores` 
que crea los enlaces.

Si el motor `mi_motor` define el controlador `miControlador` en su
directorio `app/javascript/controllers`, al ejecutar
```
bin/rails sip:stimulus_motores
``` 
en una aplicación (o en la aplicación de prueba del motor) la ruta
`app/javascript/controllers/mi_motor` será un enlace
al directorio `app/javascript/controllers` de la gema `mi_motor`, por esto
desde la aplicación se podrá referenciar con
`mi-motor--mi-controlador`

Un ejemplo más concreto es el controlador stimulus 
`cancelar_vacio_es_eliminar` incluido en el motor sip en
`app/javascript/controllers/cancelar_vacio_es_eliminar.js` 
el cual cambia el comportamiento de un botón cancelar de un formulario
de edición para que elimine si se determina que el formulario
está vacío.

Desde aplicaciones (o motores que incluyan sip) que lo empleen
en el HTML se conectaría el controlador a un formulario añadiendole
```
data-controller="sip--cancelar-vacio-es-eliminar"
```
Hay otros elementos HTML que deberán marcarse para que ese controlador opere
bien como puede verse en sus fuentes, pero todos son de la forma 
`data-sip--cancelar-vacio-es-eliminar...=...`.
