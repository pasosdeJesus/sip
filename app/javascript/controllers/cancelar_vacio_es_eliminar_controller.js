import { Controller } from "@hotwired/stimulus"

// Conecta con data-controller="sip--cancelar-vacio-es-eliminar"
export default class extends Controller {
/* Convierte botón cancelar a eliminación cuando algunos campos
 * determinadores del formulario están vacíos
 *
 * 1. Conecte el formulario con este controlador con:
 *    data-controller="sip--cancelar-vacio-es-eliminar"
 * 2. Marque uno a uno los campos determinadores con
 *    data-sip--cancelar-vacio-es-eliminar-target='determinador'
 * 3. Cambie el botón cancelar para agregarle:
 *    'data-sip--cancelar-vacio-es-eliminar-target' => 'boton',
 *    'data-sip--cancelar-vacio-es-eliminar-id-param' => @registro.nil? ? '' :
 *      @registro.id.to_s,
 *    'data-sip--cancelar-vacio-es-eliminar-urlparcial-param' => '/casos/',
 *
 *     Teniendo en cuenta que:
 *       - id debe tener id del registro que se edita y que podría borrarse
 *       - urlparcial debe ser ruta a registros que permita borrar con ruta/id
 */

  static targets = [
    'boton',
    'determinador'
  ]

  connect() {
  }

  talvezEliminar(evento) { 
    if (!this.hasDeterminadorTarget) {
      return
    }
    var borrar = this.determinadorTargets.length > 0
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
    }
  }

}
