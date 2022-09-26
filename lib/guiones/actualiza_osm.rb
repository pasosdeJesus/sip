require 'zlib'
require 'stringio'

llave_api = ENV.fetch('OSMBOUNDARIES_LLAVE')
col = Sip::Pais.find(170)
url= "https://osm-boundaries.com/Download/Submit?apiKey=#{llave_api}&db=osm20220808&osmIds=-#{col.osm_id}&format=EWKB&srid=4326"
uri = URI.parse(url)
h = uri.read
gz = Zlib::GzipReader.new(StringIO.new(h))
des = gz.read
#h = Net::HTTP.get(uri)
ewkb = JSON.parse(des)

if (ewkb.class != Array || ewkb[0].class != Hash ||
    ewkb[0]["osm_id"].class != Integer ||
    ewkb[0]["geom"].class != String ) 
  puts "Debería ser un archivo JSON EWKB"
  exit(1)
end

id = ewkb[0]["osm_id"]
if (id < 0) 
  id = id*-1
end
g = ewkb[0]["geom"]
if (g[0] != '\\' || g[1] != 'x') 
  puts "Atributo geom no tiene sintaxis esperada"
  exit(1)
end


col.osm_frontera = ewkb[0]["geom"][2..-1]
col.save

r = Sip::Pais.connection.execute (
  "SELECT st_isvalid(osm_frontera::geometry) FROM sip_pais "\
  "WHERE id=#{col.id}")
puts "Valido: #{r[0]["st_isvalid"]}"

# El shp del MGN del DANE 2021 tiene un archivo prj que corresponde al que se
# puede descargar de https://spatialreference.org/ref/epsg/4686/
# Por lo que consideramos que el SRI es 4686.
#
