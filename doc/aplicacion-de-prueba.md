# Aplicación de prueba

Asegúrate de contar con los [Requisitos](https://github.com/pasosdeJesus/sip/wiki/Requisitos)

Crea un usuario para la base de datos (remplaza ```nuevaclave``` por la clave que le pondrás):
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
Copia la plantilla de configuración de la base de datos y modiícala con la nueva clave que asignaste (y el usuario si lo cambiaste y si lo deseas puedes cambiar nombres de base de datos, o ubicación del socket de PostgreSQL):
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
Y desde el mismo directorio ```test/dummy``` prepárala para operar:
```sh
bin/rails db:setup
bin/rails sip:indices
```

Finalmetne inicia la aplicación, por ejemplo asociándola al puerto 3000 (por omisión) de la IP del servidor donde operas (en este ejemplo 192.168.1.3) con:
```
bin/rails s -b 192.168.1.3
```

Usa la aplicación con un navegador en la URL http://192.168.1.3:3000/sip/, puedes ingresar con el usuario ```sip``` y la clave ```sip```


