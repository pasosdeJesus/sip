
#//= require sip/libsip

$(document).on 'ready page:load',  -> 
  root = exports ? this
  prepara_eventos_comunes_sip(root)
  return
