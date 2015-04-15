# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


connection = ActiveRecord::Base.connection();

connection.execute(IO.read("../../db/datos-basicas.sql"));

# usuario sip, clave sip123
connection.execute("INSERT INTO usuario 
	(nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
	VALUES ('sip', 'sip@localhost', 
	'$2a$04$uLWQzmlDYEaegYs4brFVYeLN9FeIE6vAPQqp9HgbQDGLKOV9dXTK6',
	'', '2014-08-14', '2014-08-14', '2014-08-14', 1);")

