# Tablas incluidas y modelo entidad asociación

A continuación se presenta el modelo entidad-asociación de las tablas de sip:
![Modelo Entidad Asociación](https://github.com/pasosdeJesus/sip/raw/master/doc/erd.png)

Esta imagen está en el directorio `doc` de las fuentes. Se generó con graphviz y `rails-erd`. En adJ, usted puede instalar `graphviz` con:
```sh
doas pkg_add graphviz
```
Y desde las fuentes de sip puede generar/actualizar con:
```sh
bundle
make erd
```

Podríamos dividir las tablas en grandes bloques así (tener en cuenta que todas tienen el prefijo ```sip__``` que a continuación se omite):
- Ubicación geográfica: pais, departamento, municipio, clase, tclase (tipo de clase), ubicacion, tsitio (tipo de sitio).
- Vista auxiliar: mundep.
- Personas y relaciones entre personas: persona, trelacion (tipo de relación entre personas), persona_trelacion.
- Grupos de personas, actores sociales y relación de una persona con un actor social: grupoper, actorsocial, sectoractor, actorsocial_sectoractor, perfilactorsocial, actorsocial_persona.
- Control de Acceso: usuario, grupo, grupo_usuario.
- Anexos: anexo.
- Miscelanea: etiqueta, fuenteprensa, tdocumento (tipo de documento) y oficina.
