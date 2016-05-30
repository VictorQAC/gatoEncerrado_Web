var app = angular.module('LaberintosApp', ['ngRoute', 'ngResource'])

app.config(function($routeProvider) {
	$routeProvider
	
	.when('/', {
		templateUrl : '../html/login.html',
		controller : 'LoginController'
	})
	
	.when('/seleccionar', {
		templateUrl : '../html/seleccionarLaberinto.html',
		controller : 'SeleccionarController'
	})
	
	.when('/seleccionar/:id', {
		templateUrl : '../html/jugarLaberinto.html',
		controller : 'JugarController'
	})
	
	.otherwise({ templateUrl : '../html/404.html' })
});
