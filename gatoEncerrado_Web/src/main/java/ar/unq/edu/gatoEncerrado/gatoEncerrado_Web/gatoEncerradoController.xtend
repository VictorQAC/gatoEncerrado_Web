package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.Result
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.xtrest.api.annotation.Controller

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
	def laberintosGet(String idUsuario) {
		if (idUsuario.toString == 'matayas') {
			val respuesta = new Servicio(sistema.listaLaberintos)
			ok((respuesta.listaDeLaberintosMinimizados()).toJson)
		} else {
			return notFound("Error trayendo los laberintos del usuario");
		}
	}

	@Get("/iniciarLaberinto/:idLaberinto")
	def iniciarLab(String idUsuario) {
		if (idUsuario.toString == 'matayas') {
			val idIntegerLab = Integer.parseInt(idLaberinto)

			var respuesta = new Servicio()
			var res = respuesta.iniciarLaberinto(sistema, idIntegerLab, idUsuario.toString )

			ok((res).toJson)
		} else {
			return notFound("Error iniciando el laberinto del usuario");
		}
	}

	@Get("/realizarAcciónHabitación")
	def realizarAccion(String idHabitacion, String idAccion, String idUsuario) {
		val idIntHab = Integer.parseInt(idHabitacion)
		val idIntAccion = Integer.parseInt(idAccion)
		var respuesta = new Servicio()

		ok((respuesta.realizarAccionDeLaHabitacion(sistema, idIntHab, idIntAccion, idUsuario.toString)).toJson)
	}

	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}
