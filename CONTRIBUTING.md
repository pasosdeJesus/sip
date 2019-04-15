# Contribucion.

Cuando contribuya a este repositorio, primero reporte el cambio que usted desea realizar via issues, correo, u otro medio a los dueños del repositorio antes de que se haga un cambio.

## Proceso de pull request.

1. Asegurarse de que algunas dependencias instaladas sean removidas en la capa en donde se realiza la compilacion. 
2. El archivo README.md incluye varias banderas que queremos dejar en buen estado:
- Que pase pruebas en plataforma de integración continúa. Agradecemos servicio a Semaphore y Travis
- Buen porcentaje de mantenibilidad y de cobertura. Agradecemos servicio a codeclimate.
- No deben haber fallas de seguridad y los falsos positivos deben marcarse como tales en Hakiri (a quien agradecemos por el servicio de auditoria).
3. Actualizar el archivo README.md cuando se incluyan nuevas variables de entorno, puertos expuestos y ubicaciones de archivos utiles.
4. Seguir el estandar de versionamiento usado en [SemVer](http://semver.org/).
5. Puede combinar el pull request una vez que tenga la aprobacion de otros dos desarrolladores, o si no tiene permiso para hacerlo, puede solicitar al segundo revisor que lo fusione por usted.

## Codigo de conducta.

### Estandares

La plataforma principal de desarrollo y de producción es adJ reciente, ver descripción en: https://github.com/pasosdeJesus/sip/wiki/Requisitos Por eso después de hacer cambios sugerimos que en esa platafoma ejecute las pruebas de regresión para asegurar que pasan. Desde el directorio de la aplicación (o si es un motor desde test/dummy) ejecutar:

```sh
  bin/rails test
```


### Nuestras responsabilidades

El personal que mantiene el proyecto es responsable de clarificar los estandares aceptables de comportamiento y deben tomar medidas apropiadas y correctivas en caso de algun comportamiento no permitido.

Tambien estan en el deber y responsabilidad de remover, editar o rechazar comentarios, commits, codigo, ediciones de la wiki, issues, y otras contribuciones que no estan alineadas al codigo de conducta.


