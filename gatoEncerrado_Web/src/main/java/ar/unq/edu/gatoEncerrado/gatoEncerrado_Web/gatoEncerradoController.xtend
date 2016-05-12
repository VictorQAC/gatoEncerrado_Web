package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import javax.swing.ImageIcon
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.xtrest.api.annotation.Controller
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import java.util.ArrayList

@Controller
class gatoEncerradoController {
	val GatoEncerradoModel sistema = new GatoEncerradoModel()
	extension JSONUtils = new JSONUtils
	
	
	@Get("/laberintos")
	def laberintosGet(String idUsuario) {
		val respuesta = new Servicio(sistema.listaLaberintos)
		
		ok((respuesta.listaDeLaberintosMinimizados).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}