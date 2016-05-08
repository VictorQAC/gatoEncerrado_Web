package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.XTRest
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import javax.swing.ImageIcon
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel
import org.uqbar.xtrest.api.annotation.Controller

class pedidoLaberinto{
	@Accessors
	List<String> descripcion
//	@Accessors
//	List<Integer> idLaberintos
//	@Accessors
//	List<ImageIcon> rutaImagenLaberintos
	
	new(List<String> desc){
		descripcion = desc
	}
}

@Controller
class gatoEncerradoController {
	val GatoEncerradoModel sistema = new GatoEncerradoModel()
	extension JSONUtils = new JSONUtils
	
	
	@Get("/laberintos")
	def laberintosGet(String idUsuario) {
		val pedido = new pedidoLaberinto(sistema.descripcionLaberinto)
		
		ok(((pedido.descripcion).toString).toJson)
	}
	
	
	def static void main(String[] args) {
		XTRest.start(gatoEncerradoController, 9000)
	}
}