// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import Sip__CancelarVacioEsEliminarController from "./sip/cancelar_vacio_es_eliminar_controller"
application.register("sip--cancelar-vacio-es-eliminar", Sip__CancelarVacioEsEliminarController)

import Sip__SindocautController from "./sip/sindocaut_controller"
application.register("sip--sindocaut", Sip__SindocautController)