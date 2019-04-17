# Personalización de rutas, controladores y vistas

El controlador de la aplicación completa ```app/controllers/application_controller.rb``` no se necesita en motores, en aplicaciones basta que sea:
```
# encoding: UTF-8
require 'sip/application_controller'
class ApplicationController < Sip::ApplicationController
  protect_from_forgery with: :exception
end
```

## Diseño general de la interfaz / layout

Uno genérico se define en ```app/views/layout/sip/application.html.erb``` que es adaptable y para completar contenidos mediante ```content_for```.  Sus características son:
- Tiene un título definible en :titulo
- Tiene una barra de menus en la parte superior, que puede definirse en :menu
- Un contenedor en el centro con el contenido principal con el contenido principal
- Un pie de página definible en :piedepagina

Para usarlo en aplicaciones basta en ```app/views/layouts/application.html.erb``` definir los contenidos, por ejemplo:
```
<% content_for :titulo do %>
    <%= Sip.titulo %>
<% end %>

<% content_for :menu do %>
  <%= menu_group :pull => :right do %>
    <%= menu_item "Documentacion", "http://github.com/pasosdeJesus/sip.git" %>
    <%= menu_item "Acerca de", sip.acercade_path %>
    <%= menu_item "Iniciar Sesión", sip.new_usuario_session_path %>
  <% end %>
<% end %>

<% content_for :piedepagina do %>
  <p><span class='derechos'>Dominio Público de acuerdo a Legislación Colombiana<br/>
    Desarrollado por <a href="http://www.pasosdeJesus.org" target="_blank">Pasos de Jesús</a>. 2015.
  </span></p>
<% end %>

<%= render template: "layouts/sip/application" %>
```

Si un motor descendiente lo modificará se recomienda en ```app/views/layout/Mimotor/application.html.erb```, ver por ejemplo https://github.com/pasosdeJesus/sal7711_gen/blob/master/app/views/layouts/sal7711_gen/application.html.erb


## Controlador hogar

La página principal, el listado de tablas básicas y el acceso a "Acerca de" se definen en el controlador ```app/controllers/sip/hogar_controller.rb``` y sus vistas ```app/views/sip/hogar```.  

La vista de la página principal ```app/views/sip/hogar/index.html.erb``` sólo presenta la imagen que
esté disponible en ```public/images/logo.jpg``` y el mensaje que se deje en la vista parcial ```app/views/sip/hogar/_local.html.erb```.  Se recomienda incluir en repositorio git de aplicaciones ```app/views/sip/hogar/_local.html.erb.plantilla``` que se espera copiar y modificar en instalaciones locales como  ```app/views/sip/hogar/_local.html.erb```

Se recomienda definir ```app/views/sip/hogar/acercade.html.erb```

Para modificar el controlador en otro motor Mimotor se recomienda en ```app/controllers/Mimotor/hogar_controller.rb``` que herede de Sip::HogarController, que modifique lo necesario y que sea referenciado desde ```config/routes.rb``` del motor.

