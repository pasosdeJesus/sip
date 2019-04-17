# Pruebas del sistema con sideex

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
Pasos de Jesús usando sideex (http://sideex.org/), suponiendo que las fuentes de la 
aplicación (y de las pruebas) se almacenan en un repositorio de github (https://github.com)
y que el seguimiento al desarrollo se realiza en un tablero Trello (https://trello.com).

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

## 2. Dinámica desarrollo - pruebas del sistema

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

- Ejecuta las pruebas de regresión para verificar que siga funcionando lo que ya operaba, trascribir resultados a una hoja de cálculo donde se reportan las pruebas que fallan y como comentario el mensaje de error producido por sideex. 
- De las pruebas que fallan identifica si se trata de un problema en la prueba, un cambio en la aplicación que requiere un cambio en la prueba o una falla o cambio en la aplicación que debe reportarse al equipo de desarrollo.
- Prueba las novedades buscando hacer fallar la aplicación.  Esto implica entender bien los cambios implementados (o pedir retroalimentacion al equipo de desarrollo hasta entender y poder realizar las pruebas).
- Reporta en Trello las fallas que encuentre (a más tardar  5 días después del anuncio
  del equipo de desarrollo, si los anuncios de desarrollo son semanales
  o si el tipo de contrato lo requiere hasta un día después).
- Amplia y actualiza pruebas del sistema en directorio ```test/sideex``` --el
  equipo de pruebas tiene a su cargo mantener al día este directorio
  con pruebas para sideex que puedan reproducirse y funcionar
  (con excepciones que se mantienen en Trello)

## 3. Pruebas del sistema

### 3.1 Verificar que lo que funcionaba siga funcionando

a. Clonar o actualizar el repositorio que se va a probar.  
   Esto en particular actualizará el directorio `test/sideex` donde deben 
   estar casos de pruebas para las diversas funcionalidades del sistema
   con títulos que sugieran lo que se prueba en una suit de pruebas 
  ** (`pruebas-suit-1.sideex`) que agrupa todos los  casos de prueba.  **
   **Cuando tenga unas 50 pruebas, iniciar `pruebas-suit-2.sideex` y así**
   **sucesivamente.**
    **LAC-⁠administrador-⁠2-⁠tablas-básicas**

   Las pruebas como un usuarios de roles diferentes al administrador
   se nombran con el rol que prueba por ejemplo `pruebas-suit-analista-1.sideex`.

b.  Empleando Chrome con sideex instalado, ingresar a la aplicación en
    el sitio de desarrollo (o de ensayo) con un usuario y contraseña acorde 
    al rol que se prueba,  iniciar sideex, cargar la suit de pruebas y ejecutarla completa.


c. Por cada falla que se encuentre:

c.1 Reproducirla manualmente y asegurar que es una falla del sistema 
    (y no de las pruebas o de sideex)

c.2 Si era una falla ya resuelta buscar la tarjeta donde se había reportado
    y pasarla de la columna "Hecho" del tablero Trello a "Haciendo"

c.3 Si es una falla nueva, crear una nueva tarjeta Trello en la columna
    "Haciendo".  Iniciar el título con un código ```F-n``` donde n es un número
    consecutivo respecto a las demás tarjetas.  Adjuntar a esta tarjeta
    la prueba de Sideex que falló, un pantallazo y si es el caso
    detalles adicionales de como reproducir en comentarios.

c.4. Si se detienen las pruebas pero no por fallas en la aplicación sino en la 
   prueba para sideex o por cambios en funcionalidad de la aplicación
   pero sin errores, se mejora la prueba de sideex para que pase 
   y se guarda y actualizan pruebas en github.

c.5. En la tarjeta P-1 del tablero Trello agregar un comentario  del estilo
   "Ejecutada suit de pruebas. 2 errores"
   
c.6 Si hay dificultades que no logran superarse para describir un caso de prueba
    con sideex guardar el caso de prueba en un solo archivo en la carpeta
    test/sideex/con_error
  

### 3.2 Probar Novedades

Por cada novedad o falla resuelta que reporte el equipo de desarrollo:

1. Abrir sideex y la suit de pruebas e iniciar un nuevo caso de prueba, 
   guardar lo que se prueba.  Poner nombre o renombrar para que el nombre 
   corresponda a la funcionalidad que se prueba.   

2. Referenciar en la tarjeta P-1 del tablero de Trello la novedad o falla 
   que está probando, en un comentario con la referencia a la novedad o
   falla probada (e.g Probadas F-12, R-16).

3. Si una falla supuestamente resuelta sigue fallando, examinar posibles
   comentarios del equipo de desarrollo en la tarjeta y si es el caso devolver 
   la tarjeta de la columna Hecho a Haciendo, agregar comentario, pantallazo y archivo
   para sideex para reproducirlo (los casos de pruebas que fallan por 
   dificultades con sideex almacenar en `test/sideex/con_error`.

4. Si la prueba pasa agregar la prueba a la suit de pruebas con un nombre
   acorde a la prueba, agrega el archivo al repositorio y actualizar en github.


### 3.3 Ayudas para crear cada caso de prueba

Un caso de pruebas en sideex consta de una serie de ordenes, 
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

Las ayudas que se presentan a continuación son mínimas, se recomienda consultar
la ayuda de sideex (botón Help o disponible en 
<http://www.sideex.org/>), así como la especificación de 
cada orden disponible en la pestaña Reference de la interfaz de
Sideex cuando se enfoca la orden en un caso de prueba.

* En general suponer que ya se ha iniciado sesión en la aplicación con la cuenta
  administrativa de prueba y que está en la pantalla inicial de la aplicación. 
* De requerirse crear nuevos elementos pero con nombres que no puedan interferir
  con una aplicación de producción (en caso de ejecutarse sobre una).   Por 
  ejemplo nombres AAAA.
* En general cada caso de prueba debe eliminar los elementos que cree (excepción 
  si la suit de pruebas completa elimina con casos de prueba finales lo que 
  crearon los iniciales --digamos un usuario)
* Es bueno utilizar ordenes assert (el más típico debe ser 
  ```assertText```) que verifiquen que en un momento dado de la prueba 
  el estado de la aplicación sea el esperado sin lugar a dudas.
* Aunque sideex se inspiró en Selenium-IDE, en general no requiere ordenes que 
  esperen la presencia de un element como ```waitForElementPresent```
* Sideex admite la ejecución de dos o más pruebas de Sideex en diferentes 
  ventanas de explorador al mismo tiempo en un escritorio para procesar suits de 
  prueba de manera más eficiente. Por ejemplo, inicie tres ventanas de navegador 
  (NO pestañas) y abra Sideex en la barra de herramientas de cada ventana del 
  navegador, luego cargue y reproduzca las suits de prueba por cada Sideex 
  con su ventana de navegador correspondiente.
* Cuando haga pruebas solo abra la pestaña de la prueba porque si abre otra 
  pestaña al mismo tiempo la prueba correrá en esa pestaña también.
* Sideex admite la apertura, edición y ejecución de múltiples 
  suits de prueba en un solo panel. Las suits de prueba se pueden activar y 
  procesar automáticamente de forma secuencial. 
* Sideex espera automáticamente para completar la carga de la página.
* Sideex se ejecuta como una extensión para Chrome o para Firefox. 
  Está disponible para descargar uso gratuito en  http://sideex.org/
 
  ![1descarga]()

* Después de descargar Sideex se vera en la barra de 
  herramientas el icono de Sideex.
* Al abrir se vera el panel

  ![2sideex]() 

* Para empezar a hacer pruebas con sideex
    . Inicie firefox/ Chrome
    
    . Abra la página en que se va a hacer las pruebas.
    
    . Haga clic sobre el icono de sideex  en la barra de herramientas del navegador   
    
    . Haga clic en el mas del cuadro de test suits a la izquierda y dele nombre a la 
       suit y aceptar.
    
   . Haga clic en  el lado derecho del nombre de la suit creada sobre el mas y de el 
       nombre del primer caso de la suit
   
   . Haga clic en el botón Record(grabar) para iniciar las operaciones de grabación 

* Haga clic con el botón derecho en el nombre de la suit de pruebas y 
  le da varias opciones guardar, abrir, cerrar, renombrar, añadir un nuevo caso 
  a la suit de casos de pruebas.
                          
  ![3opciones]()

* Al pasar el mouse al lado izquierdo del nombre aparece una flecha hacia abajo 
  y haga clic para guardar la suit de pruebas.

  ![4flecha]()

* Todos los casos de una suit de pruebas se guardarán como un único archivo 
  de suit de pruebas. 
* En la parte inferior aparecen las palabras 
 
  . RUN  que al correr la suit hace conteo de los casos que se corren correctamente. 
  
  . FAILURES que cuenta el numero de casos que fallan.

* En la parte superior vemos varias opciones:

  ![5opciones]()

  . Record: Grabar. Haga clic empezar grabar la secuencia de comandos de 
    una prueba 
  
  . PlayThisCase: Correr este caso. Se puede correr un solo caso de 
    una suit. Haga clic sobre el caso que quiere correr, se hará visible 
    y luego haga clic en PlayThisCase
  
  . PlayThisSuite: Correr esta suit. Haga clic sobre PlayThisSuite 
    para correr toda la suit con que esta trabajando.
  
  . PlayAllSuites: Correr todas las suits. Haga clic y podrá correr 
    todas las suit que halla abierto en el panel.
  
  . Pause: Pausa. Sirve para detener una prueba en determinado momento, 
    luego clic de nuevo y se puede continuar. 
    Luego vera dos cuadros grandes:
    A la izquierda se ve :

  ![6tessuit]()

  . TEST SUITES
    Al lado de las palabras TEST SUITES se ve un icono de archivo y que 
    al hacer clic abre los archivos para guardar las pruebas

  ![7archivo ]()

  . Al lado derecho aparece un mas que al hacer clic se puede dar 
    nombre a la suit.

    ![8mas]()

  . Al lado derecho hay otro cuadro que contiene en su parte superior 
    Command: Comando. Cuando graba un caso se verán debajo todos los 
    comandos utilizados en cada prueba.

  ![9comando]()

  . Command 
  
  .  Target: 
  
  .  Value: Valor. Son valores que nosotros escribimos  
     y en la parte inferior al hacer clic sobre una linea aparecen 
     todos los Command, Target y Value de esa linea. Y se pueden modificar.
     Command
     En Target  se ve una flecha, si hace clic sobre la flecha le muestra 
     una lista de selectores  que se pueden utilizar de ser necesario.

  ![10flecha2]()

  Tiene la opción select (seleccionar) que la puede utilizar para 
  insertar una linea nueva en medio de un prueba. Haga clic sobre 
  la linea, haga clic en Record, haga clic en select, haga clic en 
  Y también tiene la opción find
  Value: 
  Otro cuadro en la parte inferior 

  ![11inferior]()

* ```ChooseOkOnNextConfirmation``` es un comando que se utiliza antes de 
  eliminar y evita tener que ayudarle manualmente en confirmar si 
  quiere eliminar 
  para ubicación del país me da la opción con una fecha que hay en 
  target al final y se puede escoger con otro selector
  ejemplo yo tenia //select[@id='caso_ubicacion_attributes_9_id_pais']
  y para que funcione cambiamos por //div[@id='ubicacion']/div/div/div/select

  ### Teclas de acceso rápido
  
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

* Las nuevas versiones de Sideex no se actualizarán 
  automáticamente. 
  Debe volver al sitio oficial y buscar nuevas versiones.  
