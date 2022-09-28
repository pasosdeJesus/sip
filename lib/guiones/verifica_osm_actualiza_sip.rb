#!/usr/bin/env ruby $@
# Verifica departamentos en OSM (generando un Markdown) y de requerirse 
# propone actualizaciones para base de datos de sip
# La opción -n evita que se descarguen las siluetas del país y 
# de los departamentos de osm-boundaries.com y que se comparen con los de
# la base de datos y en tal caso usa las que ya estén en base de datos.

# Validaciones para departamentos de 
# https://maproulette.org/challenge/28768
# Agradecimientos a Andres Gomez Casanova usuario @AngocA de OpenStreetMap
# por haber escrito esas instructivas validaciones.

require 'zlib'
require 'stringio'

descargar = true
opcion = ARGV[0]
if opcion.to_s == '-n'
  descargar = false
end

puts "Verificación de Colombia y departamentos en OSM de acuerdo a https://maproulette.org/challenge/28768"
puts "Fecha de la verificación: #{Date.today.to_s}"

# En variable de ambiente OSMBOUNDARIES_LLAVE manejadas en archivo .env
# ponga su llave de osm-boundaries.com
llave_osmboundaries = ENV.fetch('OSMBOUNDARIES_LLAVE')

# Tabla temporal para mantener relaciones descargadas de OSM
ActiveRecord::Base.connection.execute (
      "CREATE TABLE IF NOT EXISTS osm_relacion ( "\
      "  id INTEGER,"\
      "  geom Geometry"\
      ");"
)

# Carga una serie de relaciones de osm-boundaries.com usando la llave dada
# las almacena en la tabla osm_relacion y las retorna como un Hash
#
# @params llave_osmboundaries Llave en osm-boundaries.com
# @params osm_ids Identificaciones de relaciones en OSM
# @params version Versión de datos de osm-boundaries.com
# @return Hash con entradas de la forma id=>geometria donde cada id 
#         corresponde a uno de osm_ids
def carga_relaciones_osm(llave_osmboundaries, osm_ids, version="osm20220808")
  ret = {}
  ids = osm_ids.map {|x| x>0 ? ("-" + x.to_s) : x.to_s}.join(',')
  url= "https://osm-boundaries.com/Download/Submit"\
    "?apiKey=#{llave_osmboundaries}&db=#{version}&osmIds=#{ids}"\
    "&format=EWKB&srid=4326&landOnly"
  STDERR.puts "OJO url=#{url}"
  # e.g https://osm-boundaries.com/Download/Submit?apiKey=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&db=osm20220808&osmIds=-1303962,-1315120,-1388045,-2181889,-1315209,-12893646,-1316581,-1390144,-396705,-1394843,-1392025,-1392085,-1317223,-1322131,-1305533,-1321032,-1385038,-1380540,-1396291,-1321379,-1319097,-1305166,-1380130,-1324192,-1375357,-1331230,-1374221,-1372374,-1320759,-1309495,-1322825,-1359366,-1357098&format=EWKB&srid=4326&landOnly

  uri = URI.parse(url)
  h = uri.read
  gz = Zlib::GzipReader.new(StringIO.new(h))
  des = gz.read
  ewkb = JSON.parse(des)

  if (ewkb.class != Array || ewkb[0].class != Hash ||
      ewkb[0]["osm_id"].class != Integer ||
      ewkb[0]["geom"].class != String ) 
    STDERR.puts "Debería ser un archivo JSON EWKB"
    exit(1)
  end

  ewkb.each do |unarel|
    id = unarel["osm_id"]
    if (id < 0) 
      id = id*-1
    end
    g = unarel["geom"]
    if (g[0] != '\\' || g[1] != 'x') 
      STDERR.puts "Atributo geom no tiene sintaxis esperada"
      exit(1)
    end
    ret[id] = g[2..-1]

    ActiveRecord::Base.connection.execute (
      "DELETE FROM osm_relacion WHERE id=#{id}"
    )
    ActiveRecord::Base.connection.execute (
      "INSERT INTO osm_relacion (id, geom) "\
      "VALUES (#{id}, ST_Multi('#{ret[id]}'))"
    )
  end

  return ret
end


# Descarga y valida una vía
# @param ref Referencia a la vía
def valida_via(ref)
  url= "https://www.openstreetmap.org/api/0.6/way/#{ref}.json"
  uri = URI.parse(url)
  h = uri.read
  rel = JSON.parse(h)
  elem = rel['elements'][0]
  tags = elem['tags']
  if !tags
    puts "** La vía <https://www.openstreetmap.org/way/#{ref} "\
      "no tiene etiquetas"
  else 
    if !tags['name']
      puts "** La vía <https://www.openstreetmap.org/way/#{ref} "\
        "no tiene etiqueta `name`"
    end
    if (tags.keys.select {|l| l[0..4] == 'name:'}.count > 0 &&
        !tags['name:es'])
      puts "** La vía <https://www.openstreetmap.org/way/#{ref} "\
        "requiere etiqueta `name:es`"
    end
    [
      'mechanical', 'ref', 'state_capital', 'state_code'
    ].each do |t|
      if tags[t]
        puts "** En la vía <https://www.openstreetmap.org/way/#{ref} "\
          " sobra etiqueta `#{t}`"
      end
    end
  end
end


# Descarga y valida un nodo rotulo (label)
# @param id Identificación del nodo
# @param nombre Identificación del nodo
def valida_nodo_rotulo(id, nombre)
  url= "https://www.openstreetmap.org/api/0.6/node/#{id}.json"
  uri = URI.parse(url)
  h = uri.read
  rel = JSON.parse(h)
  elem = rel['elements'][0]
  tags = elem['tags']
  if !tags
    puts "** El nodo rótulo (label) "\
      "<https://www.openstreetmap.org/nodo/#{id}> "\
      "no tiene etiquetas"
  else 
    if tags['name'].to_s != nombre
      puts "** El nodo rótulo (label) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        "debería tener etiqueta `name` -> `#{nombre}`"
    end
    if (tags.keys.select {|l| l[0..4] == 'name:'}.count > 0 &&
        !tags['name:es'])
      puts "** El nodo rótulo (label) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        "requiere etiqueta `name:es`"
    end
    if tags['place'].to_s != 'state'
      puts "** El nodo rótulo (label) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        "debería tener etiqueta `place` -> `state`"
    end
  end
end

# Descarga y valida un nodo centro administrativo (admin_centre)
def valida_nodo_centro_adminsitrativo(id)
  url= "https://www.openstreetmap.org/api/0.6/node/#{id}.json"
  uri = URI.parse(url)
  h = uri.read
  rel = JSON.parse(h)
  elem = rel['elements'][0]
  tags = elem['tags']
  if !tags
    puts "** El nodo centro administrativo (admin_centre) "\
      "<https://www.openstreetmap.org/nodo/#{id}> "\
      "no tiene etiquetas"
  else 
    if !tags['name']
      puts "** El nodo centro administrativo (admin_centre) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        "debería tener etiqueta `name`"
    end
    if (tags.keys.select {|l| l[0..4] == 'name:'}.count > 0 &&
        !tags['name:es'])
      puts "** El nodo centro administrativo (admin_centre) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        " requiere etiqueta `name:es`"
    end
    if tags['place'].to_s != 'city'
      puts "** El nodo centro administrativo (admin_centre) "\
        "<https://www.openstreetmap.org/nodo/#{id}> "\
        "debería tener etiqueta `place` -> `city`"
    end
  end
end


col = Sip::Pais.find(170)
if descargar
  silueta_col = carga_relaciones_osm(llave_osmboundaries, [col.osm_id])[col.osm_id]
end
r = ActiveRecord::Base.connection.execute (
  "SELECT ST_Equals(geom, p.osm_frontera::geometry) AS ig "\
  "  FROM osm_relacion AS o"\
  "  JOIN sip_pais AS p ON p.osm_id=o.id WHERE o.id=#{col.osm_id}")
if !r[0]["ig"]
  STDERR.puts "Diferencia entre silueta de OSM y la de sip"
  if descargar
    STDERR.puts "  UPDATE sip_pais SET "\
      "    osm_frontera='#{silueta_col[col.osm_id].upcase}', "\
      "    osm_fecha='#{Date.today}', "\
      "    WHERE id=170;"
  end
end

r = ActiveRecord::Base.connection.execute (
  "SELECT ST_ISVALID(geom) FROM osm_relacion "\
  "  WHERE id=#{col.osm_id}"
)
if !r[0]["st_isvalid"]
  puts "* La silueta de Colombia "\
    "<https://www.openstreetmap.org/relation/#{dep.osm_id}>"\
    "no es válida (no es cerrada o se autointersecta)"
end

if Sip::Departamento.where(id_pais: 170).where(osm_id: nil).count > 0 then
  STDERR.puts "Falta osm_id en departamentos: " +
    Sip::Departamento.where(id_pais: 170).where(osm_id: nil).
    pluck(:nombre).join(', ')
end

siluetas_deps = nil
deps = Sip::Departamento.where(id_pais: 170).where.not(osm_id: nil)
osm_ids = deps.pluck(:osm_id)
if descargar
  siluetas_deps = carga_relaciones_osm(llave_osmboundaries, osm_ids)
end

deps.each do |dep|
  puts "* Verificando #{dep.nombre} "\
    "<https://www.openstreetmap.org/relation/#{dep.osm_id}>"
  r = ActiveRecord::Base.connection.execute (
    "SELECT ST_Equals(geom, d.osm_frontera::geometry) AS ig "\
    "  FROM osm_relacion AS o"\
    "  JOIN sip_departamento AS d ON d.osm_id=o.id WHERE o.id=#{dep.osm_id}")
  if !r[0]["ig"]
    STDERR.puts "Diferencia en silueta de OSM y de sip"
    if descargar
        STDERR.puts "  UPDATE sip_departamento SET "\
        "    osm_frontera=ST_Multi('#{siluetas_dep[dep.osm_id]}'), "\
        "    osm_fecha='#{Date.today.to_s}' "\
        "    WHERE id=#{dep.id};"
    end
  end
  r = ActiveRecord::Base.connection.execute (
    "SELECT ST_ISVALID(geom) FROM osm_relacion "\
    "  WHERE id=#{dep.osm_id}"
  )
  if !r[0]["st_isvalid"]
    puts "* La silueta no es válida (no es cerrada o se autointersecta)"
  end

  url= "https://www.openstreetmap.org/api/0.6/relation/#{dep.osm_id}.json"
  uri = URI.parse(url)
  h = uri.read
  rel = JSON.parse(h)
  elem = rel['elements'][0]
  tags = elem['tags']
  if (tags['admin_level'].to_s != '4') 
    puts "** No tiene etiqueta `admin_level` -> `4`"
  end
  if (tags['boundary'].to_s != 'administrative') 
    puts "** No tiene etiqueta `boundary` -> `administrative`"
  end
  if (tags['type'].to_s != 'boundary') 
    puts "** No tiene etiqueta `type` -> `boundary`"
  end
  if (tags['divipola'].to_s.to_i != dep.id_deplocal)
    puts "** No tiene etiqueta `divipola` -> `#{dep.id_deplocal}`"
  end
  if (tags['ISO3166-2'].to_s != dep.codiso) 
    puts "** Tiene mal la etiqueta `ISO3166-2` que es "\
      "`#{tags['ISO3166-2'].to_s}` pero que debería ser `#{dep.codiso}`"
  end
  if (tags.keys.select {|l| l[0..4] == 'name:'}.count > 0 &&
      !tags['name:es'])
    puts "** Requiere etiqueta `name:es`"
  end
  if (!tags['wikipedia'])
    puts "** No tiene etiqueta `wikipedia`"
  end

  [
    'clc_file', 'DANE:departamento', 'mechanical', 'ref', 'state_code'
  ].each do |t|
    if tags[t]
      puts "** Le sobra etiqueta `#{t}`"
    end
  end

  isin = tags.keys.select {|l| l[0..5] == 'is_in:'}
  if (isin.count > 0)
    puts "** Le sobra(n) etiqueta(s) `#{isin.join(',')}`"
  end

  if tags['name'].to_s != dep.nombre && 
      tags['official_name'] != dep.nombre
    puts "** Tiene mal etiqueta `name` o bien etiqueta `official_name` "\
      "pues la primera o en su defecto la segunda deben ser "\
      "el nombre en la DIVIPOLA es decir `#{dep.nombre}`"
  end

  nca = elem['members'].select{ 
    |m| m['type'] == 'node' && m['role'] == 'admin_centre'
  }
  if nca.count != 1
    puts "** No tiene un miembro admin_centre (centro administrativo)"
  else
    valida_nodo_centro_adminsitrativo(nca[0]['ref'])
  end

  nr = elem['members'].select{
    |m| m['type'] == 'node' && m['role'] == 'label'
  }
  if nr.count != 1
    puts "** No tiene un miembro label (rótulo)"
  else
    valida_nodo_rotulo(nr[0]['ref'], dep.nombre)
  end

  elem['members'].select{|m| 
    m['type'] == 'way'
  }.each do |m|
    valida_via(m['ref'])
  end


end
