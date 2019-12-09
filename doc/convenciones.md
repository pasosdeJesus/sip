# Convenciones respecto al código fuente

Respecto a licenciamiento y uso de github por favor ver https://github.com/pasosdeJesus/sip/blob/master/CONTRIBUTING.md

En general adoptamos las de thoughtbot:
https://github.com/thoughtbot/guides/tree/master/style



A continuación enfatizamos o cambiamos algunas:

# Uso de español en fuentes

Esperamos inicialmente desarrolladores de habla hispana, por eso esperamos los identificadores y comentarios que se introduzcan en español.

Si algún componente resulta muy popular como para ser usado por hablantes de otros idiomas, esperamos su ayuda para traducir a inglés.

# Tablas y modelos en singular, controladores y vistas en plural

En el mundo SQL una convencin usual es emplear en singular nombres de tablas, pero rails buscando dejar más legible algunos casos de uso ha propuesto emplear plural para nombres de tablas y modelos.

Preferimos la convención tradicional de SQL y por lo mismo los modelos también deben especificarse en singular.

# SQL
* Nombres de tablas en singular.
* Palabras reservadas de SQL en mayúscula.
* Identificadores  que se introduzcan en minúsculas y cuando sea nombre de una tabla que se componene de varias palabras, separarlas con  `_`.   Por ejemplo `causa_refugio_id` en lugar de `causaRefugio_id`
* Tablas combinadas (Join tables), el nombre debe tener lo principal de las tablas que une  ordenadas alfabéticamente (por ejemplo sip_grupo con sip_usuario sería sip_grupo_usuario).

# Ruby

## Diseño
En nuevos sistemas de información emplear motores tanto como sea posible. Se recomienda que sean descendientes de sip, que da unidad en manejo de tablas básicas, usuarios y autenticación.

Por ejemplo algunas de las aplicaciones en el repositorio de Pasos de Jesús en github dependen de sip así:
![Dependencias](https://github.com/pasosdeJesus/sip/raw/master/doc/dependencias.png)

## Fuentes

* Usar en fuentes codificación UTF-8
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

Si tiene instalado coffeescript, podrá verificar sintaxis de archivos del directorio `app/assets/javascript/` con:
```sh
  make
```

En adJ para instalar coffeescript basta:
```sh
  sudo npm install -g coffee-script
```


# HTML/CSS
