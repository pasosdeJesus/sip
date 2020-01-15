
# 1. Lineamientos generales en sip y motores descendientes de Pasos de Jesús

No seguimos las reglas de rails de mantener todo en inglés ni de
modelos en singular
 
Preferimos nombres en español

Preferimos modelos en singular, pero controladores en plural.

# 2. Mezcla de las reglas entre diversos motores de una aplicación

Estamos usando reglas sin locale de inflección de singular a plural
en español, como se configuran en 
<https://github.com/pasosdeJesus/sip/blob/master/config/initializers/inflections.rb>.
Además en ese mismo archivo se dejan las reglas generales del español con expresiones 
regulares.

En cada motor y aplicación se amplian en `config/initializes/inflections.rb`

Si no se dejan reglas general del español con expresiones regulares en `sip` sino digamos en 
`sivel2_gen` pueden ocurrir cosas como estas:
* De sip:  'actorsocial'.pluralize -> 'actorsociales'
* De heb412_gen: 'plantillahcm'.pluralize -> "plantillahcm"
* De mr519_gen: 'valorcampo'.pluralize -> 'valorescampo' pero 
  'encuestapersona'.pluralize -> 'encuestapersonas' y 
  'opcioncs'.pluralize => 'opcioncses'
* De cor1440_gen: 'campotind'.pluralize -> "campotindes" pero 
 'sectoractor'.pluralize -> 'sectoresactores'

En algunas versiones de rails esos archivos de inflecciones se
cargan en el orden de dependencia, pero cuando esto no ocurre 
es posible cambiarlo como en el siguiente ejemplo que podría ponerse
en el archivo `config/initializers/inflections.rb`  para dejar 
primero `sip`, despues `mr519_gen`, después `cor1440_gen` y despues 
las del archivo:

```rb
['sip', 'mr519_gen', 'heb412_gen', 'cor1440_gen', 'sal7711_gen', 'sal7711_web',
 'sivel2_gen', 'sivel2_sjr'].each do |s|
  byebug
  require_dependency File.join(Gem::Specification.find_by_name(s).gem_dir,
                             '/config/initializers/inflections.rb')
end
```


# 3. Orden de las reglas en un archivo 

Es ideal ponerlas en orden alfabético, sin embargo hemos notado que las reglas irregulares se usan como si fuesen
postfijos, es decir si se tiene la regla:
```
inflect.irregular 'zrc', 'zrcs'
```

Se tendrá

 `'zrc'.pluralize => 'zrcs'`, pero también `'estadozrc'.pluralize => 'estadozrcs'` 
 aún si se pone una regla 
```
inflect.irregular 'estadozrc', 'estadoszrc'
```

Para que tome esta última regla debe ponerse su definición después de la de `zrc`.

Así que ese archivo debe ordenarse de manera alfabetica, pero si hay posfijos repetidos por longitud (primero los de menor longitud).
