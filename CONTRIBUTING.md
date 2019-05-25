# Información dedicada a contribuidores #

## Términos de uso

Al hacer una contribución estás aceptando los términos que estamos usando para este motor, que encuentras en:
https://www.pasosdejesus.org/dominio_publico_colombia.html

## Tareas de integración continua

El archivo `README.md` incluye varias banderas que queremos dejar en buen estado:
  1. Que pase pruebas en plataforma de integración continua. Agradecemos servicio a _Semaphore_ y _Travis_.
  2. Buen porcentaje de mantenibilidad y cobertura. Agradecemos servicio a _Codeclimate_.
  3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en _Hakiri_ (al cual agradecemos por el servicio de auditoría).


## Uso recomendado de git

Consideramos que tu contribución a `sip` (y a otros proyectos de fuentes abiertas) será más ordenada si sigues los lineamientos de uso de FreeCodeCamp (ver https://github.com/freeCodeCamp/freeCodeCamp/blob/master/docs/how-to-setup-freecodecamp-locally.md), que procuramos resumir aquí:

1. Bifurque (del inglés fork) el repositorio (https://github.com/pasosdeJesus/sip) a su cuenta personal.
2. En el computador de desarrollo clone su bifurcación:
  ```
  git clone git@github.com/miusuario/sip.git
  ```
3. En la copia en el computador de desarrollo asegure tener 2 repositorios remotos: (1) `origin` que apunte a su bifurcación y (2) por ejemplo `upstream` que apunte a las fuentes originales.  Puedes ver tus repositorios actuales con `git remote -v` y agrega las fuentes de Pasos de Jesús de sip como `upstream` con:  
  ```
  cd sip
  git remote add upstream https://github.com/pasosdeJesus/sip.git
  ```

Procura mantener la rama `master` de tu bifurcación "sincronizada" con la rama `master` del repositorio upstream (por lo mismo no debes hacer cambios a la rama `master` de tu bifuración).  Lo puedes hacer ejecutando con regularidad:
  ```
  git checkout master
  git pull --rebase upstream master
  git push -f origin master
  ```

Cuando desees hacer una contribución, comienza por sincronizar tu rama `master` y desde esta crear una nueva rama donde propondrás el cambio y pon un título que le ayude a limitar el alcance del cambio (si deseas hacer cambios diferentes es mejor que hagas ramas diferentes a partir de la rama `master` sincronizada), por ejemplo:
  ```
  git checkout -b mejora-documentacion
  ```
En la nueva rama agrega, edita y/o elimina archivos. Para saber si se ha modificado algún archivo puedes averiguarlo con:
  ```
  git status
  ```
agrega tus cambios a git con:
  ```
  git add .
  ```
Ahora, realiza un commit para escribir un comentario a la contribución, por ejemplo:
  ```
  git commit -m "Mejorando documentación para quienes contribuyen" -a
  ```
Puedes continuar trabajando y hacer otras contribuciones en la misma rama, pero nos parece más ordenado cuando tu solicitud de cambio (pull request) tiene una sola contribución (commit) y no muchas que sobreescriben otras.  Si tienes varias contribuciones para un mismo pull-request más bien fusiónalas (del inglés squash) en una sola.  
Por ejemplo puedes fusionar los 2 últimos commits con:
  ```
  git rebase -i HEAD~2
  ```
Esto abrirá un archivo con los mensajes de las 2 últimas contribuciones y frente a cada uno la plabra `pick` que podrías cambiar por `squash` en la segunda contribución para fusionarla con la primera.  Después de guardar y salir volverás a un editor para modificar el mensaje que tendrá la contribución fusionada

Tras esto si ve la historia de contribuciones notará la fusión:
  ```
  git log
  ```
Una vez tenga bien su contribución en orden, empuje el cambio a la rama que creó en su bifurcación:
  ```
  git push -f origin mejora-documentacion
  ```
Y desde la interfaz de github examinando su repositorio bifurcado o el original de Pasos de Jesús verás un botón para crear la solicitud de cambio (pull-request).  Úsalo, revisa lo que enviarás, pon un comentario que justifique el cambio y envíalo.

Cuando hagas un pull request se iniciarán sobre el mismo las tareas de integración continua que hemos configurado en github y que en general su cambio debe pasar. Después los desarrolladores de sip revisarán tu cambio y si se requiere escribirán sugerencias de cambio, que debes hacer o justificar por que no conviene antes de que tu contribución sea aceptada. Es decir habrá un diálogo en la parte de comentarios de tu solicitud de cambio que debe continuar.

Debes realizar los cambios en la misma rama donde hizo la propuesta inicial, pero antes debes sincronizarla con la rama `master` del repositorio de Pasos de Jesús por si otros desarrolladores han hecho cambios recientes. Para eso primero sincroniza tu rama master:
```
git checkout master
git pull --rebase upstream master
git push -f origin master
```
Y de inmediato toma en tu rama donde hace la propuesta los cambios que pudiera haber en la rama `master` ya sincronizada:
```
git checkout mejora-documentacion
git pull --rebase origin master
```
Esta última operación podría revelar colisiones entre cambios ya aceptados en el repositorio principal y los que tú habías propuesto (por eso es bueno tratar de hacer rápido el diálogo con desarrolladores y las propuestas de cambio).  En caso de colisiones debes arreglarlas (en algunos casos editando archivos que tienen marcados los cambios con `<<<<` y `>>>>`, en otros añadiendo o eliminando archivos).
Después aplica las sugerencias y/o arregla tu código de forma que pase tareas de integración continua y preferiblemente vuelve a fusionar contribuciones.
```
vi README.md
....
git commit -m "Aplicando sugerencias de revisor" -a
git rebase -i HEAD~2
git push -f origin mejora-documentacion
```
Después de empujar tus cambios (push) en la misma rama, github notará el cambio y actualizará la solicitud de cambio ya hecha, volviendo a lanzar las tareas de integración continua y los desarrolladores volverán a auditar su contribución y continuarán el diálogo en la sección de comentarios.

Este proceso debe iterarse hasta que tu cambio sea aceptado (o rechazado), por lo que debes visitar con frecuencia su solicitud de cambio y ver nuevos comentarios que puedan haber (los comentarios más recientes quedan al final de la pestaña de comentarios).


## Otros aspectos a tener en cuenta

* Durante el desarrollo de tu contribución actualice constantemente las dependencias para usar siempre las versiones más recientes de librerías y motores.

* La plataforma principal de desarrollo y de producción es adJ (Distribución de OpenBSD) ver descripción en:
	https://github.com/pasosdeJesus/sip/blob/master/doc/requisitos.md
  Por eso después de hacer cambios sugerimos que en esa platafoma ejecutes las pruebas de regresión para asegurar que pasan. Suele bastar desde el directorio raíz de las fuentes o desde `test/dummy` si es un motor:
  ```sh
  RAILS_ENV=test  bin/rails db:drop db:setup db:migrate sip:indices
  ```
  Y desde el directorio raíz de las fuentes:
  ```
	bin/rails test
  ```
