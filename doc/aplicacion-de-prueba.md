# Aplicación de prueba

Asegúrate de contar con los
[Requisitos](https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md)

Crea un usuario (digamos `sipdes` que es usado en los ejemplos y archivos
de configuración de manera predeterminada) para la base de datos 
(remplaza `nuevaclave``` por la clave que le pondrás):
```
$ doas su - _postgresql
$ createuser -Upostgres -h /var/www/var/run/postgresql/ -s sipdes
$ psql -Upostgres -h /var/www/var/run/postgresql/
psql (12.5)
Type "help" for help.
postgres=# ALTER USER sipdes WITH PASSWORD 'nuevaclave';
postgres=# \q
$ exit
```

Para facilitar interacción con las bases de datos del usuario ```sipdes``` 
(o el que prefieras) y que no solicite clave para operar, agrega el usuario 
y la clave que asignaste al archivo ```~/.pgpass```:
```
echo "*:*:*:sipdes:nuevaclave" >> ~/.pgpass
```
Copia la plantilla de configuración de la base de datos y modifícala con 
la nueva clave que asignaste (y el usuario si lo cambiaste y si lo deseas 
puedes cambiar nombres de base de datos, o ubicación del socket de PostgreSQL):
```
$ cd test/dummy
$ cp config/database.yml.plantilla config/database.yml
$ vi config/database.yml
```
En el editor remplaza la clave de ejemplo (```aquilaclave```) por la que 
hayas asignado al usuario ```sipdes```.

En el mismo archivo revisa el nombre de la base en modo de desarrollo
que por omisión es `sipdes_des` y cambialo si prefieres.

A continuación  crea la base de datos para el modo de desarrollo (sugerimos 
que lo hagas con las herramientas de PostgreSQL pues en ocasiones esta 
operación no logra ser completada por `rails`):
```sh
createdb -h /var/www/var/run/postgresql -U sipdes sipdes_des
```
Y desde el mismo directorio `test/dummy` prepárala para operar:
```sh
bin/rails db:drop db:create db:prepare
bin/rails sip:indices
```

Para iniciar la aplicación te sugerimos usar el script `bin/corre` que
requiere especificar la configuración en .env:

```
cp .env.plantilla .env
vi .env
```

Edita las variables de ese archivo, en particular `PUERTODES` con el puerto 
en el que vas a correr la aplicación de prueba (que debes abrir en el 
cortafuegos si lo hay) y en `IPDES` la IP del servidor donde operas:
```
bin/corre
```

Usa la aplicación con un navegador en una URL que tenga
la IP y el puerto que configuraste (e.g. <http://192.168.1.3:2300/sip/>), 
puedes ingresar con el usuario `sip` y la clave `sip`

Si prefiere o necesita SSL, empleando un certificado del cual deja las 
llaves pública y privada en `tmp/llave-publica.crt` y 
`tmp/llave-privada.key`, configura `PUERTODES` en `.env` con algo como:
```
PUERTODES=2300?key=tmp/llave-privada.key&cert=tmp/llave-publica.crt
```
