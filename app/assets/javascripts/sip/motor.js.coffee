# vim: set expandtab tabstop=2 shiftwidth=2 fileencoding=utf-8:
# 
# Por compartir entre motores que operen sobre sip

#//= require jquery
#//= require jquery_ujs
#//= require jquery-ui/autocomplete
#//= require bootstrap-datepicker
#//= require twitter/bootstrap
#//= require turbolinks
#//= require cocoon
#//= require sip/geo


# AUTOCOMPLETACIÓN PERSONA
# Elije una persona en autocompletación
@autocompleta_persona = (label, id, id_victima, divcp) ->
  cs = id.split(";")
  id_persona = cs[0]
  pl = []
  ini = 0
  for i in [0..cs.length] by 1
     t = parseInt(cs[i])
     pl[i] = label.substring(ini, ini + t)
     ini = ini + t + 1
  # pl[1] cnom, pl[2] es cape, pl[3] es cdoc
  d = "id_victima=" + id_victima
  d += "&id_persona=" + id_persona
  a = '/personas/remplazar'
  $.ajax(url: a, data: d, dataType: "html").fail( (jqXHR, texto) ->
    alert("Error con ajax " + texto)
  ).done( (e, r) ->
    divcp.html(e)
    return
  )
  return

# Busca persona por nombre, apellido o identificación
# s es objeto con foco donde se busca persona
@busca_persona_nombre = (s) ->
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no") 
    $("#" + cnom).data('autocompleta', 1)
    divcp = s.closest('.campos_persona')
    if (typeof divcp == 'undefined')
      alert('No se ubico .campos_persona')
      return
    idvictima = divcp.parent().find('.caso_victima_id').find('input').val()
    if (typeof idvictima == 'undefined')
      alert('No se ubico .caso_victima_id')
      return
    $("#" + cnom).autocomplete({
      source: "/personas.json",
      minLength: 2,
      select: ( event, ui ) -> 
        if (ui.item) 
          autocompleta_persona(ui.item.value, ui.item.id, idvictima, divcp)
          event.stopPropagation()
          event.preventDefault()
    })
  return

# Añade endsWith a la clase String
# http://stackoverflow.com/questions/280634/endswith-in-javascript
if (typeof String.prototype.endsWith != 'function') 
  String.prototype.endsWith = (suffix) ->
    return this.indexOf(suffix, this.length - suffix.length) != -1

# Verifica que una fecha sea válida
# De: http://stackoverflow.com/questions/8098202/javascript-detecting-valid-dates
@fecha_valida = (text) ->
  date = Date.parse(text)
  if (isNaN(date))
      return false
  comp = text.split('-')
  if (comp.length != 3)
    return false;

  y = parseInt(comp[0], 10)
  m = parseInt(comp[1], 10)
  d = parseInt(comp[2], 10)
  date = new Date(y, m - 1, d);
  return (date.getFullYear() == y && 
    date.getMonth() + 1 == m && date.getDate() == d);

# Envia con AJAX datos del formulario, junto con el botón submit.
# @param root Raiz del documento, para guardar allí variable global.
# @param f    Formulario jquery-sado
@enviarautomatico_formulario = (root, f) ->
  a = f.attr('action')
  d = f.serialize()
  d += '&commit=Enviar'
  # En ocasiones lanza 2 veces seguidas el mismo evento. 
  # Evitamos enviar lo mismo.
  if (!root.dant || root.dant != d)
    $.ajax(url: a, data: d, dataType: "script").fail( (jqXHR, texto) ->
      alert("Error con ajax " + texto)
    )
  root.dant = d 
  return

# Prepara eventos comunes al usar sip
# root es espacio para poner variables globales
@sip_prepara_eventos_comunes = (root) ->
  # Formato de campos de fecha con datepicker
  $(document).on('cocoon:after-insert', (e) ->
    $('[data-behaviour~=datepicker]').datepicker({
      format: 'yyyy-mm-dd'
      autoclose: true
      todayHighlight: true
      language: 'es'
    })
  )

  jQuery ->
    $("a[rel~=popover], .has-popover").popover()
    $("a[rel~=tooltip], .has-tooltip").tooltip()

  # Al cambiar país se recalcula lista de departamentos
  $(document).on('change', 'select[id$=_id_pais]', (e) ->
    llena_departamento($(this))
  )

  # Al cambiar departamento se recalcula lista de municipios
  $(document).on('change', 'select[id$=_id_departamento]', (e) ->
    llena_municipio($(this))
  )

  # Al cambiar municipio se recalcula lista de centros poblados
  $(document).on('change', 'select[id$=_id_municipio]', (e) ->
    llena_clase($(this))
  )

  return


