# Convenciones respecto al código fuente

Respecto a licenciamiento y uso de github por favor ver https://github.com/pasosdeJesus/sip/blob/master/CONTRIBUTING.md

En general adoptamos las de thoughtbot:
https://github.com/thoughtbot/guides/tree/master/style

A continuación enfatzamos o cambiamos algunas:

# SQL

* Tablas combinadas (Join tables), el nombre debe tener lo principal de las tablas que une, ordenadas alfabéticamente.
* Los nombres de tablas en la base --a diferencia de la convención rails-- s dejan en singular.

# Ruby

## Diseño

En nuevos sistemas de información emplear motores tanto como sea posible Se recomienda que sean descendientes de sip, que da unidad en manejo de tablas básicas, usuarios y autenticación.

Por ejemplo algunas de las aplicaciones en el repositorio de Pasos de Jesús en github dependen de sip así:
![Dependencias](https://github.com/pasosdeJesus/sip/raw/master/doc/dependencias.png)

## Fuentes

* Usar en fuentes codificación UTF-8 y comenzar cada archivo fuente con ```# encoding: UTF-8``` y a continuación línea en blanco.
* 2 espacios de indentación.
* Para configurarlo en vim, agregue al final de ```~/.vim/ftplugin/ruby.vim```:
``` vim
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
```

http://betterspecs.org/
http://www.caliban.org/ruby/rubyguide.shtml
https://hakiri.io/blog/ruby-security-tools-and-resources


# Javascript/Coffeescript

Si tiene instalado coffeescript, podrá verificar sintaxis de archivos de directorio app/assets/javascript/ con:
```sh
  make
```

En adJ para instalar coffeescript basta:
```sh
  sudo npm install -g coffee-script
```


# HTML/CSS

