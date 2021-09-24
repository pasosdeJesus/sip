Una tabla asociativa (que tambien hemos llamado tabla combinada o tabla unión) permite asociar dos o más tablas en una relación muchos a muchos. 

# 1. Tabla asociativa sólo con las llaves foráneas de las tablas que asocia

Si la tabla asociativa no va a tener información adicional a las llaves foráneas de las tablas que asocia y si en la vista se desea presentar como un
cuadro de selección (o tal vez cajas de chequeo), lo más recomendable con rails sería crear una tabla sin campo `id` ni marcas de tiempo pero para evitar duplicaciones es importante agregarle como llave primaria la combinación de las llaves foráneas.``

El ejemplo de usuarios y permisos de https://es.wikipedia.org/wiki/Entidad_asociativa se podría implementar (agregando campo id a las tablas Usuarios y Permisos) con:
```
$ bin/rails g migration CreateUsuarios LoginUsuario:string:50 ContrasenaUsuario:string:50 NombreUsuario:string:50
$ bin/rails g migration CreatePermisos LlavePermiso:string:50 DescripcionPermiso:string:500 NombreUsuario:string:50
```

Por ejemplo la primera crearía una migración con un nombre como `20210924144641_create_usuarios.rb`:
```rb
class CreateUsuarios < ActiveRecord::Migration[6.1]                         
  def change                                                                     
    create_table :usuarios do |t|                                          
      t.string :LoginUsuario                                                     
      t.string :ContrasenaUsuario                                                
      t.string :NombreUsuario                                                    
                                                                                 
      t.timestamps                                                               
    end                                                                          
  end                                                                            
end       
```
Y al correrse la migración con `bin/rails db:migrate` crearía una tabla:
```
CREATE TABLE IF NOT EXISTS "usuarios" (
  "id" integer PRIMARY KEY AUTOINCREMENT NOT NULL, 
  "LoginUsuario" varchar, "ContrasenaUsuario" varchar, "NombreUsuario" varchar, "created_at" datetime(6) NOT NULL, "updated_at" datetime(6) NOT NULL);
```

Y la tabla combinada que referenciaría los campos id de Usuarios y Permisos con:

bin/rails CreateJoinTableUsarioPermisos Usuarios Permisos


Si la tabla asociativa va a tener información adicional es recomendable crearla como una tabla típica con llave primaria id, y referencias a las tablas que asocia.
