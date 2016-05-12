package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion

class LaberintoMinimizado{
	@Accessors
	String idLaberinto
	@Accessors
	String nombreLaberinto
	@Accessors
	String path

}

class Servicio{
	val List<Laberinto> listLaberinto 
	
	new(List<Laberinto> listLab){
		listLaberinto = listLab
	}
	
	def List<LaberintoMinimizado> listaDeLaberintosMinimizados(){
		var List<LaberintoMinimizado> res = new ArrayList
		for(Laberinto lab: listLaberinto){
			var LaberintoMinimizado mini = new LaberintoMinimizado
			mini.idLaberinto = lab.id.toString
			mini.nombreLaberinto = lab.nombreLaberinto
			mini.path = lab.rutaImagen
			res.add(mini)
		}
		return res
	}
}