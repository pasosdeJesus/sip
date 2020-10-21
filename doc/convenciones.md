# Convenciones respecto al código fuente

Respecto a licenciamiento y uso de github por favor ver https://github.com/pasosdeJesus/sip/blob/master/CONTRIBUTING.md

En general adoptamos las de thoughtbot:
https://github.com/thoughtbot/guides/tree/master/style



A continuación enfatizamos o cambiamos algunas:

# Uso de español en fuentes

Esperamos inicialmente desarrolladores de habla hispana, por eso esperamos los identificadores y comentarios que se introduzcan en español.  Para traducir términos recomendamos wikipedia y <https://fundeu.es/wp-content/uploads/2018/02/Glosario-de-Comunicaci%C3%B3n-Estrat%C3%A9gica-Fund%C3%A9u.pdf>

Si algún componente resulta muy popular como para ser usado por hablantes de otros idiomas, esperamos su ayuda para traducir a inglés.

# Tablas y modelos en singular, controladores y vistas en plural

En el mundo SQL una convención usual es emplear en singular nombres de tablas, 
pero rails buscando dejar más legible algunos casos de uso ha propuesto 
emplear plural para nombres de tablas y modelos.

Preferimos la convención tradicional de SQL y por lo mismo los modelos 
también deben especificarse en singular, sin embargo si mantenemos
la convención de controladores y vistas en plural.

# SQL

* Palabras reservadas de SQL en mayúscula.
* Nombres de tablas en singular y preferible que sean una sola palabra (sin usar `_`).  Si son de un motor comienzan con el nombre del motor y `_` por ejemplo `sip_grupo`.  La excepcion pueden ser tablas combinadas (Join tables), cuyo nombre se puede componer del nombre de las dos tablas que une  ordenadas alfabéticamente (por ejemplo `sip_pais` con `sip_grupo` sería `sip_grupo_pais`).
* SQL no es sensitivo a mayúsculas/minúsculas pero Ruby si lo es.  Sugerimos escribir nombres de campos que se compongan de varias palabras con capitalización camello pero empezando en minúscula, por ejemplo  `colorFlotaSubitemFuente` en lugar de `color_flota_subitem_fuente` pero los que sean llaves foraneas si mejor terminados en `_id`, por ejemplo `caso_id` 

# Ruby

## Diseño
En nuevos sistemas de información emplear motores tanto como sea posible. Se recomienda que sean descendientes de sip, que da unidad en manejo de tablas básicas, usuarios y autenticación.

Por ejemplo algunas de las aplicaciones en el repositorio de Pasos de Jesús en github dependen de sip así:
![Dependencias](https://github.com/pasosdeJesus/sip/raw/master/doc/dependencias.png)

## Fuentes

* Usar en fuentes codificación UTF-8
* Terminar líneas sólo con \n (como es típico en el mundo Unix).
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

Seguir sugerencias de https://github.com/thoughtbot/guides/blob/main/javascript/README.md

Si tiene instalado coffeescript, podrá verificar sintaxis de archivos del directorio `app/assets/javascript/` con:
```sh
  make
```

En adJ para instalar coffeescript basta:
```sh
  sudo npm install -g coffee-script
```

# HTML/CSS
