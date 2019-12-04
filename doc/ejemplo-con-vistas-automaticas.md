# Ejemplo de creación de tabla, modelo y controlador con vistas automáticas

Supongamos que se requiere una aplicación para manejar actividades.  
Usará sip con sus 2 roles por omisión (administradores y operadores), y ambos roles podrán administrar las actividades, es decir podrán ver, crear, editar y eliminar actividades.  Una actividad constará de un nombre, un valor y una fecha.  

Si aún no tienes una aplicación que use Sip, experimenta primero con [Iniciar un sistema de información usando Sip](https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip).

Como la aplicación se dirige a usuarios de Colombia todo debe verse en español (incluyendo URLs), los nombres de las actividades deben compararse en español, los valores monetarios con localización de Colombia (e.g 1.000,4) y las fechas también deben estar en el formato de Colombia (e.g 10/Ene/2010).

# 1. Genera parcialmente migración, modelo y controlador

En una aplicación que ya use sip (ver [Iniciar un sistema de información usando Sip](https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip)), puedes generar una migración parcial (para crear la tabla `actividad`), el modelo (`app/models/actividad.rb`) y el controlador (`app/controllers/actividades_controller.rb`) con:
```sh
$ DISABLE_SPRING=1 bin/rails g sip:modelo actividad actividades
```
Note que se requiere la forma singular del modelo (i.e `actividad`) y la plural (i.e `actividades`), pues la tabla y el modelo usarán la forma singular, mientras que el controlador y las vistas usarán la forma plural.

Tras generar archivos, completa la aplicación siguiendo las instrucciones que el generador da y que detallamos a continuación.

# 2. Modifica la migración generada

Por ejemplo, como una actividad consta de un nombre, valor y fecha, la migración quedaría así:
```rb
class CreateActividad < ActiveRecord::Migration[5.2]
  def change
    create_table :actividad do |t|
      t.text :nombre, limit: 254, null: false, collation: 'es_co_utf_8'
      t.date :fecha
      t.decimal :valor
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
```

Ejecútala con
```sh
$ bin/rails db:migrate
```

En este momento podrías probar que se crea efectivamente la tabla y una inserción y eliminación de un dato con:
```sh
$ bin/rails dbconsole
...
\dt actividad
INSERT INTO actividad (nombre, fecha, valor, created_at, updated_at) VALUES ('Correr', '2019-12-5', '1000', '2019-12-5', '2019-12-5');
SELECT * from actividad;
DELETE FROM actividad WHERE nombre='Correr';
```

# 3. Establece el control de acceso

Modifica `app/models/ability.rb` agregando el control de acceso y su descripción (agrega `include CanCan::Ability`).  Suponiendo que le quisieras dar acceso para administrar las actividades a los roles `ROLADMIN` y `ROLOPERADOR` tendrías que:
1. Agregar `can :manage, ::Actividad` en los casos de `Ability::ROLADMIN` y `Ability::ROLOPERADOR` (o `ROLANALI`) de la función `initialize`.
2. Modificar `ROLES_CA` para agregar la descripción de este acceso para los roles indicados (si no ha cambiado los ROLES por omisión de `sip`, serán 1 para `ROLADMIN` y 5 para `ROLOPERADOR`), por ejemplo:
```rb
ROLES_CA = [
      "Administrar actividades. " +
      "Crear copias de respaldo cifradas. " +
      "Administrar usuarios. " +
      "Administrar tablas básicas. ", #1
      "", #2
      "", #3
      "", #4
      "Administrar actividades. ",  #5
      "" #6
    ]
```

# 4. Indica la inflección plural en español

Agrega manualmente la inflección no regular (respecto al inglés) en `config/initializers/inflections.rb` al estilo:
```rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'actividad', 'actividades'
end
```

Puedes probar que está operando la inflección que agregaste con:
```sh
$ bin/rails console
...
'actividad'.pluralize
```

# 5. Suministra nombres en español para los campos

Agrega el nombre del modelo y sus campos en español en `config/locales/es.yml`, por ejemplo, si no tenías otras cadenas, este archivo quedaría:
```yml
es:
  activerecord:
    attributes:
      "actividad":
        Actividad: Actividad
        Actividades: Actividades
        nombre: Nombre de la actividad
        fecha_localizada: Fecha de la actividad
        valor_localizado: Costo
```

# 6. Edita el modelo generado

En `app/models/actividad.rb` indica que la fecha y el valor serán localizados, que el nombre es requerido y que cuando se presente una actividad (por ejemplo en listados) debe presentarse su identificación, un guión y el nombre.

```rb
# encoding: UTF-8

class Actividad < ActiveRecord::Base
  include Sip::Modelo
  include Sip::Localizacion

  campofecha_localizado :fecha
  flotante_localizado   :valor

  validates :nombre, presence: true

  def presenta_nombre
    "#{id} - #{nombre}"
  end
end
```

Podrías probar la definición del modelo, insertando y eliminado un elemento con:

```sh
$ bin/rails console
...
Actividad.connection
a=Actividad.create!(nombre: 'Correr', valor: 1000, fecha: '2019-12-5', created_at: '2019-12-5', updated_at: '2019-12-5')
a.destroy
```


# 7. Edita el controlador generado

En `app/controllers/actividades_controller.rb` completa:
1. Los campos por mostrar en las vistas `index` (listado de actividades), `show` (resumen de una actividad) y `form` (formulario) en las funciones `atributos_index`, `atributos_show` y `atributos_form` respectivamente --como en este caso serán iguales (excepto que id no es editable en el formulario)-- basta especificar `atributos_index`
2. El criterio de ordenamiento para el listado de actividades (por omisión es `:id` pero para este caso queremos por `nombre`)
3. El género de la palabra `actividad` (para que el botón "Nuevo" en el listado de actividades sea más bien "Nueva")

Quedará:
```rb
# encoding: UTF-8

class ActividadesController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_actividad,
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Actividad

  def clase
    "::Actividad"
  end

  def atributos_index
    [
      :id,
      :nombre,
      :fecha_localizada,
      :valor_localizado
    ]
  end

  def index_reordenar(registros)
    return registros.reorder(:nombre)
  end

  def new_modelo_path(o)
    return new_actividad_path()
  end

  def genclase
    return 'F'
  end

  private

  def set_actividad
    @registro = @actividad = ::Actividad.find(
      ::Actividad.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def actividad_params
    params.require(:actividad).permit(*atributos_form)
  end

end
```

# 8. Agrega una ruta para las vistas automáticas

Editando `config/routes.rb`  agrega antes de la declaración de la ruta raiz `root`:
```rb
resources :actividades, path_names: { new: 'nueva', edit: 'edita' }
```

# 9. Agrega una entrada en el menú de la aplicación

Editando `app/views/layouts/application.html.erb` dentro de la sección de `menu_group`:
```erb
    <% if can? :read, ::Actividad %>
      <%= menu_item "Actividades", main_app.actividades_path %>
    <% end %>
```

# 9. Lanza la aplicación

Ejecuta
```sh
$ bin/rails s
```
navegus a http://localhost:3000/  ingresa al menú Actividades que presentará el listado paginado, con un botón "Nueva" para crear nuevas actividades y por cada actividad botones para editarla o eliminarla.
