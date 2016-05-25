package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.xtrest.api.annotation.Controller

@Controller
class gatoEncerradoController {
	val GatoEncerradoModel sistema = new GatoEncerradoModel()
	extension JSONUtils = new JSONUtils
	
	
	@Get("/laberintos")
	def laberintosGet(String idUsuario) {
		val respuesta = new Servicio(sistema.listaLaberintos)
		
		ok((respuesta.listaDeLaberintosMinimizados()).toJson)
	}
	
	@Get("/iniciarLaberinto")
	def iniciarLab(String idLaberinto, String idUsuario){
		val idIntegerLab = Integer.parseInt(idLaberinto)
		val idIntUsuario = Integer.parseInt(idUsuario)
		
		var respuesta = new Servicio()
		var res =  respuesta.iniciarLaberinto(sistema,idIntUsuario,idIntegerLab)
		
		
		ok((res).toJson)
	}
	
	@Get("/realizarAcciónHabitación")
	def realizarAccion(String idHabitacion, String idAccion,String idUsuario){
		val idIntHab = Integer.parseInt(idHabitacion)
		val idIntAccion = Integer.parseInt(idAccion)
		val idIntUsuario = Integer.parseInt(idUsuario)
		var respuesta = new Servicio()
		
		ok((respuesta.realizarAccionDeLaHabitacion(sistema,idIntHab,idIntAccion,idIntUsuario)).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}