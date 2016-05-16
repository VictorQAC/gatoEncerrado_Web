package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.xtrest.api.annotation.Controller

@Controller
class gatoEncerradoController {
	val GatoEncerradoModel sistema = new GatoEncerradoModel()
	//val SistemaWebAppModel sistemaWeb = new SistemaWebAppModel(sistema)
	extension JSONUtils = new JSONUtils
	
	
	@Get("/laberintos")
	def laberintosGet(String idUsuario) {
		val respuesta = new Servicio(sistema.listaLaberintos)
		
		ok((respuesta.listaDeLaberintosMinimizados()).toJson)
	}
	
	@Get("/iniciarLaberinto")
	def iniciarLab(String idLaberinto, String idUsuario){
		val idIntegerLab = Integer.parseInt(idLaberinto)
		var respuesta = new Servicio()
		var res =  respuesta.iniciarLaberinto(sistema.laberintoPorId(idIntegerLab))
		
		sistema.laberintoActual = idIntegerLab
		
		ok((res).toJson)
	}
	
	@Get("/realizarAcciónHabitación")
	def realizarAccion(String idHabitacion, String idAccion){
		val idIntHab = Integer.parseInt(idHabitacion)
		val idIntAccion = Integer.parseInt(idAccion)
		var respuesta = new Servicio()
		
		ok((respuesta.realizarAccionDeLaHabitacion(sistema.laberintoPorId(sistema.laberintoActual),idIntHab,idIntAccion)).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}