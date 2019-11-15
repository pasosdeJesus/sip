No seguimos las reglas de rails de mantener todo en inglés ni de
modelos en singular
 
Preferimos nombres en español
Preferimos modelos en singular, pero controladores en plural.

Estamos usando reglas globales de inflección de singular a plural
en español, como se configuran en sip/config/initializers/inflections.rb

En cada motor y aplicación se amplian en config/initializes/inflections.rb

Si no se dejan reglas en sip sino digamos en sivel2_gen
puede ocurrir cosas como estas:
De sip:  'actorsocial'.pluralize -> 'actorsociales'
De heb412_gen: 'plantillahcm'.pluralize -> "plantillahcm"
De mr519_gen: 'valorcampo'.pluralize -> 'valorescampo' pero 'encuestapersona'.pluralize -> 'encuestapersonas' y 'opcioncs'.pluralize => 'opcioncses'
De cor1440_gen: 'campotind'.pluralize -> "campotindes" pero 'sectoractor'.pluralize -> 'sectoresactores'

En algunas versiones de rails esos archivos de inflecciones se
cargan en el orden de dependencia, pero cuando esto no ocurre 
o si prefiere cambiarse (digamos dejand primero sip, despues mr519_gen,
después cor1440_gen y despues las del archivo:

['sip', 'mr519_gen', 'cor1440_gen'].each do |nomm|
  require File.join(
    Gem::Specification.find_by_name(nomm).gem_dir, 
    'config/initializers/inflections')
end

