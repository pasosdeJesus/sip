* La plataforma principal de desarrollo y de producción es adJ
  reciente, ver descripción en: 
	https://github.com/pasosdeJesus/sip/wiki/Requisitos
  Por eso después de hacer cambios sugerimos que en esa platafoma
  ejecute las pruebas de regresión para asegurar que pasan.
  Suele bastar desde el directorio de la aplicación (o si es un motor
	desde test/dummy):
```sh
	bin/rails test
```
El archivo README.md incluye varias banderas que queremos dejar en buen estado:
1. Que pase pruebas en plataforma de integración continúa.  Agradecemos servicio a Semaphore y Travis
2. Buen porcentaje de mantenibilidad y de cobertura. Agradecemos servicio a codeclimate.
3. No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en Hakiri (a quien agradecemos por el servicio de auditoria).

