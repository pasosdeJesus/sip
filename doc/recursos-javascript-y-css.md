# Personalización de recursos javascript y css

Los espacios de nombres de los motores aislados dan varias ventajas a la hora de personalizar modelos, controladores y clases pues hay sobrecarga y orden en el llamado, pero en el caso de recursos javascript y CSS no contamos con ellos pues todos los recursos de los motores y la aplicación son cargados y ejecutados cuando se carga la aplicación.

Por esto sip y los motores descendientes tienen:
* motor.js que carga librerías pero no agrega eventos al DOM
* application.js que carga las librerías y agrega eventos al DOM

motor.js incluye el método mimotor_prepara_eventos comunes que es llamado (por ejemplo por application.js) para asociar elementos al DOM.

Una aplicación que descienda de varios motores que usen esta convención debe cargar solo el application.js de uno de los motores, o bien cargar varios motor.js de varios motores y por su cuenta agregar eventos al DOM.
