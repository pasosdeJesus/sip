#!/usr/bin/env ruby
# Verifica departamentos en OSM y actualiza lo que tenemos en sip
# https://maproulette.org/challenge/28768


require 'zlib'
require 'stringio'

# En variable de ambiente OSMBOUNDARIES_LLAVE manejadas en archivo .env
# ponga su llave de osm-boundaries.com
llave_api = ENV.fetch('OSMBOUNDARIES_LLAVE')

# Carga una serie de relaciones de osm-boundaries.com usando la llave dada
# @params llave_api Llave en osm-boundaries.com
# @params osm_ids Identificaciones de relaciones en OSM
# @params version Versión de datos de osm-boundaries.com
# @return Hash con entradas de la forma id=>geometria donde cada id 
#         corresponde a uno de osm_ids
def carga_relaciones_osm(llave_api, osm_ids, version="osm20220808")
  ret = {}
  ids = osm_ids.map {|x| x>0 ? ("-" + x.to_s) : x.to_s}.join(',')
  url= "https://osm-boundaries.com/Download/Submit"\
    "?apiKey=#{llave_api}&db=#{version}&osmIds=#{ids}"\
    "&format=EWKB&srid=4326&landOnly"
  puts "OJO url=#{url}"
  # e.g https://osm-boundaries.com/Download/Submit?apiKey=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx&db=osm20220808&osmIds=-1303962,-1315120,-1388045,-2181889,-1315209,-12893646,-1316581,-1390144,-396705,-1394843,-1392025,-1392085,-1317223,-1322131,-1305533,-1321032,-1385038,-1380540,-1396291,-1321379,-1319097,-1305166,-1380130,-1324192,-1375357,-1331230,-1374221,-1372374,-1320759,-1309495,-1322825,-1359366,-1357098&format=EWKB&srid=4326&landOnly

  uri = URI.parse(url)
  h = uri.read
  gz = Zlib::GzipReader.new(StringIO.new(h))
  des = gz.read
  ewkb = JSON.parse(des)

  if (ewkb.class != Array || ewkb[0].class != Hash ||
      ewkb[0]["osm_id"].class != Integer ||
      ewkb[0]["geom"].class != String ) 
    puts "Debería ser un archivo JSON EWKB"
    exit(1)
  end

  ewkb.each do |unarel|
    id = unarel["osm_id"]
    if (id < 0) 
      id = id*-1
    end
    g = unarel["geom"]
    if (g[0] != '\\' || g[1] != 'x') 
      puts "Atributo geom no tiene sintaxis esperada"
      exit(1)
    end
    ret[id] = g[2..-1]
  end

  return ret
end

col = Sip::Pais.find(170)
fcol = carga_relaciones_osm(llave_api, [col.osm_id])[col.osm_id]
if (fcol.upcase != col.osm_frontera)
  puts "Cambio en frontera de Colombia"
  col.osm_frontera = fcol
  col.osm_fecha = Date.today
  col.save
end
r = ActiveRecord::Base.connection.execute (
  "SELECT st_isvalid(osm_frontera::geometry) FROM sip_pais "\
  "WHERE id=#{col.id}")
puts "Silueta de Colombia válida: #{r[0]["st_isvalid"]}"

if Sip::Departamento.where(id_pais: 170).where(osm_id: nil).count > 0 then
  puts "Falta osm_id en departamentos: " +
    Sip::Departamento.where(id_pais: 170).where(osm_id: nil).
    pluck(:nombre).join(', ')
end

# Tabla temporal
ActiveRecord::Base.connection.execute (
      "CREATE TABLE IF NOT EXISTS osm_relacion ( "\
      "  id INTEGER,"\
      "  geom Geometry"\
      ");"
)

deps = Sip::Departamento.where(id_pais: 170).where.not(osm_id: nil)
ids = deps.pluck(:osm_id)
siluetas = carga_relaciones_osm(llave_api, ids)
deps.each do |dep|
  puts "Analizando #{dep.nombre}"
  if (siluetas[dep.osm_id].upcase != dep.osm_frontera)
    puts "Cambio en frontera de #{dep.nombre}"
    r = ActiveRecord::Base.connection.execute (
      "UPDATE sip_departamento SET "\
      "osm_frontera=ST_Multi('#{siluetas[dep.osm_id]}'), "\
      "osm_fecha='#{Date.today.to_s}' "\
      "WHERE id=#{dep.id}"
    )
  end
  ActiveRecord::Base.connection.execute (
    "DELETE FROM osm_relacion WHERE id=#{dep.osm_id}"
  )
  ActiveRecord::Base.connection.execute (
    "INSERT INTO osm_relacion (id, geom) "\
    "VALUES (#{dep.osm_id}, ST_Multi('#{siluetas[dep.osm_id]}'))"
  )
  r = ActiveRecord::Base.connection.execute (
    "SELECT ST_ISVALID(geom) FROM osm_relacion "\
    "  WHERE id=#{dep.osm_id}"
  )
  puts "Silueta de #{dep.nombre} válida: #{r[0]["st_isvalid"]}"
  r = ActiveRecord::Base.connection.execute (
    "SELECT ST_Equals(geom, d.osm_frontera::geometry) AS ig "\
    "  FROM osm_relacion AS o"\
    "  JOIN sip_departamento AS d ON d.osm_id=o.id WHERE o.id=#{dep.osm_id}")
  puts "Iguales: #{r[0]["ig"]}"

  url= "https://www.openstreetmap.org/api/0.6/relation/#{dep.osm_id}.json"
  uri = URI.parse(url)
  h = uri.read
  rel = JSON.parse(h)
  elem = rel['elements'][0]
  tags = elem['tags']
  if (tags['admin_level'].to_s != '4') 
    puts " *** Departamento #{dep.osm_id} #{dep.nombre} no tiene "\
      " admin_level-> 4"
  end
  if (tags['boundary'].to_s != 'administrative') 
    puts " *** Departamento #{dep.osm_id} #{dep.nombre} no tiene "\
      "boundary -> adminsitrative"
  end
  if tags['name'].to_s != dep.nombre && 
      tags['official_name'] != dep.nombre
    puts " *** Departamento #{dep.osm_id} #{dep.nombre} tiene name y "\
      "official_name diferentes al del DIVIPOLA #{dep.nombre}"
  end

end
