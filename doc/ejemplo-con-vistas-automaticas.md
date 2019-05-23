# Ejemplo de creación de tabla, modelo y controlador con vistas automáticas

Supongamos que se requiere una aplicación para manejar actividades.  
Usará sip con sus 2 roles por omisión (administradores y operadores), y ambos roles podrán administrar las actividades, es decir podrán ver, crear, editar y eliminar actividades.  Una actividad constará de un nombre, un valor y una fecha.  

Si aún no tiene una aplicación que use Sip, vea primero [Iniciar un sistema de información usando Sip](https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip).

Como la aplicación se dirige a usuarios de Colombia todo debe verse en español (incluyendo URLs), los nombres de las actividades deben compararse en español, los valores monetarios con localización de Colombia (e.g 1.000,4) y las fechas también deben estar en el formato de Colombia (e.g 10/Ene/2010).

# 1. Genere parcialmente migración, modelo y controlador

En una aplicación que ya use sip (ver [Iniciar un sistema de información usando Sip](https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip)), puede generar una migración parcial (para crear la tabla), el modelo (app/models/actividad.rb) y controlador (app/controllers/actividades_controller.rb) con:
```sh
$ DISABLE_SPRING=1 bin/rails g sip:modelo actividad actividades
```
Note que se requiere la forma singular del modelo (i.e actividad) y la plural (i.e actividades), pues la tabla y el modelo usarán la forma singular, mientras que el controlador y las vistas usarán la forma plural.

Tras generar archivos, complete la aplicación siguiendo las instrucciones que el generador da y que detallamos a continuación.

# 2. Modifique la migración generada

Por ejemplo, como una actividad consta de un nombre, valor y fecha, la migración quedaría así:
```rb
class CreateActividad < ActiveRecord::Migration[5.2]
  def change
    create_table :actividades do |t|
      t.text :nombre, limit: 254, null: false, collation: 'es_co_utf_8'
      t.date :fecha
      t.decimal :valor
      t.timestamp :created_at
      t.timestamp :updated_at
    end
  end
end
```

Y ejecútela con
```sh
$ rails db:migrate
```

# 3. Establezca el control de acceso

Modifique `app/models/ability.rb` agregando el control de acceso y su descripción (agregar `include CanCan::Ability`).  Suponiendo que le quisiera dar acceso para administrar las actividades a los roles ROLADMIN y ROLOPERADOR tendría que:
1. Agregar `can :manage, ::Actividad` en los casos de Ability::ROLADMIN y Ability::ROLOPERADOR (o ROLANALI) de la función initialize.
2. Modificar ROLES_CA para agregar la descripción de este acceso para los roles indicados (si no ha cambiado los ROLES por omisión de SIP, serán 1 para ROLADMIN y 5 para ROLOPERADOR), por ejemplo:
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

# 4. Indique la inflección plural en español

Agregue manualmente la inflección no regular (para el inglés) en `config/initializers/inflections.rb` al estilo:
```rb
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.irregular 'actividad', 'actividades'
end
```

# 5. Suministre nombres en español para los campos

Agregue el nombre del modelo y sus campos en español en `config/locales/es.yml`, por ejemplo si no tenía otras cadenas en este archivo quedaría:
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

# 6. Edite el modelo generado

En `app/models/actividad.rb` indique que la fecha y el valor serán localizados, que el nombre es requerido y que cuando se presente una actividad (por ejemplo en listados) debe presentarse su identificación, un guión y el nombre.

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

# 7. Edite el controlador generado

En `app/controllers/actividades_controller.rb` complete:
1. Los campos por mostrar en las vistas `index` (listado de actividades), `show` (resumen de una actividad) y `form` (formulario) en las funciones `atributos_index`, `atributos_show` y `atributos_form` respectivamente --como en este caso serán iguales (excepto que id no es editable en el formulario)-- basta especificar `atributos_index`
2. El criterio de ordenamiento para el listado de actividades (por omisión es :id pero para este caso queremos por nombre)
3. El genero de la palabra actividad (para que el botón "Nuevo" en el listado de actividades sea más bien "Nueva")

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
      "id",
      "nombre",
      "fecha_localizada",
      "valor_localizado"
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

# 8. Agregue una ruta para las vistas automáticas

Editando `config/routes.rb`  agregue antes de la declaración de la ruta raiz `root`:
```rb
resources :actividades, path_names: { new: 'nueva', edit: 'edita' }
```

# 9. Agregue una entrada en el menú de la aplicación

Editando `app/views/layouts/application.html.erb` dentro de la sección de `menu_group`:
```erb
    <% if can? :read, ::Actividad %>
      <%= menu_item "Actividades", main_app.actividades_path %>
    <% end %>
```

# 9. Lance la aplicación

Ejecute
```sh
$ bin/rails s
```
navegue a http://localhost:3000/  ingrese al menú Actividades que presentará el listado paginado, con un botón "Nueva" para crear nuevas actividades y por cada actividad botones para editarla o eliminarla.
