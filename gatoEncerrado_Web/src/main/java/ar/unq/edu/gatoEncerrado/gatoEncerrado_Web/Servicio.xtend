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
import ar.edu.unq.ciu.dominio_gatoEncerrado1.GatoEncerradoModel

class LaberintoMinimizado{
	@Accessors
	String idLaberinto
	@Accessors
	String nombreLaberinto
	@Accessors
	String path
	@Accessors
	String descripcion
}

class ListaLaberintos {
	@Accessors
	List<LaberintoMinimizado> listaLaberintos = new ArrayList
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
	String nombreHabitacion
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
	
		
	def ListaLaberintos listaDeLaberintosMinimizados(){
		var ListaLaberintos res = new ListaLaberintos
		for(Laberinto lab: listLaberinto){
			var LaberintoMinimizado mini = new LaberintoMinimizado
			mini.idLaberinto = lab.id.toString
			mini.nombreLaberinto = lab.nombreLaberinto
			mini.path = lab.rutaImagen
			mini.descripcion = lab.descripcion
			res.listaLaberintos.add(mini)
		}
		return res
	}
	
	def IniciarLaberinto iniciarLaberinto(GatoEncerradoModel sistema, Integer idLaberinto,String idUsuario){
		
		var lab = sistema.laberintoPorId(idLaberinto)
		var jugador = sistema.buscarJugador(idUsuario)
		 
		
		var res = new IniciarLaberinto
		res.idLaberinto = lab.id.toString
		res.habitaciones = this.habitacionesMinizadas(lab.listaHabitaciones)
		res.inventario = this.inventarioMinizado(jugador.inventario)
		return res
	}
	
	def List<HabitacionMinimizada> habitacionesMinizadas(List<Habitacion> habitaciones) {
		var List<HabitacionMinimizada> res = new ArrayList
		for(Habitacion hab: habitaciones){
			var HabitacionMinimizada mini = new HabitacionMinimizada
			mini.idHabitacion = hab.id.toString
			mini.nombreHabitacion = hab.nombreHabitacion
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
	
	
	def RealizarAccionHabitacion realizarAccionDeLaHabitacion(GatoEncerradoModel sistema,Integer idHab,Integer idAccion,String idUsuario){
		var habActual = sistema.laberintoActual.buscarHabitacionPorId(idHab)
		var accion = habActual.buscarAccionPorId(idAccion)
		var jugador = sistema.buscarJugador(idUsuario)
		
		
		var RealizarAccionHabitacion res = new RealizarAccionHabitacion
		res.laAccionQueSeRealizoFue =  accion.ejecutar(sistema,jugador)
		
		return res
	}
	
}