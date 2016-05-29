'use strict';
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

app.factory('Libros', function($resource) {
    return $resource('/log', {
    	'get' : { method: 'GET', isArray: true, params:{ 'nombreUsuario': '@nombreUsuario', 'contrasenia': '@contrasenia' } }
    });
})


app.controller('LoginController', [ '$scope', '$location', 'Libros', '$resource', function($scope, $location, Libros, $resource) {
	
	$scope.nombreUsuario = "";
	$scope.contrasenia = "";

	$scope.logIn = function() {
		Libros.get( {nombreUsuario: $scope.nombreUsuario, contrasenia: $scope.contrasenia},
			function(response) {
				$location.path("/seleccionar");
			},
			function(err) {
				alert(err.data);
			}
		)
	}
}])

app.controller('SeleccionarController', ['$scope', '$http', function ($scope, $http) {

  $http.get("http://localhost:9000/laberintos")
  .then(
    function(response) {
      $scope.laberintos = response.data;
    },
    function(response) {
      $scope.laberintos = response.statusText;
    }
  );

}])

app.controller('JugarController', ['$scope', function ($scope) {
	
	$scope.valor = "PROBANDO";
	
}])

app.controller('OtroController', [ '$scope', function ($scope) {
	
	$scope.test = 0;
	
}])

;