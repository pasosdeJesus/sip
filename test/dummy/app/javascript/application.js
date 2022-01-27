/* eslint no-console:0 */

console.log('Hola Mundo desde ESM')

import Rails from "@rails/ujs";
import "@hotwired/turbo-rails"
Rails.start();
window.Rails = Rails

import "./jquery"
import './jquery-ui'
import 'popper.js'              // Dialogos emergentes usados por bootstrap
import * as bootstrap from 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'

let esperarRecursosSprockets = function (resolver) {
  if (typeof window.puntomontaje == 'undefined') {
    setTimeout(esperarRecursosSprockets, 250, resolver)
    return false
  }
  resolver("otros recursos manejados con sprockets")
  return true
}

let promesaRecursosSprockets = new Promise((resolver, rechazar) => {
  esperarRecursosSprockets(resolver)
})

promesaRecursosSprockets.then((mensaje) => {

  console.log('Cargando recursos sprockets')
  var root;
  root = window;
  sip_prepara_eventos_comunes(root);
})
