'use strict';

// Motor con funciones en Javascript ES6 puro (sin CoffeeScript y sin jQuery)
// Capitalización Camello. Comienzan con Sip sigue Verbo en infinitivo y más.

/*!
 * Serializa valores de un formulario en un arreglo
 * Idea de serializeArray de jQuery, implemantación basada en
 * https://vanillajstoolkit.com/helpers/serializearray/
 * FormData debería dejar esto obsoleto
 **/
function SipSerializarFormularioEnArreglo(formulario) {
  var arr = [];
  Array.prototype.slice.call(formulario.elements).forEach(function (campo) {
    if (!campo.name || campo.disabled || 
      ['file', 'reset', 'submit', 'button'].indexOf(campo.type) > -1) return;
    if (campo.type === 'select-multiple') {
      Array.prototype.slice.call(campo.options).forEach(function (opcion) {
        if (!opcion.selected) return;
        arr.push({
          name: campo.name,
          value: opcion.value
        });
      });
      return;
    }
    if (['checkbox', 'radio'].indexOf(campo.type) >-1 && !campo.checked) return;
    arr.push({
      name: campo.name,
      value: campo.value
    });
  });
  return arr;
};



/* Convierte arreglo (como el producido por SipSerializarFormularioEnArreglo)
 * en una cadena apta para enviar consulta.
 * Con base en jQuery.param
 * https://github.com/jquery/jquery-dist/blob/main/src/serialize.js
 */
function SipConvertirArregloAParam(a) {
  if ( a == null || !Array.isArray( a ) ) {
    return "";
  }

  s = [];
  for(var i = 0; i < a.length; i++) {
    s[ s.length ] = encodeURIComponent( a[i].name ) + "=" +
      encodeURIComponent( a[i].value == null ? "" : a[i].value );

  }

  // Retorna serialización resultante
  return s.join( "&" );
};


/** Enviar AJAX
 * @param url Url
 * @param datos Cuerpo
 */
function SipEnviarAjax(url, datos, metodo='GET', tipo='script', 
  alertaerror=true) {
  var root =  window
  var t = Date.now()
  var d = -1
  if (root.SipEnviarAjaxTestigo) {
    d = (t - root.SipEnviarAjaxTestigo)/1000
  }
  root.SipEnviarAjaxTestigo = t
  if (d == -1 || d > 2) {
    var enc = {}
    if (document.querySelector('meta[name="csrf-token"]') != null) {
      enc['X-CSRF-Token'] = document.
        querySelector('meta[name="csrf-token"]').getAttribute('content')
    }
    if (tipo == 'script') {
      // https://stackoverflow.com/questions/44803944/can-i-run-a-js-script-from-another-using-fetch
      const promesaScript = new Promise((resolve, reject) => {
          const script = document.createElement('script');
          document.body.appendChild(script);
          script.onload = resolve;
          script.onerror = reject;
          script.async = true;
          script.src = url;
      });

      promesaScript
        .then(resultado => {
          console.log('Éxito:', resultado);
        })
        .catch(error => {
          console.error('Error:', error);
          if (alertaerror) {
            alert('Error: el servicio respondió: ' + error)
          }
        });

    } else {
      if (tipo == 'json') {
        enc['Content-Type'] = 'application/json'
      } else if (tipo == 'texto') {
        enc['Content-Type'] = 'text/plain'
      } else if (tipo == 'html') {
        enc['Content-Type'] = 'text/html'
      } else {
        alert('Tipo desconocido: ' + tipo)
        return;
      }

      fetch(url, {
        method: metodo,
        mode: 'cors', // no-cors, *cors, same-origin
        cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
        credentials: 'same-origin', // include, *same-origin, omit
        headers: enc,
        redirect: 'follow', // manual, *follow, error
        referrerPolicy: 'no-referrer', // no-referrer, *no-referrer-when-downgrade, origin, origin-when-cross-origin, same-origin, strict-origin, strict-origin-when-cross-origin, unsafe-url
        body: datos
      })
        .then(respuesta => respuesta.json())
        .then(resultado => {
          console.log('Éxito:', resultado);
        })
        .catch(error => {
          console.error('Error:', error);
          if (alertaerror) {
            alert('Error: el servicio respondió: ' + error)
          }
        });
    }
  }
  return
  }


/** Envia datos de un formulario empleando AJAX
 * @param f Formulario
 */
function SipEnviarFormularioAjax(f, metodo='GET', tipo='script', 
  alertaerror=true, vcommit='Enviar', agenviarautom = true) {

  var a = f.getAttribute('action')
  const datosFormulario = new FormData(f);
  datosFormulario.append('commit', vcommit)
  if (agenviarautom) {
    datosFormulario.push('_sip_enviarautomatico', 1)
  }
  SipEnviarAjax(a, datosFormulario, metodo, tipo, alertaerror)
}


// MACHETE PARA MEDIO SOPORTAR PAQUETES ESTILO COMMONJS EN NAVEGADOR
// REQUIRE CAMBIAR USOS QUE SE HACIAN DE root = exports PARA QUE SEAN root =
// window
exports = {}
module = { exports: exports}

