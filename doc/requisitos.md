# Requisitos

* Ruby version >= 2.7
* Ruby on Rails >= 6.0.0 
* PostgreSQL >= 12.0 con extensión `unaccent` disponible
* `node.js` >= 10.16 y `coffescript` instalado globalmente (i.e  `npm install -g coffee-script`)
* Recomendado sobre adJ 6.6 (que incluye todos los componentes mencionados y donde `sassc` compila bien)
  usando `bundler` con `doas` para mantener gemas en `/var/www/bundler`, ver
  <http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>.
* El usuario que utilice la aplicación debe tener permiso de usar al menos
  1024M en RAM y para abrir al menos 2048 archivos.  En adJ asegurate de poner
  un valor alto al máximo de archivos que el kernel pueden abrir
  simultanemanete en la variable de configuración ```kern.maxfiles``` por
  ejemplo 20000 en ```/etc/sysctl.conf``` y en la clase del usuario que
  inicia la aplicación (en ```/etc/login.conf```) que al menos diga
  ```:datasize-cur=1024M:``` y  ```:openfiles-cur=2048:```

Estas instrucciones suponen que operas en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en
<http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>


