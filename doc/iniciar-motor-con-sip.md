# Iniciar un motor que use sip

# Iniciar el motor

Como se explica en {1}
```sh
rails plugin new mimotor --mountable --database=postgresql --skip-keeps
```

Pase al directorio mimotor y edite el archivo `mimotor.gemspec` para modificar  las descripciones que dicen TODO y agregar:
```ruby
s.add_dependency "sip"
```

Edite el archivo `Gemfile` y agregue las mismas gemas que requiere una aplicación que use sip (ver https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip )

Cree el archivo app/models/mimotor/ability.rb donde se configurará control de acceso, inicialmente con:
```ruby
# encoding: UTF-8
module Mimotor
  class Ability  < Sip::Ability

    BASICAS_PROPIAS = []

    def tablasbasicas
      Sip::Ability::BASICAS_PROPIAS +
        Mimotor::Ability::BASICAS_PROPIAS
    end
  end
end
```
# Verificar aplicación de prueba

Antes de comenzar a crear tablas básicas y otras tablas, es conveniente que vea corriendo la aplicación de prueba disponible en test/dummy para eso siga las instrucciones de https://github.com/pasosdeJesus/sip/wiki/Iniciar-un-sistema-de-informaci%C3%B3n-usando-Sip

En esas instrucciones tener en cuenta:

* Cuando cree `test/dummy/app/models/ability.rb` cambie
`class Ability  < Sip::Ability` por `class Ability  < Mimotor::Ability`
* Las semillas de la aplicación deberían incluir las de sip y las de su nuevo motor
`test/dummy/db/seeds.rb`:

```ruby
# encoding: UTF-8
conexion = ActiveRecord::Base.connection();

# De motores
Sip::carga_semillas_sql(conexion, 'sip', :datos)
motor = ['mimotor', '../..']
motor.each do |m|
    Sip::carga_semillas_sql(conexion, m, :cambios)
    Sip::carga_semillas_sql(conexion, m, :datos)
end

# Usuario para primer ingreso sip, sip
conexion.execute("INSERT INTO usuario 
  (nusuario, email, encrypted_password, password, 
  fechacreacion, created_at, updated_at, rol) 
  VALUES ('sip', 'sip@localhost', 
  '$2a$10$uPICXBx8K/csSb5q3uNsPOwuU1h.9O5Kj9dyQbaCy8gF.5rrPJgG.',
  '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
```

# Migraciones automáticas

Su motor puede tener migraciones, para aplicarlas en aplicaciones que usen el motor tiene al menos estas dos opciones:
1. Con una tarea (desde la aplicación tendría que ejecutarse algo como bin/rails mimotor:migraciones)
2. Que se apliquen automáticamente (desde la aplicación cuando se ejecute bin/rails db:migrate)

Para el segundo caso lo que debe hacer, como se explica en {2}, es agregar al archivo `lib/mimotor/engine.rb` las líneas:

```ruby
initializer :append_migrations do |app|
  unless app.root.to_s === root.to_s
    config.paths["db/migrate"].expanded.each do |expanded_path|
      app.config.paths["db/migrate"] << expanded_path
    end
  end
end
```


# Referencias
* {1} https://guides.rubyonrails.org/engines.html
* {2} http://pivotallabs.com/leave-your-migrations-in-your-rails-engines/
* {3} http://dhobsd.pasosdejesus.org/motores_rails.html
