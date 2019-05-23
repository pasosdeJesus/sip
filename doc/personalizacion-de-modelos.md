# Personalización de modelos

Casi todos están en el espacio de nombres ```Sip``` excepto ```usuario``` y ```ability``` (usados por Devise y CanCan sin espacio de nombres).  Por esto se usan 2 técnicas para personalizar modelos:

### Mixins

Se usa con todas las tablas en espacio de nombres ```sip_```, por lo cual se definen de verdad en ```lib/sip/concerns/models``` y en ```app/models/sip``` sólo  se incluyen.  

Si motores descendientes de ```sip``` deben modificarlos, se espera que usen la misma técnica, recordando que ```concerns/models/mimodelo``` puede incluir el módulo de sip ubicado en ```lib/sip/concerns/models/mimodelo```.   Ver por ejemplo https://github.com/pasosdeJesus/sivel2_gen/blob/master/lib/sivel2_gen/concerns/models/etiqueta.rb

Una aplicación que requiera modificar uno de estos modelos tiene dos posibilidades: (1) Crear un decorador en ```app/decorators/sip/mimodelo.rb``` o (2) definir la clase nuevamente en ```app/models/sip/mimodelo.rb``` e incluir el módulo de sip ubicado en ```lib/sip/concerns/models/mimodelo```.      Por uniformidad y para facilitar la conversión de aplicaciones en motores preferimos el segundo método.

Las tablas básicas no requieren que se definan vistas, sino que su modelo incluya ```Sip::Basica``` y que su  controlador sea descendiente de ```Sip::Admin::BasicasController```, ver [Tablas Básicas] (https://github.com/pasosdeJesus/sip/blob/master/doc/tablas-basicas.md)

### Tablas unión
Las tablas unión que rails genera no tienen llave primaria simple (es compuesta), por eso no debe llamarse el método destroy en objetos de esta.

Por lo mismo las asociaciones (e.g has_many) que se definan a estas tablas en los modelos de otras tablas (las que se unen) deben usar ```dependent: delete_all``` en lugar de ```dependent: destroy```

### Herencia con ```ability``` y ```usuarios```

Por si se quiere usar el método de mixins, al igual que en otros modelos se definen ```lib/sip/concerns/models/{ability,usuario}.rb``` y en ```app/models/sip/{ability,usuario}.rb``` sólo se incluyen.   Las vistas de usuario se definen en ```app/views/sip/usuarios,``` incluyendo una vista parcial ```_usuario.html.erb```

En motores descendientes podría usarse la misma técnica, pero es más breve definir ```app/models/mimotor/{ability,usuario}.rb``` como clases descendientes de Sip::Ability y Sip::Usuario respectivamente y personalizar.  Pueden personalizarse las vistas de usuarios redefiniéndolas en ```app/views/mimotor/usuarios```, puede aprovechar la vista parcial, como se hace en https://github.com/pasosdeJesus/cor1440_gen/tree/master/app/views/cor1440_gen/usuarios

Se espera que las aplicaciones creen ```app/models/ability.rb``` y  ```app/models/usuario.rb``` que hereden respectivamente de Sip::Ability y Sip::Usuario (o sus equivalentes en otros motores descendientes de sip, como por ejemplo https://github.com/pasosdeJesus/cor1440/blob/master/app/models/ability.rb y https://github.com/pasosdeJesus/cor1440/blob/master/app/models/usuario.rb ).

En la tabla usuario no puede sobrecargarse la validación de mínima longitud, por lo que se ha introducido la constante  ```longitud_nusuario``` en ```lib/sip/engine.rb``` (inicialmente en valor 15) que una aplicación puede sobrecargar en ```config/initializers/sip.rb```  (ver por ejemplo <https://github.com/pasosdeJesus/sal7711_cinep/blob/master/config/initializers/sip.rb.plantilla> ).

Una convención respecto a permiso de ingresar a la página principal por parte de un usuario autenticado es que tenga la habilidad de CanCan ```:contar,  Sip::Ubicacion``` Por esto en motores que sobrecargen la función ```initialize``` de ```ability.rb``` debe asegurarse de permitir esta operación a todos los usuarios:
```
  can :contar, Sip::Ubicacion
```
