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
#
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

PRUEBA_UBICACIONPRE= {
  pais_id: 100, # BULGARIA
  departamento_id: 20,
  municipio_id: nil,
  clase_id: nil,
  nombre: 'IMAGINA / BULGARIA',
  latitud: 0.1,
  longitud: 0.2,
  nombre_sin_pais: 'IMAGINA'
}

PRUEBA_CLASE= {
  id: 100000,
  nombre: "CLASE1",
  latitud: 1.5,
  longitud: 1.5,
  fechacreacion: "2014-08-04",
  fechadeshabilitacion: "2014-08-04",
  id_municipio: 1,
  id_tclase: 'CAS'
}

PRUEBA_ANEXO= {
  descripcion: 'x',
  fecha: "2014-11-11",
  created_at: "2014-11-11"
}

PRUEBA_BITACORA = {
  fecha: '2020-03-19',
  ip: "192.168.1.1",
  usuario_id: nil,
  url: 'http://example.com/',
  params: '',
  modelo: 'Sip::Persona',
  modelo_id: 1,
  operacion: 'actualiza',
  detalle: 'detalle'
}

PRUEBA_DEPARTAMENTO= {
  id: 1000,
  nombre: "DEPARTAMENTO1",
  latitud: 1.5,
  longitud: 1.5,
  fechacreacion: "2014-08-04",
  fechadeshabilitacion: nil,
  id_pais: 862
}

PRUEBA_ETIQUETA= {
  id: 1000,
  nombre: "Eti",
  observaciones: "O",
  fechacreacion: "2014-09-04",
  created_at: "2014-09-04"
}

PRUEBA_FUENTEPRENSA= {
  id: 1000 ,
  nombre: "Fuenteprensa",
  fechacreacion: "2015-05-11",
  created_at: "2015-05-11"
}

PRUEBA_GRUPO= {
  id: 1000  ,
  nombre: "GRUPO1",
  fechacreacion: "2017-04-13",
}

PRUEBA_MUNICIPIO= {
  id: 100000,
  nombre: "MUNICIPIO1",
  latitud: 1.5,
  longitud: 1.5,
  fechacreacion: "2014-08-04",
  fechadeshabilitacion: "2014-08-04",
  id_departamento: 1 ,
}

PRUEBA_OFICINA= {
  id: 1000 ,
  nombre: "Ofi",
  observaciones: 'Ofi',
  fechacreacion: "2015-04-16",
  created_at: "2015-04-16",
}

PRUEBA_PAIS= {
  id: 1000  ,
  nombre: "PASI1",
  nombreiso: "PAIS1",
  fechacreacion: "2014-08-04",
}

PRUEBA_PERFILORGSOCIAL= {
  id: 1000  ,
  nombre: "PERFILORGSOCIAL1",
  fechacreacion: "2018-07-24",
}

PRUEBA_PERSONA= {
  nombres: "Nombres",
  apellidos: "Apellidos",

  anionac: 1980,
  mesnac: 2,
  dianac: 2,
  sexo: "M",
  numerodocumento: "1061000000",
}

PRUEBA_TDOCUMENTO= {
  id: 1000 ,
  nombre: "Tdocumento",
  formatoregex: "[0-9]*",
  fechacreacion: "2014-09-22",
  created_at: "2014-09-22"
}

PRUEBA_SECTORORGSOCIAL = {
  nombre: "Nombre sector",
  observaciones: "x",
  fechacreacion: '2018-07-20'
}

PRUEBA_TCLASE= {
  id: 'x' ,
  nombre: "TX",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_TRELACION= {
  id: 'NN',
  nombre: "Trelacion",
  inverso: 'NN',
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_TRIVALENTE = {
  nombre: "Trivalente",
  fechacreacion: "2019-08-17",
  created_at: "2019-08-17"
}

PRUEBA_TSITIO= {
  id: 1000 ,
  nombre: "Tsitio",
  fechacreacion: "2014-09-09",
  created_at: "2014-09-09",
}

PRUEBA_UBICACION= {
  id_tsitio: 1,
  id_pais: 862, # VENEZUELA
  id_departamento: 1, # DISTRITO CAPITAL
  id_municipio: 25, # BOLIVARIANO LIBERTADOR
  id_clase: 217, # CARACAS
  created_at: "2014-11-06",
}

