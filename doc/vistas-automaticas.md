# Vistas automáticas con Sip::Modelo y Sip::ModelosController

En SIP es posible tener vistas automáticas para un modelo y su controlador, con buen grado de personalización.

Esto requiere que el modelo incluya el módulo `Sip::Modelo` y que el controlador sea descendiente de `Sip::ModelosController`

Lo ilustramos a continuación con un ejemplo, supongamos que necesitamos una tabla histórica con tasas de cambio a diversos tipos de moneda (como se tiene en `cor1440_cinep`).  La tabla será `tasacambio`, con modelo `Tasacambio` sus campos serán:
* id
* Fecha localizada (i.e dia/Mes/año)
* Tipo de moneda, la cual será llave foránea de la tabla básica `Tipomoneda` (es decir tendrá campos id y nombre). Sera un decimal localizado
* Valor en pesos de la moneda a la fecha dada


# 1. Incluir `Sip::Modelo` en el modelo

Supongamos que creamos uno inicial con:
```sh
rails g migration crea_tasacambio
```

Y que en la migración que se crea (digamos `db/migrate/20170810040012_crea_tasacambio.rb`):
```ruby
class CreaTasacambio < ActiveRecord::Migration[5.1]
  def change
    create_table :tongue: acambio do |t|
      t.date :fecha
      t.integer :tipomoneda_id
      t.decimal :enpesos
      t.string :observaciones, limit: 5000
    end
    add_foreign_key :tasacambio, :tipomoneda
  end
end
```

Se podrá crear la tabla en la base de datos con:
```sh
rails db:migrate
```

El modelo en ```app/models/tasacambio``` es:

```ruby
class Tasacambio < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha
  flotante_localizado :enpesos

  belongs_to :tipomoneda, class_name: '::Tipomoneda',
    foreign_key: 'tipomoneda_id'

  validates :fecha, presence: true
  validates :tipomoneda_id, presence: true
  validates :enpesos, numericality: { greater_than: 0}, presence: true

  validates :tipomoneda_id, uniqueness: {
    scope: :fecha,
    message: 'no puede haber dos tasas para una moneda en una misma fecha'
  }
end
```

Note que es un modelo típico pero incluye `Sip::Modelo` para facilitar la creación de vistas genéricas y `Sip::Localizacion` para facilitar localización de fechas.


# 2. El controlador debe ser descendiente de `Sip::ModelosController`

En este caso como la forma plural de tasa de cambio es tasas de cambio en `config/initializers/inflections.rb` agregamos:
```ruby
  inflect.irregular 'tasacambio', 'tasascambio'
```

Y el contenido de `app/controllers/tasascabio_controller` es:
```ruby
class TasascambioController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_tasacambio,
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Tasacambio

  def clase
    "::Tasacambio"
  end

  def atributos_index
    [ "id",
      "fecha_localizada",
      "tipomoneda_id",
      "enpesos_localizado",
      "observaciones"
    ]
  end

  def index_reordenar(registros)
    return registros.reorder(fecha: :desc, tipomoneda_id: :asc)
  end

  def new_modelo_path(o)
    return new_tasacambio_path()
  end

  def genclase
    return 'F'
  end

  private

  def set_tasacambio
    @registro = @basica = @tasacambio = ::Tasacambio.find(
      Tasacambio.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def tasacambio_params
    params.require(:tasacambio).permit([
      :enpesos_localizado,
      :fecha_localizada,
      :observaciones,
      :tipomoneda_id
    ])
  end
end
```

En este caso supondremos que las rutas serán las típicas de rails (tasascambio, tasascambio/1) aunque preferimos en español las rutas para editar y nuevas.  Se crean definiendo en ```config/routes.rb```:
```ruby
resources :tasascambio,
      path_names: { new: 'nueva', edit: 'edita' }
```
En caso que prefiera usar singular tanto para el modelo como para el controlador, especifique la misma cadena singular y plural en `config/initializers/inflections.rb` y cree una ruta `post` para el modelo en singular con alias `crea_modelo_path` y que diriga al método `create` del controlador.  Ver por ejemplo como se hace con `plantillahcr` en https://github.com/pasosdeJesus/heb412_gen/blob/master/config/initializers/inflections.rb y https://github.com/pasosdeJesus/heb412_gen/blob/master/config/routes.rb.

## 2.1 Lo clásico de un controlador 

Notará que tiene varios métodos típicos de un controlador de rails: `tasacambio_params`, `set_tasacambio` y al comienzo las declaraciones:
```ruby
   before_action :set_tasacambio,
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource class: ::Tasacambio
```

La primera para establecer la variable `@tasacambio` antes de llamar métodos `show`, `edit`, `update` y `destroy` con la función `set_tasacambio`.  Notará que esa función establece `@ŧasacambio` como es típico en rails, pero también `@registros` que es requerida por las vistas automáticas.

Por su parte `load_and_authorize...`  asegura que se cumplan las reglas de autorización que se definan sobre `::TasaCambio`.  Sin embargo el controladore y las vistas automáticas lo obligan como se explica en [Autorización por omisión con Sip::ModelosController](https://github.com/pasosdeJesus/sip/wiki/Autorizaci%C3%B3n-por-omisi%C3%B3n-con-Sip::ModelosController)

## 2.2 Lo nuevo en un controlador

El método `clase` retorna una cadena con el módelo de la clase que principalmente modificaran las vistas automáticas.

El método `atributos_index` retorna un vector con los campos que deben presentarse en la vista `index` (también sería posible especificar atributos por presentar en el formulario y en la vista show, pero si no se especifican mediante los métodos `atributos_form` y `atributos_show` por omisión serán los mismos de `atributos_index`.)

El método `index_reordenar` reordena los registros que se presentarán en la vista `index`.

El método `new_modelo_path` retorna la ruta para crear un nuevo registro de la tabla `tasacambio`.  

El método `genclase` retorna el genero en español del módelo, por ejemplo como decimos "la tasa de cambio" (femenino) se retorna 'F',  (si fueses "el proyecto" sería 'M').

Notará que las vistas automáticas usan bootstrap para el diseño y chosen para los campos de texto

# 3. Prueba inicial

Con esto basta para usar las vistas creadas automáticamente. Inicie el servidor de prueba
```sh
rails s
```

Y en el navegador puede dirigirse a la ruta `/tasascambio`

Verá el listado con diseño estilo bootstrap y listo para agregar nuevos registros. Cuando agregue suficientes verá el paginado.

Notará un primer filtro en la columna id, podrá definir otros personalizando un poco más el modelo y el controlador o creando vistas parciales.

Con el botón Nueva ingresará al formulario de edición, la cual tendrá como campos de selección (agradables con chosen) los campos que en el modelo sean `belongs_to` y `has_many`.  



# 4. Personalización de las vistas 

Puede usar sus propias vistas creando los archivos `app/views/tiposcambio/index.html.erb`, `app/views/tiposcambio/show.html.erb`, `app/views/tiposcambio/edit.html.erb` y `app/views/tiposcambio/new.html.erb`.

Como haría en una aplicación rails típica, sin embargo la infraestructura de Sip permite hacer pequeñas modificaciones a las vistas genéricas que genera para `Sip::Modelo`, como se explica en esta sección.

## 4.1 Listado (vista `index`)

### 4.1.1 Título y nombres de campos
El título se presenta en la parte superior del listado y los nombres de campos son los títulos de las
columnas (así como los nombres de campo en el formulario) se modifican en `config/locale/es.yml`  allí dentro de `es.attributes.activerecord.attributes` cree una sección como: 
```yaml
      tasacambio:
        Tasacambio: Tasa de cambio
        Tasascambio: Tasas de cambio
        tipomoneda: Tipo de moneda
```

### 4.1.2 Filtro en listado 

Usted puede modificar por completo el filtro estándar que se presenta definiendo en el directorio de la vista el archivo `_index_filtro.html.erb` que recibe el formulario en la variable `f`.  

Si prefiere también puede personalizar el filtro por omisión de una vista index, el cual  inicialmente sólo tiene la identificación (para buscar por esta).  Para agregar otros criterios basta agregar `scopes` en el modelo cuyo nombre sea de la forma `:filtro_campo` donde campo es alguno de los campos de `atributos_index`.

Por ejemplo para filtrar  por tipo de moneda, 
```ruby
scope :filtro_tipomoneda_id, lambda { |t|
  where(tipomoneda_id: t)
}
```

Para campos de fecha, enteros y flotantes es fácil que el filtro maneje un rango usando dos `scope`, uno con posfijo `ini` y otro con posfijo `fin`. Por ejemplo para filtrar en un rango de fechas:
```ruby
scope :filtro_fechaini, lambda { |f|
  where('fecha >= ?', f)
}


scope :filtro_fechafin, lambda { |f|
  where('fecha <= ?', f)
}
```

Para campos tipo cadena recomendamos algo como:
```ruby
scope :filtro_observaciones, lambda {|o|
    where("unaccent(observaciones) ILIKE '%' || unaccent(?) || '%'", o)
} 
```
Que permite encontrar parte de la cadena, sin tener en cuenta capitalización, ni acentos.

Note que en el caso de fecha, a menos que cambie el control para el filtro, por omisión el control que Sip pone es un campo HTML estándar para fechas.  Este control depende del navegador y siempre retorna la fecha en formato aaaa-mm-dd, por eso el filtro no emplea fecha_localizada (sino fecha) aún cuando la columna especificada en el controlador sea esa.

#### 4.1.2.1 Control para un campo del filtro

Al igual que en formulario se generará un control para el filtro con base en el tipo del campo y su relación con el modelo que se presenta. Si prefiere especificar un control particular para un campo cree una plantilla
`app/views/tasascambio/_filtro_tipomoneda_id.html.erb` con:

```erb
<%= f.input :bustipomonedad_id,
  collection: ::Tipomoneda.where("nombre!='PESO'"), 
  include_blank: true,
  label_method: :presenta_nombre,
  value_method: :id,
  label: false,
  selected: Sip::ModeloHelper.poromision(params, :bustipomoneda_id),
  input_html: {
    class: 'chosen-select',
    'data-enviarautomatico' => ''
  }
%>
```

#### 4.1.2.2 Otros controles de un filtro

A la derecha del filtro debajo de la columna acciones por omisión se presentará el botón "Filtrar".
Si necesita agregar otro o modificarlo defina en el directorio de la vista el archivo `_index_filtro_controles.html.erb` que recibe el formulario en la variable `f`.

### 4.1.3 Información de cada campo dentro de la tabla

Es posible configurar la presentación de un campo de dos maneras (1) con una vista parcial de nombre `_index_campo_nombrecampo.html.erb` o (2) mediante la función `presenta` del modelo.  

#### 4.1.3.1 Usando una vista parcial

Un ejemplo puede verse en `cor1440_cinep`, donde los anexos de un efecto se presentan agregando el archivo `app/views/efectos/_index_campo_anexo_efecto.html.erb` con un contenido que utiliza la variable registro:
```erb
<% if registro %>
  <% registro.sip_anexo.each do |i| %>
    <%= link_to(
      image_tag("cor1440_gen/clip.svg", size: "16"),
      sip.descarga_anexo_path(i.id),
      {"data-turbolinks" => false }
    ) %>
  <% end %>
<% end %>
```

#### 4.1.3.2 Usando función `presenta` del modelo 
Un ejemplo está en las fuentes de `sip`en el modelo `usuario` que tiene un campo entero `rol`, cuya representación en cadena no está en tabla alguna sino en la aplicación (se trata de un vector `Ability::ROLES`):

```ruby
def presenta(atr)
  case atr.to_s
  when 'rol'
    a = Ability::ROLES.select { |v| v[1] = rol }                                                                                         
    a.first[0]                                                                                                                           
  else                                                                                                                                   
    presenta_gen(atr)                                                                                                                    
  end                                                                                                                                    
end             
```

### 4.1.4 Epilogo de la tabla
Después de la tabla es posible configurar un epilogo definiendo en el directorio de la vista el archivo
`_index_post_tabla` que recibe el formulario en la variable `f`.

Si no define uno diferente el epilogo por omisión permite paginar y presenta un botón "Nuevo" que permite añadir registros.


## 4.2 Formulario (vista `_form`)

### 4.2.1 Remplazar un sólo campo

Si prefiere tener un control no estándar para algún campo del formulario basta que cree un directorio para las vistas y un archivo con nombre de la forma `_campo_nombre.html.erb`.  

Suponiendo que en tasacambio quisiera emplear un campo diferente para el tipo de moneda que no incluya PESOS, lo que debe hacer es crear el archivo `app/views/tasascambio/_campo_tipomoneda_id.html.erb` con contenido:
```erb
<% tm = ::Tipomoneda.where("nombre!='PESO'") %>
<%= f.association :tipomoneda,
   collection: tm,
   label_method: :presenta_nombre,
   value_method: :id,
   input_html: { class: 'chosen-select' }
%>
```

## 4.3 Resumen (vista `show`)

El contenido de un campo puede presentarse de forma personalizada bien con la función `presenta` del modelo  o bien con una vista parcial de nombre `_show_campo_nombrecampo`.  Ambas situaciones son análogas en la vista `index` por lo que lo referenciamos a ver la sección 4.1.

Los botones de esta vista puede configurarse por completo para un modelo con una vista parcial `_show_acciones` o pueden agregarse botones antes del botón Eliminar en `_show_mas_acciones`. Estos parciales deben ubicarse en una ruta de la forma `app/views/modelo/_show_acciones`


