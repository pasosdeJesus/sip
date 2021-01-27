# Requisitos

* Ruby versión >= 2.7
* Ruby on Rails >= 6.0.0 (la instalas con `doas gem install rails`)
* PostgreSQL >= 12.0 con extensión `unaccent` disponible
* `node.js` >= 12.16 y `coffescript` instalado globalmente 
  (i.e.  `npm install -g coffee-script`)
* Recomendado sobre adJ 6.8 (que incluye todos los componentes mencionados)
  usando `bundler` con `doas` para mantener gemas en `/var/www/bundler`, ver
  <http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>.
* El usuario que utilice la aplicación debe tener permiso de usar al menos
  1024M en RAM y para abrir al menos 2048 archivos.  En adJ asegúrate de poner
  un valor alto al máximo de archivos que el kernel puede abrir
  simultaneamente en la variable de configuración `kern.maxfiles`, por
  ejemplo 20000 en `/etc/sysctl.conf`, y en la clase del usuario que
  inicia la aplicación (en `/etc/login.conf`) que al menos diga
  `:datasize-cur=1024M:` y  `:openfiles-cur=2048:`
* `yarn` instalado en cuenta del usuario. Según 
  <https://classic.yarnpkg.com/en/docs/install/#alternatives-stable>
  primero instala bash (en adJ con `doas pkg_add bash`) y luego ejecuta:
```
curl -o- -L https://yarnpkg.com/install.sh | bash
```


Estas instrucciones suponen que operas en este ambiente, puedes ver más sobre
la instalación de Ruby on Rails en adJ en
<http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>


