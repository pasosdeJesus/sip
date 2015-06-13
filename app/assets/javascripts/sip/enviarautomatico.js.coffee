# Envia formulario cuando cambian campos que tienen data-enviarautomatico
#//= require sip/motor

# http://stackoverflow.com/questions/4214731/coffeescript-global-variables
@root = exports ? this

$(document).on 'ready page:load',  -> 
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

