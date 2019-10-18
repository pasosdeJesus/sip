# Personalización de diseño visual, logo y favicon

Un diseño (layout) por omisión para todas las páginas se ubica en ```app/views/layouts/sip/application.html.erb``` y una página portada por omisión en `app/views/sip/hogar/index.html.erb` , incluyen soporte para:
* Encabezado fijo, pie de página y espacio para el contenido
* Una imagen de portada que debe ubicar en `app/assets/images/logo.jpg`
* favicons de diversos tamaños. Podrá generalos desde http://faviconit.com/ a partir de una imagen al menos de 310x310.  Ubiquelos en el directorio ```app/assets/images``` con los nombres dados por esa página.
* Un titulo que se recomienda especificar en config/initializers/sip.rb y aparecerá como título de la página y al lado izquierdo de la barra de navegación
* Diseño adaptable (responsive) basado en bootstrap, que reubica menus como desplegables en dispositivos móbiles y escala imagen de portada
* Un menú que se puede especificar en el contenido con nombre ```menu```
* Una guía-rastro (breadcrumb) especificable en el contenido con nombre ```breadcrumb```
* Espacio para las notificaciones (flash)
* Contenido principal de la página

Desde su aplicación lo usa en ```app/views/layouts/application.html.erb``` que debe tener los contenidos organizados así:

```
<% content_for :titulo do %>
    <%= Sip.titulo %>
<% end %>

<% content_for :menu do %>
  <%= menu_group do %>
    <% if !current_usuario.nil? %>
      <%= menu_item "Carne1", "/" %>
    <% end %>
  <% end %>
  <%= menu_group :pull => :right do %>
    <%= menu_item "Documentacion", "https://github.com/pasosdeJesus/sip/wiki" %>
    <% if current_usuario %>
      <%= menu_item "Clave", sip.editar_registro_usuario_path %>
      <%= menu_item "Usuarios", sip.usuarios_path %>
      <%= menu_item "Tablas Básicas", sip.tablasbasicas_path %>
      <%= menu_item "Salir #{current_usuario.nusuario}", sip.sign_out_path %>
    <% else %>
      <%= menu_item "Acerca de", sip.acercade_path %>
      <%= menu_item "Iniciar Sesión", sip.new_usuario_session_path %> 
    <% end %>
  <% end %>
<% end %>

<% content_for :piedepagina do %>
  <p><span class='derechos'><a href="http://www.pasosdejesus.org/dominio_publico_colombia.html">Dominio Público de acuerdo a Legislación Colombiana</a><br/>
    Desarrollado por <a href="http://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2016. 
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```


Los colores pueden personalizarse con los temas o creando por ejemplo un archivo  ```app/assets/stylesheets/personaliza.css``` con un contenido como el siguiente:

* Personalización del color de la barra de navegación, degrade de blanco a acre, aunque color acre en navegadores que no lo soportan:
```css
.navbar {
        background-image: linear-gradient(rgb(255, 255, 255), rgb(135, 43, 0));
        color: #872b00;
}
```

# Elementos del diseño visual para sistemas de información web


## Estrategía

El diseño visual del sistema de información le ayuda a dar identidad y por eso suele relacionarse con la identidad institucional del cliente o del negocio.  Como se describe en https://en.wikipedia.org/wiki/Graphic_design  "es importante para un diseñador gráfico entender las necesidades de su cliente, así como las necesidades de la gente que interacturará con el diseño.   El trabajo del diseñador es combinar los objetivos del negocio con objetivos creativos para elevar el diseño más alla de los medios puramente estéticos"


## Maquetación 

Se refiere a la organización de los elementos visuales en una página.  

Como se explica en https://en.wikipedia.org/wiki/Page_layout "a alto nivel, incluye decidir la ubicación de textos e imagenes ... requiere inteligencia, sentimiento y creatividad, y se informa de la cultura, de la psicologia y de lo que los autores del contenido y los editores deseam comunicar y enfatizar."

Nos parecen preferibles maquetaciones dinámicas (o adaptables, del inglés responsive), pues optimizan esfuerzo y recursos de diseñar maquetaciones estáticas para cada posible dispositivo donde se consultará el sistema de información.

Las decisiones suelen incluir (traducido de https://en.wikipedia.org/wiki/Page_layout#Grids_versus_templates):

* Tamaño de las margenes
* Tamaño y posición de imagenes y figuras
* Decidir el número y tamaño de las columnas y los canales (del inglés gutters que es el espacio entre columnas)
* Ubicación de espacio en blanco intencional
* Uso de efectos especiales como superponer texto sobre una imagen, alrededores o instrusión, o sangrar una imagen sobre el margen de una página.

Los elementos específicos por ubicar pueden incluir:
* Capítulo o títulos de secciones, o encabezados o subencabezados
* Títulos de imagenes
* Cajas o notas al margen, que presenten información al lado del flujo del texto principal.
* Encabezados y pies de página, cuyo contenido es usualmente uniforme a lo largo de diversas páginas del sistema de información.

Flexbox y CSS Grid son ayudas importantes para lograr maquetaciones adaptables, pero para comenzar un diseño, cuando no hay mucha exp
Sin embargo por la cantidad y omplejidad del tema, recomendamos emplear Bootrap iniciando una maqueta por ejemplo con https://www.layoutit.com/build e inspirandose en ideas de maquetaciones como pueden verse en galerias como por ejemplo https://colorlib.com/wp/free-bootstrap-gallery-templates/


## Tipografía

Es recomendable usar dos tipos de letra, uno serif (o con adornos como el tipo Roman) para títulos y uno sans-serif (sin adornos como el tipo Arial) para el texto.  Puede buscarse tipografía acorde a la identidad institucional o del negocio.  Recomendamos emplear https://fonts.google.com/ pues consta de tipografías de libre uso, información de cada tipografía y muestra de como se ve una tipografía en combinación con una segunda.


## Colores

Es importante elegir una paleta de colores, tipicamente de 5 colores. La paleta puede partir de un color base (por ejemplo tomado del logo de la institución o de un tema del negocio)  y después emplear un esquema de colores (ver https://es.wikipedia.org/wiki/Esquema_del_color)  para completar la paleta.   Una herramienta en línea que facilita usar un esquema de colores (o regla de armonia de colores) para proponer una paleta es https://color.adobe.com/create  
 
Estos esquemas de colores suelen operar sobre el espacio de colore HSV (por ser más entendible para nuestra percepción humana) aún cuando a la hora de implementar para el web es mejor convertir al espacio RGB que es más usado en páginas web.


## Iconos

Pueden ayudar a simplificar y a la vez aclarar la interfaz.  Se recomienda elegir de FontAwesome: https://fontawesome.com/


