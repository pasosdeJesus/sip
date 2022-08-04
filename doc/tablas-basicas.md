# Tablas Básicas

Una tabla básica representa un tipo de dato con unas pocas opciones. Tipicamente se usa en campos de selección simple o campos de selección múltiple. Cada opción o registro tiene un nombre (por ejemplo país, tipo de documento de identidad, etc.). Incluye lo que en otros sistemas de información se llama _variable_, _tesauro_, _diccionario_, _parámetros de la aplicación_ y _vocabularios controlados_.  

En sip además del nombre tiene unas observaciones (por ejemplo para poner una definición o casos de uso) y  se agrega un poco de control a lo largo del tiempo mediante los campos `fechacreacion` y `fechadeshabilitación`.  El campo `fechadeshabilitacion` se espera vacío en registros habilitados y con la fecha en la que se deshabilitó para registros deshabilitados.

En formularios con campos de selección simple o múltiple que utilicen la tabla básica, se busca mantener información histórica (i.e registros deshabilitados) si los hay, pero a su vez agregar o cambiar a información actual (i.e registros habilitados):
* En el caso de campos de selección simple si tiene elegido un registro deshabilitado se mantiene y al usuario se le permiten cambiar pero a registros habilitados.
* En el caso de campos de selección múltiple si tiene agregados registros deshabilitados se mantienenen y al usuario se le permite añadir sólo registros habilitados.


# 1. Generador de nuevas tablas básicas

Las nuevas tablas básicas y bastantes de los cambios requeridos se recomienda iniciarlos con la tarea  `sip:tablabasica`. Por ejemplo para generar una tabla básica de categorias de motivos, con nombre interno `acpcatmotivo` y forma plural interna `acpcatsmotivo`:
```sh
$ DISABLE_SPRING=1 bin/rails g sip:tablabasica acpcatmotivo acpcatsmotivo --modelo
```  
Que generará varios archivos automáticamente, algunos de los cuales debe editar:

| Archivo | Descripción | Edición que requiere |
| --- | --- | --- |
| `app/models/acpcatmotivo.rb` | Modelo | |
| `db/migrate/20200715103001_create_acpcatmotivo.rb` | Migración --el nombre incluirá la fecha de ejecución | Agregar `, null: false` en líneas `nombre`, `fechacreacion`, `created_at` y `updated_at`.  Agregar al comienzo `include Sip::SqlHelper`. Cambiar `def change` por `def up` y agregar  `def down` que solo ejecute `drop_table :tabla`. En método up, después de la creación de tabla agregar `cambiaCotejacion('tabla', 'nombre', 500, 'es_co_utf_8')` |
| `app/controllers/admin/acpcatsmotivo_controller.rb` | Controlador | Cambiar sexo en función `genclase`. Por ejemplo como categoría es femenino debería quedar en 'F' |
| `test/models/acpcatmotivo_test.rb` | Pruebas a modelo |  |
| `test/controllers/acpcatsmotivo_controller_test.rb` | Borrador de pruebas a controlador | Requiere implementarlas |

Además debe editar otros archivos ya existentes para realizar los siguientes cambios:

| Archivo | Edición que requiere |
| --- | --- |
| `app/models/ability.rb` | En la función tablas básicas (o en la constante apropiada) agregue la nueva tabla básica, con algo como `['', 'acpcatmotivo']` y en la función `initialize` defina el control de acceso, por ejemplo si un rol o grupo puede administrarla ponerle `can :manage, ::Acpcatmotivo`.  Ver ejemplo completo en <https://github.com/pasosdeJesus/cor1440_cinep/blob/master/app/models/ability.rb> |
| `config/initializers/inflections.rb` | Añadir en orden alfabético o en un orden que asegure que se carga correctamente, una línea de la forma `inflect.irregular 'acpcatmotivo', 'acpcatsmotivo'` |
| `config/locales/es.yml` | En `es:` -> `activerecord:` -> `attributes:` añada líneas como las que se ven a continuación |
  
```yaml
 "acpcatmotivo":  
   Acpcatmotivo: Categoria de motivos
   Acpcatsmotivo: Categorias de motivos
```
| Archivo | Edición que requiere |
| --- | --- |
| `config/locales/en.yml` | En `en:` -> `activerecord:` -> `attributes:` añada líneas como las que se ven a continuación |
  
```yaml
 "acpcatmotivo":  
   Acpcatmotivo: Categorie of motives
   Acpcatsmotivo: Categories de motives
```

Los datos iniciales para esta tabla, los puede agregar en una nueva migración
```
bin/rails g migration datosini_acpcatmotivo
```
cuyo contenido puede ser como el de <https://github.com/pasosdeJesus/cor1440_cinep/blob/master/db/migrate/20200715105931_datosini_acpcatmotivo.rb> 

O si prefiere también puede incluirlos en la migración que crea la tabla, como se hace por ejemplo en <https://github.com/pasosdeJesus/cor1440_cinep/blob/master/db/migrate/20200805141624_create_acpactor1.rb>  (note que al final reserva 100 primeros identificadores con `SELECT setval('acpactor1_id_seq', 100);`)

Esos datos iniciales y la reserva de identificaciones inciales también los debe agregar al archivo `db/datos-basicas.sql` precediendo el nombre de la tabla con `public`

Tras esto ejecute las migraciones:
```
bin/rails db:migrate
```

Lance la aplicación y revise la tabla básica desde el menú Administrar->Tablas básicas.


## 1.1 Generación en un motor

Si la tabla básica será usada en un motor, que servirá a la vez en otras aplicaciones que usen el motor,  deberá ejecutar la tarea `sip:tablabasica` desde el directorio `test/dummy/`, es decir en la aplicación de prueba de motor. Una vez generados los archivos correspondientes estos deberán moverse a la raíz principal del motor de la siguiente forma:

* Mover las migraciones así
```
mv test/dummy/db/migrate/[migracion] db/migrate
```
*  Mover el modelo dividiendolo en una clase ubicada en `app/models/[motor]/` y en un módulo ubicado en `lib/[motor]/conerns/models/`. Por ejemplo para el caso de la tabla básica `financiador` del motor `cor1440_gen`, el módulo queda en [lib/cor1440_gen/concerns/models/financiador.rb](https://github.com/pasosdeJesus/cor1440_gen/blob/master/lib/cor1440_gen/concerns/models/financiador.rb) y la clase queda en [app/models/cor1440_gen/financiador.rb](https://github.com/pasosdeJesus/cor1440_gen/blob/master/app/models/cor1440_gen/financiador.rb).
* Mover el controlador dividiendolo en dos archivos, una clase en `app/controllers/[motor]/admin/` y un módulo en `lib/[motor]/concerns/controller`. Para el caso de la tabla básica `financiador` del motor `cor1440_gen`,  la clase queda en [app/controllers/cor1440_gen/admin/financiadores_controller.rb](https://github.com/pasosdeJesus/cor1440_gen/blob/master/app/controllers/cor1440_gen/admin/financiadores_controller.rb) y el módulo en [lib/cor1440_gen/concerns/controllers/financiadores_controller.rb](https://github.com/pasosdeJesus/cor1440_gen/blob/master/lib/cor1440_gen/concerns/controllers/financiadores_controller.rb)
* La inflección del plural y las cadenas en español deben ubicarse en los archivos de configuración del motor (`config`) y no en los de la aplicación de prueba (`test/dummy/config`).

# 2. Modelo

A nivel de tabla en la base de datos tiene por lo menos: 
- ```id``` (obligatorio, por omisión un entero autoincremental, pero puede ser otro tipo)
- ```nombre``` (por omisión máximo de 500 caracteres, obligatorio, se recomienda unicidad y mayúsculas),
- ```observaciones``` (por omisión máximo de 5000 caracteres)
- ```fechacreacion``` (indispensable)
- ```fechadeshabilitacion``` que por convención es nil (NULL en SQL) para indicar que el registro puede usarse. Si tiene una fecha significa que el registro no puede asociarse a nuevos datos (no debe aparecer en listados de selección cuando se relaciona con información nueva), pero la información histórica que ya lo tuviera asociado no debe cambiarse.

El modelo en Rails debe incluir el módulo ```Sip::Basica``` que tendrá en cuenta esto y otros detalles.  Si una tabla básica no requiere unicidad de nombres debe definirse la constante ```Nombresunicos=false```  Ver por ejemplo tablas básicas, departamentos, municipios y clases.

# 3. Datos por omisión

Se recomienda ubicar datos básicos de las tablas propias del motor en ```db/datos-basicas.rb```
Si deben hacerse cambios a datos de tablas básicas de motores que se carguen se recomienda hacerlo en ```db/cambios-basicas.rb```

En una aplicación los datos básicos de los motores que la aplicación use se cargarán desde ```db/seed.rb``` con la función ```Sip::carga_semillas_sql```

Cuando modifique desde la aplicación los datos de tablas básicas, se recomienda generar nuevamente el archivo ```db/datos-basicas.sql``` ejecutando la tarea ```bin/rails sip:vuelcabasicas```  o editando ese archivo manualmente.


# 4. Migraciones

Además de  la migración inicial para crear la tabla básica y una migración por cada actualización a la estructura de la tabla, se recomienda:
* Una migración para incluir los datos por omisión iniciales
* Una migración por cada modificación a los datos por omisión de la tabla básica --y la respectiva modificación a las semillas de ```db/datos-basicas.rb``` y/o ```db/cambios-basicas.rb```, de forma que estos últimos consten únicamente de ```INSERT``` (y si acaso ```UPDATE``` para sobrellevar integridad referencial) y así tengan el estado esperado más reciente de los datos por omisión de las tablas básicas.

# 5. Listado de tablas básicas

Es importante definir algunas funciones en  ```ability.rb``` (ubicado en ```app/models``` en aplicaciones y en ```app/models/mimotor``` en motores) para:
1. Que las rutas para ver y modificar tablas básicas y sus vistas se generen automáticamente
2. Que operen algunas tareas ```rake``` para actualizar índices (```rake sip:indices```) y  volcar y restaurar tablas.
Las funciones a definir son:
- ```def tablasbasicas```: Listado de tablas básicas, cada una especificada como un arreglo de 2, prefijo y tabla
- ```def basicas_id_noauto```: Listado de tablas básicas cuyo id no es entero autoincremental
- ```def nobasicas_indice_seq_con_id```: Listado de tablas no básicas pero que tienen un índice que requiere actualización.
- ```def tablasbasicas_prio```: Listado de tablas básicas que deben volcarse primero (para mantener integridad referencial).

Además es recomendable (especialmente si desarrolla un motor) que defina constantes relacionadas pero propias del motor: ```BASICAS_PROPIAS, BASICAS_ID_NOAUTO, NOBASICAS_INDSEQID, BASICAS_PRIO``` para que puedan ser referenciadas facilmente desde el archivo `ability.rb` de otros motores o aplicaciones.

Para mantener los arreglos descritos, recomendamos no emplear variables de clase (e.g Antes usabamos @@tablasbasicas) por que el orden en el que se cargan los archivo ```ability.rb``` de los diversos motores y de la aplicación es diferente en modo de producción que en modo de desarrollo (en modo de producción usa carga ávida _eager_) que puede dar lugar a definiciones erradas e inesperadas.

# 6. Controlador

A nivel de controlador las acciones ```index``` y ```show``` presentan los nombres de campos usando
el método de clase ```human_attribute_name(campo)```
Los valores de cada campo los genera con el método ```presenta``` del modelo. 
Este método por omisión genera:
* Booleanos como si y no
* Campos que sean llaves foráneas con el método ```presenta_nombre``` de 
  la tabla relacionada
* Asociaciones ```has_many``` en tablas combinadas concatendando los nombres
  (mediante ```presenta_nombre```) y separando con ';'
* Otros campos como cadena

En los modelos puede sobrecargar los métodos de objeto ```presenta_nombre```
y ```presenta```, así como definir traducciones o sobrecargar el método de clase
```human_attribute_name``` para personalizar más.

# 7. Vistas

Son automáticas, no necesita editar código para estas. 

En el formulario de edición/creación como controles de edición se usaran:
* Campos de selección para llaves foráneas  ```belongs_to```
* Campos de selección múltiple para asociaciones ```has_many```
* Campos de fecha para campos con tipo ```:date```
* Campos enteros para campos con tipo ```:integer```
* Campos de texto para los demás casos.

Sin embargo puede personalizarse el control para edición para un campo
digamos con nombre ```tfuente``` creando en la aplicación la vista parcial ```app/views/sip/admin/basicas/mitabla/_tfuente.html.erb```

# 8. Actualización de indices y volcado de datos

La actualización de índice se hace con 
```
bin/rails sip:indices
```
Y el volcado de los datos de las tablas básicas (en `db/datos_basicas.sql`):
```
bin/rails sip:vuelcabasicas
```
Aunque si está desarrollando un motor y deja bien los datos de las tablas básicas en la aplicación de pruebas puede copiarlos a la ubicación recomendada con:
```
cd spec/dummy
RAILS_ENV=test bin/rails sip:vuelcabasicas
diff ../../db/datos-basicas.sql db/datos-basicas.sql
```
e integrar los cambios necesarios, preferiblemente con:
```
cp db/datos-basicas.sql ../../db/datos-basicas.sql
```
Esta forma de integración es ideal pero no siempre es posible por ejemplo por temas de integridad referencial que requieran deshabilitar al comienzo de `db/datos-basicas.sql` y rehabilitar al final.  Ver ejemplo el caso de sivel2_gen en <https://github.com/pasosdeJesus/sivel2_gen/blob/master/db/datos-basicas.sql>


