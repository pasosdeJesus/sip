# Localización de cantidades numéricas y fechas

Es recomendable emplear tipos estándar en base de datos (i.e  ```:decimal, precision: 20, scale: 2``` para cantidades con decimales (e.g 4333.33) e ISO 8601 para fechas (e.g '2016-03-13').

Por ejemplo a nivel de modelo podría agregar un campo numérico en un migración con:
```ruby
add_column :cor1440_gen_actividad, :tiempo, :decimal,
      precision: 20, scale: 2
```

Sin embargo para los usuarios del sistema de información debería ser natural utilizar las convenciones de su país.  

En SIP se ha extendido ActiveRecord::Base para poder indicar:
* campos numéricos con decimales (por ejemplo cantidades monetarias) que deben presentarse con las convenciones del locale de la aplicación (definidas en I18n::t('numeric')
* Campos de fecha que deben presentarse en otros formatos, por ejemplo '05/Mar/2016'

## Campos númericos con decimales localizados
Si en la base de datos hay un campo ```saldo``` declare que se podrá presentar o recibir localizado en el módelo con:
```
flotante_localizado :saldo
```

Esto agregará la posibilidad de presentar ```saldo_localizado``` o escribir en este, haciendo las conversiones del locale del servidor.

Para validaciones en el modelo puede seguir usando ```saldo```, pero en vistas y donde aplique en el controlador podrá usar ```saldo_localizado``` (por ejemplo en el formulario y por tanto en la lista blanca de parámetros por recibir). 

Las extensiones a clases permiten escribir las siguientes expresiones:
* Con el tipo `string`
  * `"3.2".a_decimal_localizado`  dará la cadena `"3,2"`
  * `"3,2".a_decimal_nolocalizado` dará la cadena `"3.2"`
* Con el tipo `numeric`:
  * `3.2.a_decimal_localizado` dará la cadena `"3,2"`
* Con el tipo `NilClass`:
  * `nil.a_decimal_localizado` dará la cadena `"0,0"`  (imitando que `nil.to_f` da el flotante `0.0`)
  * `nil.a_decimal_nolocalizado` dará la cadena `"0.0"`

## Campos de fecha en formatos localizados

El formato de la fecha especifiquelo en  ```config/application.rb``` con ```config.x.formato_fecha```.  Esto fijara el formato que DatePicker usará en la interfaz, con algunas funciones auxiliares este mismo se emplea al lado del servidor para convertir al formato de PostgreSQL (al lado del servidor los formatos se especifican con notación de POSIX que es diferente, por eso y para convertir al formato estándar de PostgreSQL se requieren ayudadores).   En el momento de este escrito los formatos que más se han probado son:
* ```yyyy-mm-dd``` (por ejemplo 2016-01-24, este es el formato estándar de PostgreSQL).
* ```dd-M-yyyy``` (por ejemplo 24-Ene-2016) 
* ```dd/M/yyyy``` (por ejemplo 24/Ene/2016) 
* ```dd-mm-yyyy``` (por ejemplo 24-01-2016) 
* ```dd/mm/yyyy``` (por ejemplo 24/01/2016) 

En los modelos incluya ```include Sip::Localizacion``` y emplee ```campofecha_localizado``` para señalar los campos tipo fecha que el usuario llenará con el formato de ```config.x.formato_fecha```, por ejemplo:
```
campofecha_localizado :fechadeshabilitacion
```
En las vistas utilice el nombre del campo pero agregandole ```_localizada``` por ejemplo ```fechadeshabilitacion_localizada```.  Cuando asigne este campo, se asignará automáticamente la misma fecha pero en formato estándar de PostgreSQL a ```fechadeshabilitacion```.  Analogamente cuando lea ```fechadeshabilitacion_localizada```, leerá la misma información de ```fechadeshabiltiacion``` pero convertida automáticamente al formato de ```config.x.formato_fecha```.

Por otra parte en campos que no estén en sus modelos o cuando lo requiera, puede emplear las funciones auxiliares 
* ```fecha_local_estandar``` Que convierte una fecha en el formato especificado en ```config.x.formato_fecha``` al formato estándar de PostgreSQL
* ```fecha_estandar_local``` Que convierte una fecha en el formato estándar de PostgreSQL al especificado en ```config.x.formato_fecha```

### Campos de fecha que se llenan con año y mes

Por ejemplo si fechaformulacion es un campo tipo fecha pero del cual sólo se requiere año y mes, use:
```
campofecha_mesanio :fechaformulacion
```
En las vistas, modelo y controlador podrá examinar o asignar `fechaformulacion_mes` y `fechaformulacion_anio`



