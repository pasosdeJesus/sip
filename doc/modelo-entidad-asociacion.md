# Tablas incluidas y modelo entidad asociación

A continuación presentamos el modelo entidad-asociación de las tablas de sip:
![Modelo Entidad Asociación](https://raw.githubusercontent.com/pasosdeJesus/sip/main/doc/erd.png)

Esta imagen está en el directorio `doc` de las fuentes. Se generó con 
`graphviz` y `rails-erd`. En adJ, puedes instalar `graphviz` con:
```sh
doas pkg_add graphviz
```
Y desde las fuentes de sip puedes generar/actualizar con:
```sh
bundle
make erd
```

Podríamos dividir las tablas en grandes bloques así (tener en cuenta que todas tienen el prefijo ```sip__``` que a continuación se omite):
- Ubicación geográfica: pais, departamento, municipio, clase, tclase (tipo de 
  clase), ubicacion, tsitio (tipo de sitio).
- Vista auxiliar: mundep.
- Personas y relaciones entre personas: persona, trelacion (tipo de relación 
  entre personas), persona_trelacion.
- Grupos de personas, organizaciones sociales y relación de una persona con 
  una organización social: grupoper, orgsocial, sectororgsocial, 
  orgsocial_sectororgsocial, perfilorgsocial, orgsocial_persona. 
  Suponemos que una organización social es "un grupo de personas 
  que interactúan entre si, en virtud de que mantienen determinadas 
  relaciones sociales con el fin de obtener ciertos objetivos",  definición 
  de Méndez, J., F. Monroy y S. Zorrilla. (1993). Las organizaciones 
  sociales: conceptos básicos. En Dinámica social de las organizaciones 
  (pp. 73-105). México: McGraw-Hill.
  <http://biblioteca.udgvirtual.udg.mx/jspui/bitstream/123456789/2880/1/Las%20organizaciones%20sociales%20conceptos%20b%C3%A1sicos.pdf>
- Control de Acceso: usuario, grupo, grupo_usuario.
- Anexos: anexo.
- Tema: tema
- Miscelanea: etiqueta, fuenteprensa, tdocumento (tipo de documento) y oficina.
