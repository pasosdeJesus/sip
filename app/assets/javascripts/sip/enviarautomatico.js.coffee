# Envia formulario cuando cambian campos que tienen data-enviarautomatico

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


$(document).on 'ready page:load',  -> 
  root = exports ? this
  $('[data-behaviour~=datepicker]').datepicker({
    format: 'yyyy-mm-dd'
    autoclose: true
    todayHighlight: true
    language: 'es'	
  });
  $(document).on('change', 'select[data-enviarautomatico]', 
    (e) -> 
      enviarautomatico_formulario(root, $(e.target.form))
  )
  #$(document).on('changeDate', '[data-enviarautomatico]', 
  #  (e) -> 
  #    if (fecha_valida(e.target.value))
  #      enviarautomatico_formulario(root, $(e.target.form))
  #)
  $(document).on('change', 'input[data-enviarautomatico]', 
    (e) -> 
      #debugger
      # No procesa selección de fecha, pero si cuando se teclea
      #if typeof $(e.target).attr('data-behaviour') == 'undefined' || e.bubbles
      enviarautomatico_formulario(root, $(e.target.form))
  )

