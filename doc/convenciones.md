# Convenciones respecto al código fuente

Respecto a licenciamiento y uso de github por favor ver https://github.com/pasosdeJesus/sip/blob/master/CONTRIBUTING.md

En general adoptamos las de thoughtbot:
https://github.com/thoughtbot/guides



A continuación enfatizamos o cambiamos algunas:

# Uso de español en fuentes

Esperamos inicialmente desarrolladores de habla hispana, por eso esperamos los identificadores y comentarios que se introduzcan en español.  Para traducir términos recomendamos wikipedia y <https://fundeu.es/wp-content/uploads/2018/02/Glosario-de-Comunicaci%C3%B3n-Estrat%C3%A9gica-Fund%C3%A9u.pdf>

Si algún componente resulta muy popular como para ser usado por hablantes de otros idiomas, esperamos su ayuda para traducir a inglés.

# Configuración con variables de ambiente

Es un lineamiento de https://12factor.net/
La forma particular de lograrlo en cada lenguaje y ambiente varía.


# SQL

* Palabras reservadas de SQL en mayúscula.
* Nombres de tablas en singular y preferible que sean una sola palabra (sin usar `_`).  Si son de un motor comienzan con el nombre del motor y `_` por ejemplo `sip_grupo`.  La excepcion pueden ser tablas combinadas (Join tables), cuyo nombre se puede componer del nombre de las dos tablas que une  ordenadas alfabéticamente (por ejemplo `sip_pais` con `sip_grupo` sería `sip_grupo_pais`).
* SQL no es sensitivo a mayúsculas/minúsculas pero Ruby si lo es.  Sugerimos escribir nombres de campos que se compongan de varias palabras con capitalización camello pero empezando en minúscula, por ejemplo  `colorFlotaSubitemFuente` en lugar de `color_flota_subitem_fuente` pero los que sean llaves foraneas si mejor terminados en `_id`, por ejemplo `caso_id` 
* Emplear funciones para utilidades generales. Separar palabras con raya al piso `_`.  Si se definen en un motor ponerle de prefijo el nombre del motor seguido de `_`.  

## Tablas y modelos en singular, controladores y vistas en plural

En el mundo SQL una convención usual es emplear en singular nombres de tablas, 
pero rails buscando dejar más legible algunos casos de uso ha propuesto 
emplear plural para nombres de tablas y modelos.

Preferimos la convención tradicional de SQL y por lo mismo los modelos 
también deben especificarse en singular, sin embargo si mantenemos
la convención de controladores y vistas en plural.


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


## Configuración de aplicacíon Ruby on Rails con variables de ambiente

* Deja las variables de configuración en .env.plantilla (que al iniciar
  el uso de una aplicación debe copiarse en .env) y usalas a lo largo
  de las fuentes. 
  * Puedes iniciar el archivo .env.plantilla copiandolo de otra motor
    o aplicación similar o en su defecto de sip.
  * Predefine cada variable en un bloque de la 
    forma siguiente (cambia `BD_USUARIO` por el nombre de la variable 
    y su valor predeterminado en lugar de `sipdes`):
  ```
  if (test "$BD_USUARIO" = "") then {
    export BD_USUARIO=sipdes
  } fi
  ```
  * En lugar de archivos plantilla agrega variables de ambiente en donde 
    puede haber configuraciones variables a lo largo de la aplicación. Si 
    necesitas introducir variables, recomendamos que sea en mayúscula, 
    remplazando espacios por _ y que comiencen con el nombre del motor 
    (e.g `SIP_FORMATO_FECHA`). Recuerda definir los valores predeterminados
    en `.env.plantilla` y además en el código ruby en lugar de 
    `ENV['MIMOTOR_VAR']` emplea 
    `ENV.fetch('MIMOTOR_VAR', 'valor predeterminado')` o si la aplicación 
    debe fallar si no está definida usa `ENV.fetch('MIMOTOR_VAR')`. 
    La idea es que al final del proceso todas las configuraciones se 
    concentren en `.env.plantilla` y en lo posible que sea el único archivo 
    plantilla.
  * Ten atención especial con `config/database.yml` donde deben emplearse
    las variables `BD_USUARIO`, `BD_CLAVE`, `BD_DES`, `BD_PRUEBA` y `BD_PRO`.
    También con `config/routes.rb` y `config/initializers/punto_montaje.rb` donde
    debe emplearse la variable `RUTA_RELATIVA` con el punto de montaje.

* Emplea la gema `dotenv-rails` para leer las variables de ambiente
  en modos de desarrollo y producción y el sistema operativo para 
  garantizarlas en modo producción.
  * Agrega la gema `dotenv-rails` en una sección sólo para modos 
  `development` y `test` de tu `Gemfile`

*  Copia de `sip/test/dummy` los scripts `bin/corre`, `bin/detiene` y 
   `bin/migra` en el directorio `bin.`


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

Para CSS seguir https://github.com/thoughtbot/guides/tree/main/css
