
col = Sip::Pais.find(170)
col.osm_id = 120027
url= "https://osm-boundaries.com/Download/Submit?apiKey=b262e6173affdde34a7220e85f9967e6&db=osm20220808&osmIds=-#{col.osm_id}&format=GeoJSON&srid=4326"

uri = URI.parse(url)
h = Net::HTTP.get(uri)
ewkb = JSON.parse(h)

debugger
#if (ewkb != 'object' || typeof ewkb[0] != 'object' ||
#  typeof ewkb[0]["osm_id"] != 'number' || 
#  typeof ewkb[0]["geom"] != 'string' ) {
#  bitacora("Debería ser un archivo JSON EWKB")
#  process.exit(1)
#}
#
#id = ewkb[0].osm_id
#if (id < 0) {
#	id = id*-1
#}
#g = ewkb[0].geom
#if (g[0] != '\\' || g[1] != 'x') {
#  bitacora("Atributo geom no tiene sintaxis esperada");
#  process.exit(1)
#}
#
#console.log("UPDATE sip_departamento SET osm_id=", id, ",")
#console.log("  osm_frontera='" + ewkb[0].geom.slice(2) + "'")
#console.log("  WHERE id=OJO;")
