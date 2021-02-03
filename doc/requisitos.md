# Requisitos

* Recomendamos emplear la distribución adJ 6.8 del sistema operativo OpenBSD,
  que ya incluye configurada la pila de software que presentamos a continuación.
  Puedes ver sobre la instalación de Ruby on Rails en adJ en
  <http://pasosdejesus.github.io/usuario_adJ/conf-programas.html#ruby>
* Ruby versión >= 3.0
* Ruby on Rails >= 6.0.0 (la instalas con `doas gem install rails`)
* PostgreSQL >= 13.0 con extensión `unaccent` disponible y posibilidad
  de crearle un usuario con permisos para crear bases de datos
* `node.js` >= 12.16.1 y `coffescript` instalado globalmente 
  (i.e.  `npm install -g coffee-script`)
* Una cuenta en el sistema operativo para desarrollo, esta cuenta 
  debe tener permiso de usar al menos 1024M en RAM y para abrir al menos 
  2048 archivos.  
  Para asegurarlo, en adJ como superusuario asegúrate de poner
  un valor alto al máximo de archivos que el kernel puede abrir
  simultaneamente en la variable de configuración `kern.maxfiles`, por
  ejemplo 20000 en `/etc/sysctl.conf`, y en la clase de la cuenta de desarrollo
  (en `/etc/login.conf`) que al menos diga
  `:datasize-cur=1024M:` y  `:openfiles-cur=2048:`
* `yarn` instalado en la cuenta de desarrollo. Según 
  <https://classic.yarnpkg.com/en/docs/install/#alternatives-stable>
  primero instala bash (en adJ con `doas pkg_add bash`) y luego ejecuta:
```
curl -o- -L https://yarnpkg.com/install.sh | bash
```
* Recomendado usar `bundler` con `doas` para mantener gemas en un
  directorio de la forma `/var/www/bundler-miusuario`, ejecutando:
```
bundle config path /var/www/bundler-miusuario/
```
  o asegurando que el archivo ~/.bundle/config contiene:
```
---
BUNDLE_PATH: "/var/www/bundler-miusuario/"
```
* Recomendamos emplear zsh, tmux y neovim con los archivos de configuración
  e instrucciones disponibles en
  <https://github.com/pasosdeJesus/adJ/tree/master/arboldd/usr/local/share/adJ/archconf>



