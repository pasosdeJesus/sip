import { Controller } from "@hotwired/stimulus"
// Llena automaticamente número de documento del tipo de doc. SIN DOCUMENTO
// con un número que corresponde a la identificación de la persona
// en el sistema o uno que empieza igual y termina en letras en caso de que
// ya se esté usando el mismo

export default class extends Controller {
  // Conecta con data-controller="sip--sindocaut"
  // En el campo para el tipo de documento agregar
  // data-sip--sindocaut-action='change->sip--sindocaut#cambia_tdocumento
  // En el campo con la id de la persona agregar
  // data-sip--sindocaut-target='id'
  // Y en el campo con el número de documento agregar
  // data-sip--sindocaut-target='numerodocumento'

  static targets = [ 
    "numerodocumento", 
    "id" 
  ]

  connect() {
    console.log('conectado controlador sindocaut')
  }

  cambia_tdocumento(e) {

    console.log("numerodocumento ahora es", this.numerodocumentoTarget.value)
    var purl = window.puntomontaje;
    if (purl == "/") {
      purl = "";
    }
    if (e.target.value == '11' && 
      this.numerodocumentoTarget.value == '') { // SIN DOCUMENTO
      window.Rails.ajax({
        type: 'GET',
        url: purl + '/personas/identificacionsd?persona_id=' + 
          this.idTarget.value ,
        data: null,
        success: (resp, estado, xhr) => {
          this.numerodocumentoTarget.value = resp;
        },
        error: (req, estado, xhr) => {
          window.alert('No pudo consultar identificación.')
        }
      })
    }
    else {
      this.numerodocumentoTarget.value = null;
    }

  }

}
