## Información dedicada a contribuidores ##
Es posible acceder como contribuidor de la fuente del motor SIP realizando un 'fork' en el proyecto (https://github.com/pasosdeJesus/sip) desde su cuenta de github.

Para contribuir en el desarrollo de la plataforma SIVeL2 considere los siguientes aspectos para el motor SIP:

* Durante su desarrollo de contribución actualice constantemente las dependencias de SIVeL para usar siempre la versión mas actualizada del motor que puede incluir también librerías actualizadas. 

* La plataforma principal de desarrollo y de producción es adJ (Contribución de OpenBSD) ver descripción en: 
	https://github.com/pasosdeJesus/sip/wiki/Requisitos
  
  Por eso después de hacer cambios sugerimos que en esa platafoma
  ejecute las pruebas de regresión para asegurar que pasan.

  Suele bastar desde el directorio de la aplicación (o si es un motor
	desde test/dummy):
```sh
	bin/rails test
```
* El archivo README.md incluye varias banderas que queremos dejar en buen estado:
  1. Que pase pruebas en plataforma de integración continúa. Agradecemos servicio a _Semaphore_ y _Travis_.
  2. Alto porcentaje de mantenibilidad y cobertura. Agradecemos servicio a _Codeclimate_.
  3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en _Hakiri_ (al cual agradecemos por el servicio de auditoría).


