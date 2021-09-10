
// Cambia id de los campoubi relacionados con el control de ubicacionpre
// expandible en 2 filas, que tengan id 0.
function sip_ubicacionpre_expandible_cambia_ids(campoubi, cocoonid) {
  control = $('#ubicacionpre-' + campoubi + '-0').parent()
  control.find('#ubicacionpre-' + campoubi + '-0').attr('id', 
    'ubicacionpre-' + campoubi + '-'+ cocoonid)
  control.find('#resto-' + campoubi + '-0').attr('id', 
    'resto-' + campoubi + '-'+ cocoonid)
  control.find('#restocp-' + campoubi + '-0').attr('id', 
    'restocp-' + campoubi + '-'+ cocoonid)
  b = control.find('button[data-bs-target$=' + campoubi + '-0]')
  console.log(b.attr('data-bs-target'))
  b.attr('data-bs-target', 
    '#resto-' + campoubi + '-' + cocoonid + ',#restocp-' + campoubi + '-' + 
    cocoonid)
}


function sip_ubicacionpre_expandible_maneja_evento_busca_lugar(e) {
  root = window
  ubicacionpre = $(this).closest('.ubicacionpre')
  if (ubicacionpre.length != 1) {
    alert('No se encontró ubicacionpre para ' + 
      $(this).attr('id'))
  }

  pais = ubicacionpre.find('[id$=pais_id]').val()
  dep = ubicacionpre.find('[id$=departamento_id]').val()
  mun = ubicacionpre.find('[id$=municipio_id]').val()
  clas = ubicacionpre.find('[id$=clase_id]').val()
  ubi = [pais, dep, mun, clas]
  sip_ubicacionpre_expandible_busca_lugar($(this), ubi)
}


function sip_ubicacionpre_expandible_busca_lugar(s, ubi) {
  root = window
  sip_arregla_puntomontaje(root)
  cnom = s.attr('id')
  v = $("#" + cnom).data('autocompleta')
  if (v != 1 && v != "no"){
    $("#" + cnom).data('autocompleta', 1)
    // Buscamos un div con clase div_ubicacionpre dentro del cual
    // están tanto el campo ubicacionpre_id como el campo
    // ubicacionpre_texto 
    ubipre = s.closest('.div_ubicacionpre')
    if (typeof ubipre == 'undefined'){
      alert('No se ubico .div_ubicacionpre')
      return
    }
    if ($(ubipre).find("[id$='ubicacionpre_id']").length != 1) {
      alert('Dentro de .div_ubicacionpre no se ubicó ubicacionpre_id')
      return
    }
    if ($(ubipre).find("[id$='_lugar']").length != 1) {
      alert('Dentro de .div_ubicacionpre no se ubicó ubicacionpre_texto')
      return
    }
    $("#" + cnom).autocomplete({
      source: root.puntomontaje + "ubicacionespre_lugar.json" + '?pais=' + ubi[0]+ '&dep=' + ubi[1] + '&mun=' + ubi[2] + '&clas=' + ubi[3],
      cacheLength: 0,
      minLength: 2,
      select: function( event, ui ){ 
        if (ui.item){ 
          sip_ubicacionpre_expandible_autocompleta_lugar(ui.item.clase_id, ui.item.tsitio_id, ui.item.lugar, ui.item.sitio, ui.item.latitud, ui.item.longitud, ubipre, root)
          event.stopPropagation()
          event.preventDefault()
        }
      }
    })
  }
  return
}

function sip_ubicacionpre_expandible_autocompleta_lugar(clase_id, tsit, lug, sit, lat, lon, ubipre, root){
  sip_arregla_puntomontaje(root)
  ubipre.parent().find('[id$=_clase_id]').val(clase_id).trigger('chosen:updated')
  ubipre.find('[id$=_lugar]').val(lug)
  ubipre.find('[id$=_sitio]').val(sit)
  if (lat != 0 && lat != null){
  ubipre.find('[id$=_latitud]').val(lat)
  }
  if (lon != 0 && lon != null){
  ubipre.find('[id$=_longitud]').val(lon)
  }
  if (tsit != null){
    ubipre.find('[id$=_tsitio_id]').val(tsit).trigger('chosen:updated')
  }
  $(document).trigger("sip:autocompletada-ubicacionpre")
  return
}


function deshabilita_otros_sinohaymun(e, campoubi){
  ubp = $(e.target).closest('.ubicacionpre')
  lugar = ubp.find('[id$='+campoubi+'_lugar]')
  sitio = ubp.find('[id$='+campoubi+'_sitio]')
  tsitio = ubp.find('[id$='+campoubi+'_tsitio_id]')
  latitud = ubp.find('[id$='+campoubi+'_latitud]')
  longitud = ubp.find('[id$='+campoubi+'_longitud]')
  lugar.val("")
  lugar.attr('disabled', true).trigger('chosen:updated')
  sitio.val(null)
  sitio.attr('disabled', true).trigger('chosen:updated')
  tsitio.val(1)
  tsitio.attr('disabled', true).trigger('chosen:updated')
  latitud.val("")
  latitud.attr('disabled', true).trigger('chosen:updated')
  longitud.val("")
  longitud.attr('disabled', true).trigger('chosen:updated')
}

function habilita_otros_sihaymun(e, tipo, campoubi){
  ubp = $(e.target).closest('.ubicacionpre')
  lugar = ubp.find('[id$='+campoubi+'_lugar]')
  sitio = ubp.find('[id$='+campoubi+'_sitio]')
  tsitio = ubp.find('[id$='+campoubi+'_tsitio_id]')
  latitud = ubp.find('[id$='+campoubi+'_latitud]')
  longitud = ubp.find('[id$='+campoubi+'_longitud]')
  if(tipo == 1){
    lugar.attr('disabled', false).trigger('chosen:updated')
    tsitio.attr('disabled', false).trigger('chosen:updated')
  }
  if(tipo == 2){
    sitio.attr('disabled', false).trigger('chosen:updated')
    latitud.attr('disabled', false).trigger('chosen:updated')
    longitud.attr('disabled', false).trigger('chosen:updated')
  }
}

// iniid Inicio de identificacion por ejemplo 'caso_migracion_attributes'
// campoubi Identificación particular del que se registra por ejemplo 'salida'
//    (teniendo en cuenta que haya campos para el mismo, por ejemplo
//    uno terminado en salida_lugar).
// root Raiz
function sip_ubicacionpre_expandible_registra(iniid, campoubi, root) {
  sip_arregla_puntomontaje(root)

  // Buscador en campo lugar
  $(document).on('focusin', 
    'input[id^=' + iniid + '][id$=_' + campoubi + '_lugar]', 
    sip_ubicacionpre_expandible_maneja_evento_busca_lugar
  )

  // Cambia coordenadas al cambiar pais
  $(document).on('change', 
    '[id^=' + iniid + '][id$=' + campoubi + '_pais_id]', function (evento) {
      fija_coordenadas(evento, campoubi, $(this), "paises")
      deshabilita_otros_sinohaymun(evento, campoubi)
    }
  )

  // Cambia coordenadas y deshabilita otros campos al cambiar departamento
  $(document).on('change', 
    '[id^=' + iniid + '][id$=' + campoubi + '_departamento_id]', 
    function (evento) {
      if($(this).val() == "") {
        ubp = $(evento.target).closest('.ubicacionpre')
        pais = ubp.find('[id$='+campoubi+'_pais_id]')
        fija_coordenadas(evento, campoubi, pais, "paises")
      } else {
        fija_coordenadas(evento, campoubi, $(this), "departamentos")
      }
      deshabilita_otros_sinohaymun(evento, campoubi)
    })

  // Cambia coordenadas y habilita otros campos al cambiar municipio
  $(document).on('change', 
    '[id^=' + iniid + '][id$=' + campoubi + '_municipio_id]', 
    function (evento) {
      if($(this).val() == '') {
        ubp = $(evento.target).closest('.ubicacionpre')
        dep = ubp.find('[id$='+campoubi+'_departamento_id]')
        fija_coordenadas(evento, campoubi, dep, "departamentos")
        deshabilita_otros_sinohaymun(evento, campoubi)
      }else{
        fija_coordenadas(evento, campoubi, $(this), "municipios")
        habilita_otros_sihaymun(evento, 1, campoubi)
      }
    })

  // Cambia coordenadas y habilita otros campos al cambiar centro poblado
  $(document).on('change', 
    '[id^=' + iniid + '][id$=' + campoubi + '_clase_id]', 
    function (evento) {
      if($(this).val()==""){
        ubp = $(evento.target).closest('.ubicacionpre')
        mun = ubp.find('[id$='+campoubi+'_municipio_id]')
        fija_coordenadas(evento, campoubi, mun, "municipios")
      }else{
        fija_coordenadas(evento, campoubi, $(this), "clases")
      }
      habilita_otros_sihaymun(evento, 1, campoubi)
    })

  // Habilita otros campos al cambiar lugar
  $(document).on('change', 
    '[id^=' + iniid + '][id$=' + campoubi + '_lugar]', 
    function (evento) {
      habilita_otros_sihaymun(evento, 2, campoubi)
    }
  )

}

