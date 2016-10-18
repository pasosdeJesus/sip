# Completa campos con información geográfica que se carga con AJAX

# Busca un campo similar a idactual pero remplazando id_tipoactual por 
# id_tipobuscado
@busca_campo_similar = (idactual, tipoactual, tipobuscado) ->
  idb = idactual.replace('id_' + tipoactual, 'id_' + tipobuscado)
  if idb != idactual && $('#' + idb).size()>0
    return idb
  idb = idactual.replace(tipoactual + '_id', tipobuscado + '_id')
  if idb != idactual && $('#' + idb).size()>0
    return idb
  idb = idactual.replace('_' + tipoactual, '_' + tipobuscado)
  if idb != idactual && $('#' + idb).size()>0
    return idb
  return ""

# Llena coordenada con datos de latitud y longitud genericos de
# acuerdo al departamento, municipio o clase suministrados en tabla, id
@pone_coord = (root, tabla, id, nomcampo) ->
  switch tabla
    when 'pais' then modelo='paises'
    when 'departamento' then modelo='departamentos'
    when 'municipio' then modelo='municipios'
    when 'clase' then modelo='clases'
    else return

  idlat = nomcampo.replace('id_' + tabla, 'latitud')
  lat = $('#' + idlat)
  idlon = nomcampo.replace('id_' + tabla, 'longitud')
  lon = $('#' + idlon)
  if (lat.length > 0 && lon.length > 0) 
    y = $.getJSON(root.puntomontaje + "admin/" + modelo + "/" + id + ".json", {id: id})
    y.done((data) -> 
      if (data.length > 0) 
        data = data.pop()
      if (+data.latitud != 0)
        nla = +data.latitud + Math.random()/1000-0.0005
        lat.val(nla)
      if (+data.longitud != 0)
        nlo = +data.longitud + Math.random()/1000-0.0005
        lon.val(nlo)
    );
    y.error((m1, m2, m3) ->
      if (m1.responseText.indexOf("Acceso no autorizado") >=0) 
        alert("Se requiere autenticación")
      else 
        alert('Problema leyendo ' + tabla + ", id=" + id + ". " + m1 + m2 + m3)
    )



#  Completa departamento
@llena_departamento = ($this, root, sincoord=false) -> 
  sip_arregla_puntomontaje(root)
  idpais = $this.attr('id')
  iddep = busca_campo_similar(idpais, 'pais', 'departamento')
  idmun = busca_campo_similar(idpais, 'pais', 'municipio')
  idcla = busca_campo_similar(idpais, 'pais', 'clase')
  pais = $this.val()
  if (+pais > 0 && iddep) 
      x = $.getJSON(root.puntomontaje + "admin/departamentos", {id_pais: pais})
      x.done((data) -> 
          op = '<option value=""></option>'
          $.each( data, ( i, item ) -> 
              op += '<option value="' + 
                item.id + '">' + item.nombre + '</option>'
          )
          $('#' + iddep).html(op) 
          $('#' + iddep).attr('disabled', false) 
          $('#' + idmun).html('') if idmun
          $('#' + idmun).attr('disabled', true) if idmun 
          $('#' + idcla).html('') if idcla
          $('#' + idcla).attr('disabled', true) if idcla
      )
      x.error((m1, m2, m3) -> 
          alert(
              'Problema leyendo Departamentos de ' + pais + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      if (sincoord != true && root.sip_sincoord != true) 
        pone_coord(root, 'pais', pais, idpais)
  else
      $("#" + iddep).val("") if iddep
      $("#" + iddep).attr("disabled", true) if iddep
      $("#" + idmun).val("") if idmun
      $("#" + idmun).attr("disabled", true) if idmun
      $("#" + idcla).val("") if idcla
      $("#" + idcla).attr("disabled", true) if idcla



#  Completa municipio.
@llena_municipio = ($this, root, sincoord=false) -> 
  sip_arregla_puntomontaje(root)
  iddep = $this.attr('id')
  idpais = busca_campo_similar(iddep, 'departamento', 'pais')
  idmun = busca_campo_similar(iddep, 'departamento', 'municipio')
  idcla = busca_campo_similar(iddep, 'departamento', 'clase')
  dep = $this.val()
  if (+dep > 0 && idmun != '') 
      x = $.getJSON(root.puntomontaje + "admin/municipios", {id_departamento: dep})
      x.done((data) -> 
          op = '<option value=""></option>'
          $.each( data, ( i, item ) -> 
              op += '<option value="' + 
                item.id + '">' + item.nombre + '</option>'
          )
          $("#" + idmun ).html(op) if idmun
          $("#" + idmun).attr("disabled", false) if idmun
          $("#" + idcla).html('') if idcla
          $("#" + idcla).attr("disabled", true) if idcla
      )
      x.error((m1, m2, m3) -> 
          alert(
              'Problema leyendo Municipios de ' + dep + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      if (sincoord != true && root.sip_sincoord != true) 
        pone_coord(root, 'departamento', dep, iddep)
  else
      $("#" + idmun).val("") if idmun
      $("#" + idmun).attr("disabled", true) if idmun
      $("#" + idcla).val("") if idcla
      $("#" + idcla).attr("disabled", true) if idcla


# Completa cuadro de selección para clase de acuerdo a depto y mcpio.
@llena_clase = ($this, root, sincoord=false) -> 
  sip_arregla_puntomontaje = (root)
  idmun = $this.attr('id')
  idpais = busca_campo_similar(idmun, 'municipio', 'pais')
  iddep = busca_campo_similar(idmun, 'municipio', 'departamento')
  idcla = busca_campo_similar(idmun, 'municipio', 'clase')
  mun = $this.val()
  if (+mun > 0 && idcla != '') 
    x = $.getJSON(root.puntomontaje + "admin/clases", {id_municipio: mun})
    x.done( ( data ) ->
      op = '<option value=""></option>';
      $.each( data, ( i, item ) ->
        op += '<option value="' + item.id + '">' + item.nombre + '</option>';
      )
      $("#" + idcla).html(op) if idcla
      $("#" + idcla).attr("disabled", false) if idcla
    )
    x.error( (m1, m2, m3) ->
      alert('Problema leyendo Clase ' + x + m1 + m2 + m3)
    )
    if (sincoord != true && root.sip_sincoord != true) 
      pone_coord(root, 'municipio', mun, idmun)
  else
    $("#" + idcla).html("") if idcla
    $("#" + idcla).attr("disabled", true) if idcla

