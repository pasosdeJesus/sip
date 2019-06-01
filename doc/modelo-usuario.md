# Uso y personalización del modelo usuario

El modelo usuario se asocia a la tabla usuario donde se almacena la información de usuarios del sistema y es fundamental en la definición del control de acceso a la aplicación.

Recomendamos emplear `usuario` como nombre de tabla y modelo, para aprovechar las diversas características que se han desarrollado en sip y motores descendientes. Comenzando porque se ha desarrollado sobre Sip::Modelo así que las vistas son automáticas (y el listado incluye paginación y filtros) y el esfuerzo para desarrollar y mantener controladores y el modelo es menor.


# 1. En aplicaciones

## 1.1 Modelo

El modelo usuario ubicado en `app/models/usuario.rb` debe incluir Sip::Concerns::Models::Usuario (u otro módulo de un motor que a su vez lo incluya).  Por ejemplo:
```
# encoding: UTF-8

require 'sip/concerns/models/usuario'

class Usuario < ActiveRecord::Base
  include Sip::Concerns::Models::Usuario
end
```

## 1.2 Controlador

El controlador se hace de manera análoga pero descendiente de Sip::ModelosController, por ejemplo `app/controllers/usuario_controller.rb`:
```
# encoding: UTF-8
require 'sip/concerns/controllers/usuarios_controller'

class UsuariosController < Sip::ModelosController
  include Sip::Concerns::Controllers::UsuariosController
end
```

Tal como en modelo en lugar de incluir el módulo de Sip puede incluirse el de otro motor que a su vez incluya el de Sip.

## 1.3 Vistas

Se personalizan como otras vistas de modelos Sip::Modelo (ver <https://github.com/pasosdeJesus/sip/wiki/Vistas-autom%C3%A1ticas-con-Sip::Modelo-y-Sip::ModelosController>).


# 2. En motores

## 2.1 Modelo

Definir particularidades del modelo en lib/mimotor/concerns/models/usuario.rb por ejemplo:
```
# encoding: UTF-8

require 'sip/concerns/models/usuario'

module Sivel2Gen
  module Concerns
    module Models
      module Usuario
        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Models::Usuario

          has_many :caso_usuario, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoUsuario'

          has_many :caso_etiqueta, foreign_key: "id_usuario", validate: true,
            class_name: 'Sivel2Gen::CasoEtiqueta'
        end
      end
    end
  end
end
```
En la aplicación de prueba `test/dummy` operar como en el caso de aplicaciones.

## 2.2 Controlador

Definir particularidades en `lib/mimotor/concerns/controllers/usuarios_controller.rb`,  por ejemplo:

```
# encoding: UTF-8

require 'sip/concerns/controllers/usuarios_controller'

module Cor1440Gen
  module Concerns
    module Controllers
      module UsuariosController

        extend ActiveSupport::Concern

        included do
          include Sip::Concerns::Controllers::UsuariosController

          def atributos_index
            [ "id",
              "nusuario",
              "nombre",
              "rol",
              "oficina_id",
              "email",
              "created_at_localizada"
            ]
          end

          def atributos_form
            r = [
              "nusuario",
              "nombre",
              "descripcion",
              "rol",
              "oficina_id",
              "email",
              "idioma",
              "encrypted_password",
              "fechacreacion_localizada",
              "fechadeshabilitacion_localizada",
              "failed_attempts",
              "unlock_token",
              "locked_at"
            ]
          end

          private

          def usuario_params
            p = params.require(:usuario).permit(
              :id, :nusuario, :password,
              :nombre, :descripcion, :oficina_id,
              :rol, :idioma, :email, :encrypted_password,
              :fechacreacion_localizada, :fechadeshabilitacion_localizada,
              :reset_password_token,
              :reset_password_sent_at, :remember_created_at, :sign_in_count,
              :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip,
              :failed_attempts, :unlock_token, :locked_at,
              :last_sign_in_ip, :etiqueta_ids => []
            )
            return p
          end


        end  # included

      end
    end
  end
end                                                            
```

## 2.3 Vistas

Si por ejemplo se necesita personalizar el campo presentado en un filtro poner el control por usar en `app/views/mimotor/usuario/_filtro_campo.html.erb`
