# Aplicación de prueba

Asegúrate de contar con los [Requisitos](https://github.com/pasosdeJesus/sip/wiki/Requisitos)

Crea un usuario para la base de datos, iniciando el servidor de base de datos (postrgesql en este caso) y remplaza ```nuevaclave``` por la clave que le pondrás al usuario sipdes en la consola de postrgesql:
```
$ doas su - _postgresql
$ createuser -Upostgres -h /var/www/var/run/postgresql/ -s sipdes
$ psql -Upostgres -h /var/www/var/run/postgresql/
psql (10.1)
Type "help" for help.
postgres=# ALTER USER sipdes WITH PASSWORD 'nuevaclave';
postgres=# \q
$ exit
```
Para facilitar interacción con las bases de datos del usuario ```sipdes``` (o el que prefieras) y que no solicite clave para operar, agrega el usuario y la clave que asignaste al archivo ```~/.pgpass```:
```
echo "*:*:*:sipdes:nuevaclave" >> ~/.pgpass
```
Copia la plantilla de configuración de la base de datos y modifícala con la nueva clave que asignaste (y el usuario si lo cambiaste y si lo deseas puedes cambiar nombres de base de datos, o ubicación del socket de PostgreSQL):
```
$ cd test/dummy
$ cp config/database.yml.plantilla config/database.yml
$ vi config/database.yml
```
En el editor remplaza la clave de ejemplo (```aquilaclave```) por la que hayas asignado al usuario ```sipdes```.

A continuación  crea la base de datos (sugerimos hacerlo con PostgreSQL pues en ocasiones esta operación no logra ser completada por rails):
```sh
createdb -h /var/www/var/run/postgresql -U sipdes sipdes_des
```
Carga las semillas de la conexión de la base de datos con:

```sh
bin/rails db:seed
```

Y desde el mismo directorio ```test/dummy``` prepara la base de datos para operar:
```sh
bin/rails db:setup
bin/rails sip:indices
```

Finalmente inicia la aplicación, por ejemplo asociándola al puerto 3000 (por omisión) de la IP del servidor donde operas (en este ejemplo 192.168.1.3) con:
```
bin/rails s -b 192.168.1.3
```
Si requieres usar otro puerto basta con indicarlo con "-p _puerto_" como una adición a la instrucción anterior.

Usa la aplicación con un navegador en la URL http://192.168.1.3:3000/sip/, puedes ingresar con el usuario ```sip``` y la clave ```sip```
