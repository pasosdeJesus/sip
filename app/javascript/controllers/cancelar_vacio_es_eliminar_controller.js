import { Controller } from "@hotwired/stimulus"

// Conecta con data-controller="sip--cancelar-vacio-es-eliminar"
export default class extends Controller {

  static targets = [
    'boton',
    'determinador'
  ]

  connect() {
  }

  talvezEliminar(evento) { 
    console.log('cargar en cargador_de_contenido2 con idcaso=', evento)
    var nombre = document.querySelector('#caso_victima_attributes_0_persona_attributes_nombres')
    
    if (!this.hasDeterminadorTarget) {
      return
    }
    var borrar = true
    this.determinadorTargets.forEach((d) => {
      if (d.value != '') {
        borrar = false
      }
    })
    var purl = window.puntomontaje
    if (purl == '/') {
      purl = ''
    }
    if (borrar) {
      var id = evento.params.id
      var urlparcial = evento.params.urlparcial
      this.botonTarget.setAttribute('data-method', 'delete')
      var url = purl + '/' + urlparcial + '/' + id
      url = url.replace(/\/\/*/g, '/')
      this.botonTarget.setAttribute('href', url)
      debugger
    }
  }

}
