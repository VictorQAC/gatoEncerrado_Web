var app = angular.module('LaberintosApp', ['ngRoute', 'ngResource'])

app.config(function($routeProvider) {
	$routeProvider
	
	.when('/', {
		templateUrl : '../html/login.html',
		controller : 'OtroController'
	})
	
	.when('/seleccionar', {
		templateUrl : '../html/JugarEnLaHabitacion.html',
		controller : 'JugarController'
	})
	
	.otherwise({ redirectTo: '../html/404' })
	
})
;