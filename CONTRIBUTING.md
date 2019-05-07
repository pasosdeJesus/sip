# Información dedicada a contribuidores #

## Terminos de uso

Al hacer una contribución está aceptando los términos que estamos usando para este motor, que encuentra en: 
https://www.pasosdejesus.org/dominio_publico_colombia.html

## Tareas de integración continúa

El archivo `README.md` incluye varias banderas que queremos dejar en buen estado:
  1. Que pase pruebas en plataforma de integración continúa. Agradecemos servicio a _Semaphore_ y _Travis_.
  2. Buen porcentaje de mantenibilidad y cobertura. Agradecemos servicio a _Codeclimate_.
  3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en _Hakiri_ (al cual agradecemos por el servicio de auditoría).


## Uso recomendado de git

Consideramos que su contribución a `sip` (y a otros proyectos de fuentes abiertas) será más ordenada si sigue los lineamientos de uso de FreeCodeCamp (ver https://github.com/freeCodeCamp/freeCodeCamp/blob/master/docs/how-to-setup-freecodecamp-locally.md), que procuramos resumir aquí:

1. Bifurque (del inglés fork) el repositorio (https://github.com/pasosdeJesus/sip) a su cuenta personal
2. En el computador de desarrollo clone su bifurcación:
  ```
  git clone git@github.com/miusuario/sip.git
  ```
3. En la copia en el computador de desarrollo asegure tener 2 repositorios remotos: (1) `origin` que apunte a su bifurcación y (2) por ejemplo `upstream` que apunte a las fuentes originales.  Vea los que tiene con `git remote -v` y agregue las fuentes de Pasos de Jesús de sip como `upstream` con  
  ```
  cd sip
  git remote add upstream https://github.com/pasosdeJesus/sip.git
  ```

Procure mantener la rama `master` de su bifurcación "sincronizada" con la rama `master` del repositorio upstream (por lo mismo no debe hacer cambios a la rama `master` de su bifuración).  Lo puede hacer ejecutando con regularidad:
  ```
  git checkout master
  git pull --rebase upstream master
  git push -f origin master
  ```

Cuando desee hacer una contribución, comience por sincronizar su rama master y desde esta crear una nueva rama donde propondrá el cambio y ponga un titulo que le ayude a limitar el alcance del cambio (si desea hacer cambios diferentes es mejor que haga ramas diferentes a partir de la rama master sincronizada), por ejemplo:
  ```
  git checkout -b mejora-documentacion
  ```
En la nueva rama agregue, modifique y elimine archivos. Una vez complete o avance escriba un comentario a la contribución, por ejemplo:
  ```
  git commit -m "Mejorando documentación para quienes contribuyen" -a
  ```
Puede continuar trabajando y hacer otras contribuciones en la misma rama, pero nos parece más ordenado cuando su solicitud de cambio (pull request) 
tiene una sola contribución (commit) y no muchas que sobreescriben otras.  Si tiene varias conribuciones para un mismo pull-request más bien 
fusionelas (del inglés squash) en una sólo.  
Por ejemplo puede fusionar los 2 últimos commits con:
  ```
  git rebase -i HEAD~2
  ```
Esto abrira un archivo con los mensajes de las 2 ultimas contribuciones y frente a cada uno la plabra `pick` que podria cambiar por `squash` en la segunda 
contribucion para fusionarla con la primera.  Despues de guardar y salir volvera a un editor para modificar el mensaje que tendra la contribucion fusionada

Tras esto si ve la historia de contribuciones notara la fusión:
  ```
  git log
  ```

Una vez tenga bien su contribucion en orden, empuje el cambio a la rama que creó en su bifuracion:
  ```
  git push -f origin mejora-documentacion
  ```
Y desde la interfaz de github examinando su repositorio bifurcado o el original de Pasos de Jesús vera un botón para crear la solicitud de cambio (pull-request).  Uselo, revise lo que enviará,  ponga un comentario que justifica el cambio y enviélo.

Cuando haga un pull request se iniciaran sobre el mismo las tareas de integración continua que hemos configurado en github y que en general su cambio debe pasar.
Después los desarrolladores de sip revisaran su cambio y si se requiere escribiran sugerencias de cambio, que debe hacer o justificar por que no conviene antes de que su contribución sea aceptada.  Es decir habrá un diálogo en la parte de comentarios de su solicitud de cambio que debe continuar.

Debe realizar los cambios en la misma rama donde hizo la propuesta inicial, pero antes debe sincronizarla con la rama `master` del repositorio de Pasos de Jesús por si otros desarrolladores han hecho cambios  recientes.  Para eso primero sincronice su rama master:
```
git checkout master
git pull --rebase upstream master
git push -f origin master
```
Y de inmediato tome en su rama donde hace la propuesta los cambios que pudiera haber en la rama `master` ya sincronizada:
```
git checkout mejora-documentacion
git pull origin master
```
Esta última operación podría revelar colisiones entre cambios ya acpetados en el repositorio principal y los que usted había propuesto (por eso es bueno tratar
de hacer rápido el diálogo con desarrolladores y las propuestas de cambio).  En caso de colisiones debe arreglarlas (en algunos casos editando archivos que tienen marcados los cambios con <<<< y >>>>, en otros añadiendo o eliminando archivos).
Después aplique las sugerencias y/o arregle su código de forma que pase tareas de integración continúa y preferiblemente vuelva a fusionar contribuciones
```
vi README.md
....
git commit -m "Aplicando sugerencias de revisor" -a
git rebase -i HEAD~2
git push -f origin mejora-documentacion
```
Después de empujar sus cambios (push) en la misma rama, github notará el cambio y actualizará la solicitud de cambio ya hecha, volviendo a lanzar las tareas de integración continua y los desarrolladores volverán a auditar su contribución y continuarán el diálogo en la sección de comentarios.

Este proceso debe iterarse hasta que su cambio sea aceptado (o rechazado), por lo que debe visitar con frecuencia su solicitud de cambio y ver nuevos comnetarios que puedan haber (los comentarios más recientes quedan al final de la pestaña de comentarios).
  

## Otros aspectos a tener en cuenta
 
* Durante el desarrollo de su contribución actualice constantemente las dependencias para usar siempre las versiones más recientes de librerías y motores.

* La plataforma principal de desarrollo y de producción es adJ (Distribución de OpenBSD) ver descripción en: 
	https://github.com/pasosdeJesus/sip/wiki/Requisitos
  Por eso después de hacer cambios sugerimos que en esa platafoma
  ejecute las pruebas de regresión para asegurar que pasan.

  Suele bastar desde el directorio raiz de las fuentes o desde `test/dummy` si es un motor:
  ```sh
  RAILS_ENV=test  bin/rails db:drop db:setup db:migrate sip:indices
  ```
  Y desde el directorio raiz de las fuentes:
  ```
	bin/rails test
  ```

