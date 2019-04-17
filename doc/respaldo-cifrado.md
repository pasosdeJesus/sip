# Configurar copia de respaldo cifrada

Para que los usuarios puedan descargar copia de respaldo cifrada que les permite recuperar el sitio (volcado de la base de datos y anexos) como se explica en [Copia de respaldo cifrada](https://github.com/pasosdeJesus/sip/wiki/Copia-de-respaldo-cifrada):
* Asegurar tener ```7z``` en servidor (se incluye en adJ).
* Agregar un menú o alguna manera para que los roles con permiso puedan descargar. Por ejemplo en app/views/layout/application.html.erb agregar:
```
<% if can? :manage, Sip::Respaldo7z %>
     <%= menu_item "Respaldo cifrado", sip.respaldo7z_path %>
<% end %>
```
* Asegurar que aplicación tiene ruta root, por ejemplo en ```config/routes.rb```:
```
root 'sip/hogar#index'
```
* Agregar permiso para que los roles apropiados puedan descargar, por ejemplo entre las autorización para el rol ROLADMIN de ```app/models/ability.rb``` agregar:
```
when Ability::ROLADMIN
  can :manage, Sip::Respaldo7z
```


