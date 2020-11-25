# Pruebas del sistema con sideex2

Como parte del proceso de desarrollo ágil de una aplicación web
es importante entre otras:  (1) mantener requerimientos en forma
de historias de usuario y tareas, así como su seguimiento,
(2) que un equipo de desarrollo implemente los requerimientos 
y resuelva fallas, (3) que un equipo de pruebas busque fallas, las
encuentre y reporte al equipo de desarrollo.

Las pruebas del sistema  "se realizan a un sistema completo e integrado, 
para evaluar que cumpla con los requerimientos especificados.   
Las pruebas del sistema caen dentro de la categoría de pruebas de caja
negra y por tanto no deben requerir conocer el diseño del código fuente
o su lógica." (<https://en.wikipedia.org/wiki/System_testing>)

A continuación describimos como realizamos pruebas del sistema en
Pasos de Jesús usando sideex2 (http://sideex.org/), suponiendo que las fuentes de la 
aplicación (y de las pruebas) se almacenan en un repositorio de github (https://github.com)
y que el seguimiento al desarrollo se realiza en un tablero Trello (https://trello.com).

Aunque existe Sideex 3, preferimos usar Sideex 2 porque es de fuentes abiertas, ver [Comparación](https://github.com/pasosdeJesus/sip/blob/master/doc/compara-sideex-2-3.md).


## 1. Tablero Trello

El tablero Trello suele tener 5 columnas:

- Historias de Usuarios. Así como detalles del proceso de desarrollo o contractuales

- Posibilidades. Donde se hace división de las 
  historias de usuario en tareas estimables y se estima esfuerzo en horas.

- Haciendo. A donde se mueven tarjetas desde "Posibilidades" de acuerdo
  a prioridades acordadas con el cliente o requeridas por el diseño

- Hecho. Donde quedan tareas completas y fallas resueltas

- Comprometidas. Donde quedan actividades de mantenimiento, soporte y logístico/administrativas

Solemos estimar que las pruebas del sistema requieren 1/4 del tiempo
de desarrollo.

## 2. Dinámica desarrollo

De acuerdo a las prioridades acordadas con clientes (tipicamente en una reunión
al inicio de cada carrera) y del diseño de la carrera, el equipo 
de desarrollo debe buscar corregir primero fallas en el código fuente, 
refactorizar, implementar novedades,  realizar otros tipos de pruebas 
(unidad, regresión), poner en el repositorio github los cambios, desplegar 
cambios en sitio de desarrollo (y/o de ensayo) y anunciar al equipo de pruebas 
un resumen de las fallas resueltas y de las novedades implementadas (eventualmente
con indicaciones sobre que aspectos concentrar las pruebas), esto suele hacerse
con periodicidad semanal (o según el tipo de contrato).

Cada vez que el equipo de desarrollo anuncia cambios, el equipo de pruebas:

- Ejecuta las pruebas de regresión para verificar que siga funcionando lo que ya operaba 
  y registra en una hoja de cálculo los resultados (particularmente las que fallan), dejando 
  como comentario en la celda de la que falla el error producido. 
- De las pruebas que fallan identifica si se trata de (1) un problema en la prueba, o (2) 
  que un cambio en la aplicación exije un cambio en la prueba o (3) una falla en la aplicación 
  en cuyo caso debe reportarse al equipo de desarrollo.
- Prueba las novedades buscando hacer fallar la aplicación.  Esto implica entender bien los 
  cambios implementados (o pedir retroalimentacion al equipo de desarrollo hasta entender y 
  poder realizar las pruebas).
- Reporta en Trello las fallas que encuentre (a más tardar  5 días después del anuncio
  del equipo de desarrollo, si los anuncios de desarrollo son semanales
  o si el tipo de contrato lo requiere hasta un día después).  
- Cuando el equipo de desarrollo mueve una tarjetas de la columna haciendo a la columna 
  hecho pueden quedar algunas tarjetas de fallas sin tiempo, que seguramente al abrirse
  tendrán un comentario que el equipo de pruebas debe leer y revisar para 
  mejorar el reporte de prueba o verificar si la falla persiste.
- Amplia y actualiza pruebas del sistema en directorio ```test/sideex``` --el equipo de pruebas 
  tiene a su cargo mantener al día este directorio con pruebas para sideex2 que puedan 
  reproducirse y funcionar (con excepciones que se mantienen en Trello)

## 3. Pruebas del sistema

### 3.1 Verificar que lo que funcionaba siga funcionando

1. Clonar o actualizar el repositorio que se va a probar.  
   Esto en particular actualizará el directorio `test/sideex` donde deben 
   estar casos de pruebas para las diversas funcionalidades del sistema
   con títulos que sugieran lo que se prueba en una suit de pruebas. 
   Se recomienda que el título se componga de: (1) sistema, (2) consecutivo de dos dígitos
   (3) rol del usuario con el que se ejecuta la prueba, 
   (4) tema de prueba.  Por ejemplo `lac-01-admin-tablas-basicas.sideex`, 
   `lac-02-⁠admin-usuarios`, `lac-03-⁠analista-casos.sideex`.
2.  Empleando Chrome con sideex2 instalado, ingresar a la aplicación en
    el sitio de desarrollo (o de ensayo) con un usuario y contraseña acorde 
    al rol que se prueba,  iniciar sideex2, cargar la suit de pruebas y ejecutarla completa.
3. Por cada falla que se encuentre:

    3.1 Reproducirla manualmente y asegurar que es una falla del sistema 
        (y no de las pruebas o de sideex2)

    3.2 Si era una falla ya resuelta buscar la tarjeta donde se había reportado
        y pasarla de la columna "Hecho" del tablero Trello a "Haciendo"

    3.3 Si es una falla nueva, crear una nueva tarjeta Trello en la columna
        "Haciendo".  Iniciar el título con un código ```F-n``` donde n es un número
        consecutivo respecto a las demás tarjetas.  Adjuntar a esta tarjeta
        la prueba de Sideex2 que falló, un pantallazo y si es el caso
        detalles adicionales de como reproducir en comentarios.
        
    3.4. Si se detienen las pruebas pero no por fallas en la aplicación sino en la 
       prueba para sideex2 o por cambios en funcionalidad de la aplicación
       pero sin errores, se mejora la prueba de sideex2 para que pase 
       y se guarda y actualizan pruebas en github.
       
    3.5. Agregar una tarjet P-233 (siguiendo consecutivo de otras tarjetas recientes) con
       un título de la forma  "Ejecutada suit de pruebas. 2 errores"
       
    3.6 Si hay dificultades que no logran superarse para describir un caso de prueba
        con sideex2 guardar el caso de prueba en un solo archivo en la carpeta
        test/sideex/con_error
  

### 3.2 Probar Novedades

Por cada novedad o falla resuelta que reporte el equipo de desarrollo:

1. Abrir sideex2 y la suit de pruebas e iniciar un nuevo caso de prueba, 
   guardar lo que se prueba.  Poner nombre o renombrar para que el nombre 
   corresponda a la funcionalidad que se prueba.   
2. Agregar en Trello una tarjeta de la forma P-234 con la descripción de las
   novedades o fallas que se probaron (e.g Probadas F-12, R-16).
3. Si una falla supuestamente resuelta sigue fallando, examinar posibles
   comentarios del equipo de desarrollo en la tarjeta y si es el caso devolver 
   la tarjeta de la columna Hecho a Haciendo, agregar comentario, pantallazo y archivo
   para sideex2 para reproducirlo (los casos de pruebas que fallan por 
   dificultades con sideex 2 almacenar en `test/sideex/con_error`).
4. Si la prueba pasa agregar la prueba a la suit de pruebas con un nombre
   acorde a la prueba, agrega el archivo al repositorio y actualizar en github.
5. Al correr todas las pruebas y después guardar el reporte de errores es muy bueno 
   porque en el reporte guardado se buscan los errores --pues la bitácora de errores 
   de sideex se reinicia cada vez que corre un nuevo caso de prueba después de haber 
   corrido todas las suites).



### 3.3  Crear caso de prueba con Sideex2

#### 3.3.1 Descarga e instalación de sideex2

* Sideex2 se ejecuta como una extensión para Chrome o para Firefox. 
  Está disponible para descargar de uso gratuito en el repositorio https://github.com/vtamara/sideex
  en la rama espera-asercion
  
  ![sosX5dn - Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/sosX5dn%20-%20Imgur.png)
  
* Haga clic en Code y descargue el archivo en Download ZIP.

  ![kF0Hu9w%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/kF0Hu9w%20-%20Imgur.png)
  
* Abrir con Gestor de archivadores y Extraer.
  
  ![qGu3pjp%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/qGu3pjp%20-%20Imgur.png)
  
* Ahora el página de Google vaya a Personaliza y controla Google Chrome en la parte superior derecha de la página.
  Escoja Más herramientas y luego Extensiones.
   
* Activa el modo de desarrollador en Extensiones.
  Haga Clic en Cargar extensión sin empaquetar y busca el sideex-2.3.4 que acabas de descargar
  
* Haga doble clic sobre el archivo y vera src y abrir.

* Haga clic en el icono Extensiones  en la parte superior derecha de la página

  ![uooGhNd%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/uooGhNd%20-%20Imgur.png)
  
* Haga clic en el icono Fijar extensión al lado derecho del icono de sideex2

  ![lUqpscY%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/lUqpscY%20-%20Imgur.png)
    
* Después de descargar Sideex2 se vera en la barra de 
  herramientas el icono de Sideex2.
  
  ![img1](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img1.png)  
  
* Al pulsar sobre el icono de sideex2 se vera el panel

  ![img2](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img2.png) 
  
* Sideex2 admite la ejecución de dos o más pruebas de Sideex2 en diferentes 
  ventanas del explorador al mismo tiempo en un escritorio para procesar suits de 
  prueba de manera más eficiente. Por ejemplo, inicie tres ventanas de navegador 
  (NO pestañas) y abra Sideex2 en la barra de herramientas de cada ventana del 
  navegador, luego cargue y reproduzca las suits de prueba por cada Sideex2
  con su ventana de navegador correspondiente.
* Cuando haga pruebas solo abra la pestaña en la que esta realizando la prueba porque 
  si abre otra pestaña al mismo tiempo la prueba correrá en esa otra pestaña también.
* Sideex2 admite la apertura, edición y ejecución de múltiples 
  suits de prueba en un solo panel. Las suits de prueba se pueden activar y 
  procesar automáticamente de forma secuencial. 
  
* Sideex2 espera automáticamente para completar la carga de la página.
* Las nuevas versiones de Sideex2 no se actualizarán 
  automáticamente. 
  Debe volver al sitio oficial y buscar nuevas versiones.  
* Sideex2 no soporta sistema operativo de 32 bits, solo soporta el sistema operativo de 64 bits.  
  
#### 3.3.2 Estructura y contenido de la ventana de Sideex2 
  
* En la parte superior vemos varios _botones principales_:

  ![8opciones](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img8.png)

    * `Record`: Grabar. Pulse Record para empezar a grabar la secuencia de 
    comandos de una prueba 
  
    * `PlayThisCase`: Correr este caso. Se puede correr un solo caso de 
    una suit. Pulse sobre el caso que quiere correr, se hará visible 
    y luego Pulse en PlayThisCase
  
    * `PlayThisSuite`: Correr esta suit. Pulse sobre PlayThisSuite 
    para correr toda la suit con que esta trabajando.
  
    * `PlayAllSuites`: Correr todas las suits. Pulse sobre PlayAllSuites y 
    podrá correr todas las suit que halla abierto en el panel.
  
    * `Pause`: Pausa. Sirve para detener una prueba en determinado momento, 
    luego pulse de nuevo y se puede continuar. 
    
* Debajo de `Record` hay una _barra de velocidad_ que podemos usar para
    cambiar la velocidad de ejecución de las pruebas a nuestra elección.
    
     ![img55](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img55.velocidad.png)
    
    * `Fast`: Rápido
    
    * `Slow`: Despacio
    
* En el panel titulado  `TEST SUITES` _suits de pruebas_ se verán las suits que haya cargado 
  o creado y dentro de cada suit los casos de prueba que la conforman:

    ![img33](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img33.suit.png)
    
    * A la derecha del título `TEST SUITES` verá un icono de archivo que permite cargar
      pruebas almacenadas previamente.
     ![archivo](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/archivo.png)
    
    * Más a la derecha verá un signo mas (+) para crear una nueva suit de pruebas, al pulsarlo
      se abrirá una ventana emergente donde se puede escribir el nombre de la suit nueva.
     ![img4](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img4.png) 
    
    * Al crear o cargar una suit de prueba, cuando pase el curso sobre esta, 
      verá a la izquerda del título un icono para guardar la suit y a la la derecha un singo más (+)
      que permite agregar un nuevo caso de prueba a esa suit.
      ![img5](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img5.png)
      
        * Al pulsar con el botón derecho sobre el nombre de una suit de pruebas, verá
          un menú contextual con las opciones: Abrir suit de pruebas, Agregar nueva suit de pruebas, 
          Guardar suit de pruebas como, Cerrar suit de pruebas, Agregar nuevo caso de prueba y 
          renombrar suit de pruebas
          ![img6](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img6.png) 
          
       * Al pulsar con el botón derecho sobre un caso de prueba, verá un menú contextual
         con opciones Agregar Nuevo Caso de Prueba, Eliminar Caso de Prueba y Renombrar Caso de Prueba.
         
  * Al lado derecho hay una _tabla de ordenes_ donde se presentarán las ordenes que componene el caso
    de prueba que se haya elegido en el panel con la suit de pruebas. 
    Cada fila de esta fila tendrá una orden completa, las columnas son:
  
    * `Command`: Orden selenese. En esta fila vera las ordenes del caso de prueba.
      ![8opciones](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img8.png)
  
    * `Target`: Objetivo. En esta columna verá selectores sobre los que se aplica cada orden.  
  
    * `Value`: Valor. En esta columna se ven valores para algunas ordenes que lo requieren.
    
    * Debajo pero pegado a la tabla de ordenes, hay un panel para ver y editar en detalle una orden completa, 
      i.e la orden selenese, el selector y el valor.
    
        * En el campo `Command` podrá digitar la orden selenese 
    
        * En el campo `Target`  se ve una flecha, si hace clic sobre la flecha se presentará  
          una lista de selectores  que se pueden utilizar de ser necesario.
         ![10flecha2](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img10.png)
            * En la misma fila de target hay un boton `Select` (seleccionar) que puede utilizar para 
              elegir visualmente un selector en la ventana del navegador donde corre la prueba.
            * En la misma fila hay un botón `Find` (encontrar) que resaltará en la ventana del 
              navegador donde corre la prueba el elemento al que corresponde el selector
        * En el campo `Value` podrá digitar el valor que pudiera requerir la orden.

* Debajo del panel de suits de pruebas, hay un panel con _Resultados agregados de la última ejecución_:
    * `Run`  conteo de los casos que se corren correctamente. 
    * `Failures` conteo del numero de casos que fallan.

* En la parte inferior hay otro panel _bitácora y referencia_ con: 

    *  `Log`:  Que es una bitácora de la ejecución de la prueba. La ejecución de cada orden dejará allí un rastro y si ocurre un error quedará en rojo.
    
    * `Reference`: Presenta el manual correspondiente a la orden selenese elegida en la tabla de ordenes.
    
    * `Save`: Para guardar la bitácora
    
    * `Clear`: Para limpiara la bitácora.
    
#### 3.3.3 ¿Qué es un caso de prueba?

Una secuencia de acciones repetibles en la página que se prueba, que se esperan den un resultado.
El caso de prueba falla si tras realizar la secuencia de acciones no se obtiene el resultado esperado.

Un caso de pruebas en sideex2 consta de una serie de ordenes,  
cada orden puede tener cero, uno o dos argumentos.  El primer 
argumento cuando existe típicamente es un selector del elemento al que se aplica 
la orden y el segundo cuando existe es un valor.  Por ejemplo la orden ```clickAt``` 
utiliza un selector para identificar el elemento sobre el cual realizar una 
pulsación del ratón pero no requiere valor.  La orden ```type``` requiere los 
dos argumentos, el selector que indica el elemento donde se escribirá y el 
valor que escribirá.

Al guardar un caso de prueba, se almacenan las ordenes en un formato de tabla 
HTML, donde cada fila es una orden y con 3 columnas: la primera para el nombre
del comando, la segunda para el selector y la tercera para el valor.


#### 3.3.4 Hacer un primer caso de prueba con Sideex2

* Inicie Chrome
    
* Abra la página que va a probar

* Pulse sobre el icono de sideex2 en la barra de herramientas del navegador  
  ![img3](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img3.png) 
     
* Pulse en el signo mas (+) del cuadro de TEST SUITES a la izquierda del panel y digite 
  el nombre da la suit que creará y pulse Aceptar.
  [img4](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img4.png) 
    
* Pulse en  el lado derecho del nombre de la suit creada sobre el signo mas (+) y de el 
  nombre del primer caso de prueba de la suit.
  ![img5](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/img5.png) 
   
* Pulse en el botón `Record` para iniciar las operaciones de grabación
    
* Opere en la página ralizando las operaciones de su caso de prueba
    
* Cuando termine de operar, vuelva a la ventan de sideex y pulse el botón `Stop`
    
* Revise una a una las ordenes grabadas, elimine las redundantes, mejore selectores
  y valores. Asegurese de entender lo que cada una hace para que sean fiel reflejo del caso
  de prueba que está creando.

Las ayudas que se presentan a continuación son mínimas, se recomienda consultar
la ayuda de sideex (botón Help o disponible en  <http://www.sideex.org/>), 
así como la especificación de cada orden disponible en la pestaña Reference de la interfaz de
Sideex cuando se da el foco a la orden en un caso de prueba.


#### 3.3.5 Pautas para crear casos de prueba

* En general suponer que ya se ha iniciado sesión en la aplicación con la cuenta
  administrativa de prueba y que está en la pantalla inicial de la aplicación. 

* De requerirse crear nuevos elementos pero con nombres que no puedan interferir
  con una aplicación de producción (en caso de ejecutarse sobre una).   Por 
  ejemplo nombres AAAA.

* En general cada caso de prueba debe eliminar los elementos que cree (excepción 
  si la suit de pruebas completa elimina con casos de prueba finales lo que 
  crearon los iniciales --digamos un usuario)
  
* Para sobrellevar problemas de velocidad de Internet o de la aplicación y para 
  verificar que la aplicación está en el estado que se espera al comienzo, durante y 
  al final de una prueba debe emplearse assert (el más típico es ```assertText```). 

* ```ChooseOkOnNextConfirmation``` es un comando que se utiliza antes de 
  eliminar y evita tener que ayudarle manualmente en confirmar si 
  quiere eliminar 
  
* Evitar selectores que tengan códigos (pues cambian de una ejecución a otra) por ejemplo
  `//select[@id='caso_ubicacion_attributes_9_id_pais']` tipicamente puede elegirse otro
  con la flecha del campo `Target`, digamos  `//div[@id='ubicacion']/div/div/div/select`
  o de requerirse puede examinarse el HTML y/o el CSS para emplear un mejor selector que
  los propuestos por Sideex.

#### 3.3.6 Como correr una suit ya creada

* Para correr una suit ya creada, debemos tenerla guardada en el computador.
* Pulse en el icono de archivo y busquelo en los archivos en el computador.

   ![px1yokA%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/px1yokA%20-%20Imgur.png)

* Escoja un archivo y lo abre. 

  ![H1VJZ0D%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/H1VJZ0D%20-%20Imgur.png)
   
* Puede correr toda la suit pulsando sobre PlayThisSuite.

   ![s8MipPe%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/s8MipPe%20-%20Imgur.png)
   
* Tambien puede correr un solo caso de la suite pulsando sobre el caso que va a correr y luego sobre PlayThisCase.

   ![bjAgimK%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/bjAgimK%20-%20Imgur.png)
   
#### 3.3.7 Pruebas con error y sin error

* Cuando se corre una prueba y no tiene errores se ve el panel en verde, al lado del nombre de la prueba un visto bueno
  y aumenta el numero en RUNS 

![vliRAtI%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/vliRAtI%20-%20Imgur.png)

* Y cuando tiene error, se ve roja la linea que tiene el error, al lado del nombre de la prueba una X en rojo
  y se aumenta el numero en FAILURES  

![]()

* En la parte inferior se van viendo todos y cada uno de los comando que se estan ejecutando y cuando se genera 
  error tambien se ve la linea del error en rojo.
  
  ![i0s8RRi%20-%20Imgur.png](https://github.com/pasosdeJesus/sip/blob/master/doc/sideex.img/i0s8RRi%20-%20Imgur.png)
  
#### 3.3.8 Teclas de acceso rápido
  
  . *Ctrl + S*:          Guardar una suite de prueba
  
  . *Ctrl + O*:          Abrir un archivo de suite de prueba
  
  . *Ctrl + P*:          Correr este caso de prueba
  
  . *Ctrl + I*:          Insertar un nuevo comando
  
  . *Ctrl + A*:          Seleccionar todos los comandos
  
  . *Ctrl + X*:          Cortar comandos
  
  . *Ctrl + C*:          Copiar comandos
  
  . *Ctrl + V*:          Pegar comandos
  
  . *Del*:               Eliminar los comandos seleccionados
  
  . *Ctrl + B*:          Alternar un punto de interrupción


#### 3.3.7 Sobrellevar fallas de Sideex 2

* Sideex 2 no logra elegir opciones en cuadros de selección que emplean el plugin chosen.  chosen es un plugin para jquery que mejora la apariencia y usabilidad de los cuadros de selección.  Para que sideex pueda elegir opciones de este tipo de cuadroes es encesario primero quitar el plugin chosen de los cuadros de selección donde esté.  Se hace con la orden runScript y 
como target usar:
```
$('.chosen-select').removeAttr('style'); $('.chosen-container').remove(); $('.chosen-select').removeClass('chosen-select')
```
* Sideex 2 no logra escribir en campos abiertos de tipo numérico o de tipo email.  En pruebas Sideex esto se evidencia cuando al digitar (type) en un campo abierto sale el error `Cannot set selection end` y puede confirmarse examinando el HTML y revisando si el elemento `input` tiene un atributo `type=number` o `type=email`. Para lograr que Sideex-2 escriba en estos campos, primero debe eliminarse el tipo con runScript y un target como:
```
$('[type=number]').removeAttr('type')
```
o como
```
$('[type=email]').removeAttr('type')
```
Hemos notado que esta orden puede entrar en conflicto con la que quita el estilo de chosen a campos de selección para evitarlo, hemos notado que es mejor correr primero la que quitar el atributo type, digamos recién se despliega el formulario.

