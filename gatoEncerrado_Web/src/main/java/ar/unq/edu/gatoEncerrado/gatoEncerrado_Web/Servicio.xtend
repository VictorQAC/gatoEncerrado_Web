package ar.unq.edu.gatoEncerrado.gatoEncerrado_Web

import ar.edu.unq.ciu.dominio_gatoEncerrado1.Laberinto
import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Habitacion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Jugador
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Inventario
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Accion
import ar.edu.unq.ciu.dominio_gatoEncerrado1.Item

class LaberintoMinimizado{
	@Accessors
	String idLaberinto
	@Accessors
	String nombreLaberinto
	@Accessors
	String path

}

class IniciarLaberinto{
	@Accessors
	String idLaberinto
	@Accessors
	List<HabitacionMinimizada> habitaciones
	@Accessors
	List<ItemDelInventarioMinimizado> inventario
	
}

class HabitacionMinimizada{
	@Accessors
	String idHabitacion
	@Accessors
	List<AccionMinimizada> listAcciones
	@Accessors
	String tipoDeHabitacion
	@Accessors
	String path
}

class AccionMinimizada{
	@Accessors
	String idAccion
	@Accessors
	String nombreAccion
}

class ItemDelInventarioMinimizado{
	@Accessors
	String idItem
	@Accessors
	String nombreItem
	@Accessors
	String descripcionItem
}

class RealizarAccionHabitacion{
	@Accessors
	String laAccionQueSeRealizoFue
}

@Accessors
class Servicio{
	var List<Laberinto> listLaberinto 
	var Laberinto laberinto
	
	new(List<Laberinto> listLab){
		listLaberinto = listLab
	}
	
	new(){
		
	}
	
	new(Laberinto lab){
		laberinto = lab
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
	
	def IniciarLaberinto iniciarLaberinto(Laberinto lab){
		var res = new IniciarLaberinto
		res.idLaberinto = lab.id.toString
		res.habitaciones = this.habitacionesMinizadas(lab.listaHabitaciones)
		res.inventario = this.inventarioMinizado(lab.inventario)
		return res
	}
	
	def List<HabitacionMinimizada> habitacionesMinizadas(List<Habitacion> habitaciones) {
		var List<HabitacionMinimizada> res = new ArrayList
		for(Habitacion hab: habitaciones){
			var HabitacionMinimizada mini = new HabitacionMinimizada
			mini.idHabitacion = hab.id.toString
			mini.listAcciones = this.accionesMinizadas(hab.listaAcciones)
			mini.tipoDeHabitacion = hab.tipo
			mini.path = hab.rutaImagen
			res.add(mini)
		}
		return res 
	}
	
	def List<AccionMinimizada> accionesMinizadas(List<Accion> acciones) {
		var List<AccionMinimizada> res = new ArrayList
		for(Accion acc: acciones){
			var AccionMinimizada mini = new AccionMinimizada
			mini.idAccion = acc.id.toString
			mini.nombreAccion = acc.nombreAccion
			res.add(mini)
		}
		return res
	}
	
	def List<ItemDelInventarioMinimizado> inventarioMinizado(Inventario inventario) {
		var List<ItemDelInventarioMinimizado> res = new ArrayList 
		for(Item itms: inventario.items ){
			var ItemDelInventarioMinimizado mini = new ItemDelInventarioMinimizado
			mini.idItem = itms.id.toString
			mini.nombreItem = itms.nombre
			mini.descripcionItem = itms.descripcion
			res.add(mini)
		}
		return res 
	}
	
	
	def RealizarAccionHabitacion realizarAccionDeLaHabitacion(Laberinto lab,Integer idHab,Integer idAccion){
		var habActual = lab.buscarHabitacionPorId(idHab)
		var accion = habActual.buscarAccionPorId(idAccion)
		
		var RealizarAccionHabitacion res = new RealizarAccionHabitacion
		res.laAccionQueSeRealizoFue =  accion.ejecutar(lab)
		
		return res
	}
	
}