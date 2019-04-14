

## Para contribuir al desarrollo del Motor para Sistemas de Información estilo Pasos de Jesus ##

Para realizar contribuciones de desarrollo al motor Sip, desarrollado en versión Adj de openbsd, escrito en lenguaje Ruby on Rails, bifurque las fuentes del Motor Sip en su cuenta de Github en el repositorio (https://github.com/pasosdeJesus/sip).

Se recomienda realizar actulaizaciones regulares de las gemas del Motor Sip y de sus dependencias para usar la versión más reciente. 

Requisitos

Ver https://github.com/pasosdeJesus/sip/wiki/Requisitos


Se recomienda que después de hacer cambios ejecute en la plataforma ejecute las pruebas de regresión para asegurar que pasan.

Suele bastar desde el directorio de la aplicación (o si es un motor
	desde test/dummy):
```sh
	bin/rails test
```
* El archivo README.md incluye varias banderas que queremos dejar en buen estado:
  1. Que pase pruebas en plataforma de integración continúa.  Agradecemos servicio a Semaphore y Travis
  2. Buen porcentaje de mantenibilidad y de cobertura. Agradecemos servicio a codeclimate.
  3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en Hakiri (a quien agradecemos por el servicio de auditoria).
  1. Que pase pruebas en plataforma de integración continúa. Agradecemos servicio a _Semaphore_ y _Travis_.
  2. Alto porcentaje de mantenibilidad y cobertura. Agradecemos servicio a _Codeclimate_.
  3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en _Hakiri_ (al cual agradecemos por el servicio de auditoría).

