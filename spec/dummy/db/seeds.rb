# encoding: UTF-8
#
# Este archivo debe contener todas las creaciones de registros
# necesarias para alimentar la base de datos con sus valores por defecto.
# Los datos puede cargarse con la tarea rake db:seed (o creados junto
# con la tarea db:setup).
#
# Ejemplos:
#
#   ciudades = Ciudad.create([{ name: 'Chia' }, { name: 'Cúcuta' }])
#   Alcalde.create(name: 'Emanuel', ciudad: ciudades.first)

conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, '../..', :datos)

# usuario sip, clave sip123
conexion.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('sip', 'sip@localhost', 
	'$2a$04$uLWQzmlDYEaegYs4brFVYeLN9FeIE6vAPQqp9HgbQDGLKOV9dXTK6',
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")

