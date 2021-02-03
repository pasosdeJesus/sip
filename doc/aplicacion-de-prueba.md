# Aplicación de prueba

Asegúrate de contar con los
[Requisitos](https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md)

Crea un usuario (digamos `sipdes` que es usado en los ejemplos y archivos
de configuración de manera predeterminada) para la base de datos 
(remplaza `nuevaclave` por la clave que le pondrás):
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

Para facilitar interacción con las bases de datos del usuario `sipdes` 
(o el que prefieras) y que no solicite clave para operar, agrega el usuario 
y la clave que asignaste al archivo `~/.pgpass`:
```
echo "*:*:*:sipdes:nuevaclave" >> ~/.pgpass
```
Copia la plantilla de configuración y modifícala con la nueva clave 
que asignaste (y el usuario si lo cambiaste y si lo deseas 
puedes cambiar nombres de base de datos):
```
$ cd test/dummy
$ cp .env.plantilla .env
$ vi .env
```
En el editor remplaza la clave de ejemplo (que está en una línea de la
forma `BD_CLAVE=aquilaclave`) por la que hayas asignado al usuario 
`sipdes` (o al usuario que prefieras que está en una línea de la
forma `BD_USUARIO=sipdes`).

En el mismo archivo revisa el nombre de la base en modo de desarrollo
en una línea de la forma `BD_DES=sipdes` y cámbialo si prefieres.

A continuación  crea la base de datos para el modo de desarrollo (sugerimos 
que lo hagas con las herramientas de PostgreSQL pues en ocasiones esta 
operación no se logra completar solo con `rails`):
```sh
createdb -h /var/www/var/run/postgresql -U sipdes sipdes_des
```
Y desde el mismo directorio `test/dummy` prepárala para operar:
```sh
bin/rails db:drop db:create db:setup db:prepare
bin/rails sip:indices
```

Para iniciar la aplicación te sugerimos usar el script `bin/corre` que
emplea el archivo `.env`, que debes editar para poner el puerto
en el que quieres correr la aplicación de prueba, lo encuentras en una 
línea de la forma `PUERTODES=3000` (si tienes un cortafuegos recuerda
abrir ese puerto) y en una línea de la forma `IPDES=192.168.10.1` pon
la IP del servidor donde operas.  Después ejecuta:
```
bin/corre
```

Usa la aplicación con un navegador en una URL que tenga
la IP y el puerto que configuraste (e.g. <http://192.168.10.1:3000/sip/>), 
puedes ingresar con el usuario `sip` y la clave `sip`

Si prefieres o necesitas SSL, empleando un certificado del cual dejas las 
llaves pública y privada en `tmp/llave-publica.crt` y 
`tmp/llave-privada.key`, configura `IPDES` y `PUERTODES` en `.env` con algo 
como:
```
PUERTODES=
```
y
```
IPDES="ssl://192.168.10.1:3000?key=tmp/llave-privada.key&cert=tmp/llave-publica.crt"
```
