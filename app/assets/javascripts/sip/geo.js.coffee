# Completa campos con información geográfica que se carga con AJAX

# Busca un campo similar a idactual pero remplazando id_tipoactual por 
# id_tipobuscado
@busca_campo_similar = (idactual, tipoactual, tipobuscado) ->
  idb = idactual.replace('id_' + tipoactual, 'id_' + tipobuscado)
  if idb != idactual && $('#' + idb).length > 0
    return idb
  idb = idactual.replace(tipoactual + '_id', tipobuscado + '_id')
  if idb != idactual && $('#' + idb).length > 0
    return idb
  idb = idactual.replace('_' + tipoactual, '_' + tipobuscado)
  if idb != idactual && $('#' + idb).length > 0
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
  if idlat != nomcampo && idlon != nomcampo && lat.length > 0 && lon.length > 0
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
    y.fail((m1, m2, m3) ->
      if (m1.responseText.indexOf("Acceso no autorizado") >=0) 
        alert("Se requiere autenticación")
      else 
        alert('Problema leyendo ' + tabla + ", id=" + id + ". " + m1 + m2 + m3)
    )

#  Completa departamento
@llena_departamento_congancho = ($this, root, sincoord, datosgancho, ubigancho) ->
  sip_arregla_puntomontaje(root)
  idpais = $this.attr('id')
  iddep = busca_campo_similar(idpais, 'pais', 'departamento')
  idmun = busca_campo_similar(idpais, 'pais', 'municipio')
  idcla = busca_campo_similar(idpais, 'pais', 'clase')
  pais = $this.val()
  if (+pais > 0 && iddep) 
      x = $.getJSON(root.puntomontaje + "admin/departamentos", {id_pais: pais})
      x.done((data) ->
        sip_remplaza_opciones_select(iddep, data, true, 'id', 'nombre', true)
        $('#' + iddep).attr('disabled', false) 
        $('#' + iddep).trigger('chosen:updated')
        $("#" + idmun + " option[value='']").attr('selected', true) if idmun
        $('#' + idmun).attr('disabled', true) if idmun 
        $('#' + idmun).trigger('chosen:updated')
        $("#" + idcla + " option[value='']").attr('selected', true) if idcla
        $('#' + idcla).attr('disabled', true) if idcla
        $('#' + idcla).trigger('chosen:updated')
        id_ub = datosgancho[0].id
        if (ubigancho != null )
          ubigancho.val(id_ub).trigger('chosen:updated')
        else
          alert('Departamento no Encontrado')
      )
      x.fail((m1, m2, m3) -> 
          alert(
              'Problema leyendo Departamentos de ' + pais + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      if (sincoord != true && root.sip_sincoord != true) 
        pone_coord(root, 'pais', pais, idpais)
  else
      $("#" + iddep).val("") if iddep
      $("#" + iddep).attr("disabled", true) if iddep
      $('#' + iddep).trigger('chosen:updated')
      $("#" + idmun).val("") if idmun
      $("#" + idmun).attr("disabled", true) if idmun
      $('#' + idmun).trigger('chosen:updated')
      $("#" + idcla).val("") if idcla
      $("#" + idcla).attr("disabled", true) if idcla
      $('#' + idcla).trigger('chosen:updated')

@llena_departamento = ($this, root, sincoord=false) ->
  llena_departamento_congancho($this, root, sincoord, null, null)

#  Completa municipio.
@llena_municipio_congancho = ($this, root, sincoord, datosgancho, ubigancho) ->
  sip_arregla_puntomontaje(root)
  iddep = $this.attr('id')
  idpais = busca_campo_similar(iddep, 'departamento', 'pais')
  idmun = busca_campo_similar(iddep, 'departamento', 'municipio')
  idcla = busca_campo_similar(iddep, 'departamento', 'clase')
  dep = $this.val()
  if (+dep > 0 && idmun != '') 
      x = $.getJSON(root.puntomontaje + "admin/municipios", {id_departamento: dep})
      x.done((data) -> 
        sip_remplaza_opciones_select(idmun, data, true, 'id', 'nombre', true)
        $("#" + idmun).attr("disabled", false) if idmun
        $('#' + idmun).trigger('chosen:updated')
        $("#" + idcla + " option[value='']").attr('selected', true) if idcla
        $("#" + idcla).attr("disabled", true) if idcla
        $('#' + idcla).trigger('chosen:updated')
        id_ub = datosgancho[0].id
        if (ubigancho != null )
          ubigancho.val(id_ub).trigger('chosen:updated')
        else
          alert('Municipio no Encontrado')
      )
      x.fail((m1, m2, m3) -> 
          alert(
              'Problema leyendo Municipios de ' + dep + ' ' + m1 + ' '
              + m2 + ' ' + m3)
      )
      if (sincoord != true && root.sip_sincoord != true) 
        pone_coord(root, 'departamento', dep, iddep)
  else
      $("#" + idmun).val("") if idmun
      $("#" + idmun).attr("disabled", true) if idmun
      $('#' + idmun).trigger('chosen:updated')
      $("#" + idcla).val("") if idcla
      $("#" + idcla).attr("disabled", true) if idcla
      $('#' + idcla).trigger('chosen:updated')

@llena_municipio = ($this, root, sincoord=false) ->
  llena_municipio_congancho($this, root, sincoord, null, null)

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
      sip_remplaza_opciones_select(idcla, data, true, 'id', 'nombre', true)
      $("#" + idcla).attr("disabled", false) if idcla
      $('#' + idcla).trigger('chosen:updated')
    )
    x.fail( (m1, m2, m3) ->
      alert('Problema leyendo Clase ' + x + m1 + m2 + m3)
    )
    if (sincoord != true && root.sip_sincoord != true) 
      pone_coord(root, 'municipio', mun, idmun)
  else
    $("#" + idcla + " option[value='']").attr('selected', true) if idcla
    $("#" + idcla).attr("disabled", true) if idcla
    $('#' + idcla).trigger('chosen:updated')

# Completa cuadro de selección para clase de acuerdo a depto y mcpio.
@pone_tipourbano = ($this) -> 
  idcla = $this.attr('id')
  idts = busca_campo_similar(idcla, 'clase', 'tsitio')
  cla = $this.val()
  if (+cla > 0 && idcla != '') 
    $("#" + idts + " option[value='2']").prop('selected', true)

