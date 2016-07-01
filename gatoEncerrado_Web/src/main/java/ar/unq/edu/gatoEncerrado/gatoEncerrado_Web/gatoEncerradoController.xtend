package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import org.uqbar.xtrest.api.annotation.Controller
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel

@Controller
class gatoEncerradoController {
	val GatoEncerradoModel sistema = new GatoEncerradoModel()
	extension JSONUtils = new JSONUtils

	@Get("/log")
	def Result logIn(String nombreUsuario, String contrasenia) {
		val usuarioNombre = "matayas";
		val usuarioContrasenia = "pass";

		if ((nombreUsuario.toString == usuarioNombre) && (contrasenia.toString == usuarioContrasenia)) {
			ok("EstaAutenticado");
		} else {
			return notFound("No existe ese usuario");
		}
	}

	@Get("/laberintos")
	def laberintosGet() {
			val respuesta = new Servicio(sistema.listaLaberintos)
			ok((respuesta.listaDeLaberintosMinimizados()).toJson)
	}

	@Get("/iniciarLaberinto/:idLaberinto")
	def iniciarLab(String idUsuario) {
			val idIntegerLab = Integer.parseInt(idLaberinto)

			var respuesta = new Servicio()
			var res = respuesta.iniciarLaberinto(sistema, idIntegerLab, idUsuario.toString )

			ok((res).toJson)
	}

	@Get("/realizarAcciónHabitación")
	def realizarAccion(String idHabitacion, String idAccion, String idUsuario) {
		val idIntHab = Integer.parseInt(idHabitacion)
		val idIntAccion = Integer.parseInt(idAccion)
		var respuesta = new Servicio()

		ok((respuesta.realizarAccionDeLaHabitacion(sistema, idIntHab, idIntAccion, idUsuario.toString)).toJson)
	}

	/*
	 *	METODOS REST PARA ANDROID 
	 */

	@Get("/laberintosAndroid")
	def traerLaberintos() {
		val respuesta = new Servicio(sistema.listaLaberintos)
		ok((respuesta.listaLaberintosAndroid().toJson))
	}
	
	@Get("/detalleLaberinto")
	def traerLaberintoSegunNombre(String nombreLaberinto) {
		var respuesta = new Servicio()
		
		ok((respuesta.detallesLaberintoAndroid(sistema, nombreLaberinto).toJson))
	}
	
	@Get("/inventario")
	def traerInventario() {
		val respuesta = new Servicio()
		ok((respuesta.inventarioAndroid(sistema).toJson))
	}
	
	@Get("/eliminarItem")
	def eliminarItemInventario(String nombreItem) {
		val respuesta = new Servicio
		ok((respuesta.eliminarItemDelInventario(sistema, nombreItem).toJson))
	}

	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}
