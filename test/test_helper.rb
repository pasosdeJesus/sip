ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'
SimpleCov.start
require_relative 'dummy/config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
end

# En motores no funcionan fixtures como quedó documentado en
# https://github.com/rails/rails/issues/4971
# Es posible reusar datos de ejemplo de pruebas de modelos con:
#  require_relative '../../models/sip/grupoper_test'
#  require_relative '../../models/sip/orgsocial_test'
# Aunque se ejecutarán las pruebas de esos archivos nuevamente

# Nos parece más simple dejar los datos para pruebas en este archivo
# Y que cada prueba cree lo que necesite (posiblemente en setup)


# Usuario administrador para ingresar y hacer pruebas
PRUEBA_USUARIO = {
  nusuario: "admin",
  password: "sjrven123",
  nombre: "admin",
  descripcion: "admin",
  rol: 1,
  idioma: "es_CO",
  email: "usuario1@localhost",
  encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
  sign_in_count: 0,
  fechacreacion: "2014-08-05",
  fechadeshabilitacion: nil
}

# Usuario operador para ingresar y hacer pruebas
PRUEBA_USUARIO_OP = {
  nusuario: "operador",
  password: "sjrcol123",
  nombre: "operador",
  descripcion: "operador",
  rol: 5,
  idioma: "es_CO",
  email: "operador@localhost",
  encrypted_password: '$2a$10$uMAciEcJuUXDnpelfSH6He7BxW0yBeq6VMemlWc5xEl6NZRDYVA3G',
  sign_in_count: 0,
  fechacreacion: "2021-08-27",
  fechadeshabilitacion: nil
}


PRUEBA_GRUPOPER = {
  id: 1,
  nombre: 'grupoper1'
}

PRUEBA_ORGSOCIAL = {
  id: 1,
  grupoper_id: 1,
  created_at: '2021-08-27',
  updated_at: '2021-08-27'
}

